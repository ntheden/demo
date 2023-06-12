import 'dart:async';

import 'package:drift/backends.dart';
import 'package:drift/drift.dart';

import 'sql_js.dart';
import 'storage.dart';

/// Signature of a function that asynchronously initializes a web database if it
/// doesn't exist.
/// The bytes returned should represent a valid sqlite3 database file.
typedef CreateWebDatabase = FutureOr<Uint8List> Function();

/// Signature of a function that initializes a [SqlJsDatabase] before its used
/// by drift.
typedef WebSetup = FutureOr<void> Function(SqlJsDatabase database);

/// Experimental drift backend for the web. To use this platform, you need to
/// include the latest version of `sql.js` in your html.
class WebDatabase extends DelegatedDatabase {
  /// Whether sql.js should report integers as [BigInt].
  ///
  /// Enabling this is required for [Table.int64] columns.
  final bool readIntsAsBigInt;

  /// A database executor that works on the web.
  ///
  /// [name] can be used to identify multiple databases. The optional
  /// [initializer] can be used to initialize the database if it doesn't exist.
  ///
  /// The optional [setup] function can be used to perform a setup just after
  /// the database is opened, before drift is fully ready. This can be used to
  /// add custom user-defined sql functions or to provide encryption keys in
  /// SQLCipher implementations.
  /// __Please note__: With the current web implementation, the database is
  /// closed and re-opened whenever it is stored (i.e. after every transaction
  /// or insert/update/delete outside of transactions). The [setup] parameter
  /// will also be invoked whenever the database is re-opened.
  WebDatabase(
    String name, {
    bool logStatements = false,
    CreateWebDatabase? initializer,
    WebSetup? setup,
    this.readIntsAsBigInt = false,
  }) : super(
            _WebDelegate(
                DriftWebStorage(name), initializer, setup, readIntsAsBigInt),
            logStatements: logStatements,
            isSequential: true);

  /// A database executor that works on the web.
  ///
  /// The [storage] parameter controls how the data will be stored. The default
  /// constructor of [DriftWebStorage] will use local storage for that, but an
  /// IndexedDB-based implementation is available via
  /// [DriftWebStorage.indexedDb].
  ///
  /// The optional [setup] function can be used to perform a setup just after
  /// the database is opened, before drift is fully ready. This can be used to
  /// add custom user-defined sql functions or to provide encryption keys in
  /// SQLCipher implementations.
  /// __Please note__: With the current web implementation, the database is
  /// closed and re-opened whenever it is stored (i.e. after every transaction
  /// or insert/update/delete outside of transactions). The [setup] parameter
  /// will also be invoked whenever the database is re-opened.
  WebDatabase.withStorage(
    DriftWebStorage storage, {
    bool logStatements = false,
    CreateWebDatabase? initializer,
    WebSetup? setup,
    this.readIntsAsBigInt = false,
  }) : super(_WebDelegate(storage, initializer, setup, readIntsAsBigInt),
            logStatements: logStatements, isSequential: true);
}

class _WebDelegate extends DatabaseDelegate {
  final DriftWebStorage storage;
  final CreateWebDatabase? initializer;
  final WebSetup? setup;
  final bool readIntsAsBigInt;

  late SqlJsDatabase _db;
  bool _isOpen = false;

  bool _inTransaction = false;

  _WebDelegate(
      this.storage, this.initializer, this.setup, this.readIntsAsBigInt);

  @override
  set isInTransaction(bool value) {
    _inTransaction = value;

    if (!_inTransaction) {
      // transaction completed, save the database!
      _storeDb();
    }
  }

  @override
  bool get isInTransaction => _inTransaction;

  @override
  TransactionDelegate get transactionDelegate => const NoTransactionDelegate();

  @override
  DbVersionDelegate get versionDelegate =>
      _versionDelegate ??= _WebVersionDelegate(this);
  DbVersionDelegate? _versionDelegate;

  @override
  bool get isOpen => _isOpen;

  @override
  Future<void> open(QueryExecutorUser db) async {
    final dbVersion = db.schemaVersion;
    assert(dbVersion >= 1, 'Database schema version needs to be at least 1');

    final module = await initSqlJs();

    await storage.open();
    var restored = await storage.restore();

    if (restored == null && initializer != null) {
      restored = await initializer?.call();

      if (restored != null) {
        await storage.store(restored);
      }
    }

    _db = module.createDatabase(restored);
    await setup?.call(_db);
    _isOpen = true;
  }

  void _checkArgs(List<Object?> args) {
    assert(
      readIntsAsBigInt || args.whereType<BigInt>().isEmpty,
      "You're using drift with `BigInt` columns, but this `WebDatabase` does "
      'not have them enabled. Please create your `WebDatabase` with '
      '`readIntsAsBigInt: true`.',
    );
  }

  @override
  Future<void> runBatched(BatchedStatements statements) {
    final preparedStatements = [
      for (final stmt in statements.statements) _db.prepare(stmt),
    ];

    for (final application in statements.arguments) {
      final stmt = preparedStatements[application.statementIndex];
      _checkArgs(application.arguments);

      stmt
        ..executeWith(application.arguments)
        ..step();
    }

    for (final prepared in preparedStatements) {
      prepared.free();
    }
    return _handlePotentialUpdate();
  }

  @override
  Future<void> runCustom(String statement, List<Object?> args) {
    _checkArgs(args);
    _db.runWithArgs(statement, args);
    return Future.value();
  }

  @override
  Future<int> runInsert(String statement, List<Object?> args) async {
    _checkArgs(args);
    _db.runWithArgs(statement, args);
    final insertId = _db.lastInsertId();
    await _handlePotentialUpdate();
    return insertId;
  }

  @override
  Future<QueryResult> runSelect(String statement, List<Object?> args) async {
    _checkArgs(args);
    // todo at least for stream queries we should cache prepared statements.
    final stmt = _db.prepare(statement)..executeWith(args);

    List<String>? columnNames;
    final rows = <List<dynamic>>[];

    while (stmt.step()) {
      columnNames ??= stmt.columnNames();
      rows.add(stmt.currentRow(readIntsAsBigInt));
    }

    columnNames ??= []; // assume no column names when there were no rows

    stmt.free();

    if (statement.contains('RETURNING')) {
      await _handlePotentialUpdate();
    }

    return Future.value(QueryResult(columnNames, rows));
  }

  @override
  Future<int> runUpdate(String statement, List<Object?> args) {
    _checkArgs(args);
    _db.runWithArgs(statement, args);
    return _handlePotentialUpdate();
  }

  @override
  Future<void> close() async {
    await _storeDb();
    if (_isOpen) {
      _db.close();
    }

    await storage.close();
  }

  @override
  void notifyDatabaseOpened(OpeningDetails details) {
    if (details.hadUpgrade || details.wasCreated) {
      _storeDb();
    }
  }

  /// Saves the database if the last statement changed rows. As a side-effect,
  /// saving the database resets the `last_insert_id` counter in sqlite.
  Future<int> _handlePotentialUpdate() async {
    final modified = _db.lastModifiedRows();
    if (modified > 0) {
      await _storeDb();
    }
    return modified;
  }

  Future<void> _storeDb() async {
    if (!isInTransaction) {
      await storage.store(_db.export());
      setup?.call(_db);
    }
  }
}

class _WebVersionDelegate extends DynamicVersionDelegate {
  final _WebDelegate delegate;

  _WebVersionDelegate(this.delegate);

  // Note: Earlier versions used to store the database version in a special
  // field in local storage (moor_db_version_<name>). Since 2.3, we instead use
  // the user_version pragma, but still need to keep backwards compatibility.

  @override
  Future<int> get schemaVersion async {
    final storage = delegate.storage;
    int? version;
    if (storage is CustomSchemaVersionSave) {
      version = storage.schemaVersion;
    }

    return version ?? delegate._db.userVersion;
  }

  @override
  Future<void> setSchemaVersion(int version) async {
    final storage = delegate.storage;

    if (storage is CustomSchemaVersionSave) {
      storage.schemaVersion = version;
    }

    delegate._db.userVersion = version;
  }
}
