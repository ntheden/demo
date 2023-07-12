// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $DbContactsTable extends DbContacts
    with TableInfo<$DbContactsTable, DbContact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbContactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _surnameMeta =
      const VerificationMeta('surname');
  @override
  late final GeneratedColumn<String> surname = GeneratedColumn<String>(
      'surname', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isLocalMeta =
      const VerificationMeta('isLocal');
  @override
  late final GeneratedColumn<bool> isLocal =
      GeneratedColumn<bool>('is_local', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_local" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active =
      GeneratedColumn<bool>('active', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("active" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _npubMeta = const VerificationMeta('npub');
  @override
  late final GeneratedColumn<String> npub = GeneratedColumn<String>(
      'npub', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 64, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _email2Meta = const VerificationMeta('email2');
  @override
  late final GeneratedColumn<String> email2 = GeneratedColumn<String>(
      'email2', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _picture_urlMeta =
      const VerificationMeta('picture_url');
  @override
  late final GeneratedColumn<String> picture_url = GeneratedColumn<String>(
      'picture_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _picture_pathnameMeta =
      const VerificationMeta('picture_pathname');
  @override
  late final GeneratedColumn<String> picture_pathname = GeneratedColumn<String>(
      'picture_pathname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        surname,
        username,
        isLocal,
        active,
        npub,
        address,
        city,
        phone,
        email,
        email2,
        notes,
        picture_url,
        picture_pathname,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? 'db_contacts';
  @override
  String get actualTableName => 'db_contacts';
  @override
  VerificationContext validateIntegrity(Insertable<DbContact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('surname')) {
      context.handle(_surnameMeta,
          surname.isAcceptableOrUnknown(data['surname']!, _surnameMeta));
    } else if (isInserting) {
      context.missing(_surnameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('is_local')) {
      context.handle(_isLocalMeta,
          isLocal.isAcceptableOrUnknown(data['is_local']!, _isLocalMeta));
    } else if (isInserting) {
      context.missing(_isLocalMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('npub')) {
      context.handle(
          _npubMeta, npub.isAcceptableOrUnknown(data['npub']!, _npubMeta));
    } else if (isInserting) {
      context.missing(_npubMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('email2')) {
      context.handle(_email2Meta,
          email2.isAcceptableOrUnknown(data['email2']!, _email2Meta));
    } else if (isInserting) {
      context.missing(_email2Meta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('picture_url')) {
      context.handle(
          _picture_urlMeta,
          picture_url.isAcceptableOrUnknown(
              data['picture_url']!, _picture_urlMeta));
    } else if (isInserting) {
      context.missing(_picture_urlMeta);
    }
    if (data.containsKey('picture_pathname')) {
      context.handle(
          _picture_pathnameMeta,
          picture_pathname.isAcceptableOrUnknown(
              data['picture_pathname']!, _picture_pathnameMeta));
    } else if (isInserting) {
      context.missing(_picture_pathnameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbContact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbContact(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      surname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surname'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      isLocal: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_local'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      npub: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}npub'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      email2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email2'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      picture_url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}picture_url'])!,
      picture_pathname: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}picture_pathname'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $DbContactsTable createAlias(String alias) {
    return $DbContactsTable(attachedDatabase, alias);
  }
}

class DbContact extends DataClass implements Insertable<DbContact> {
  /// isLocal:
  ///   When false, then this is in the contacts list and not a local user
  ///   When true, then this is one of the user "accounts"
  final int id;
  final String name;
  final String surname;
  final String username;
  final bool isLocal;
  final bool active;
  final String npub;
  final String address;
  final String city;
  final String phone;
  final String email;
  final String email2;
  final String notes;
  final String picture_url;
  final String picture_pathname;
  final DateTime createdAt;
  const DbContact(
      {required this.id,
      required this.name,
      required this.surname,
      required this.username,
      required this.isLocal,
      required this.active,
      required this.npub,
      required this.address,
      required this.city,
      required this.phone,
      required this.email,
      required this.email2,
      required this.notes,
      required this.picture_url,
      required this.picture_pathname,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['surname'] = Variable<String>(surname);
    map['username'] = Variable<String>(username);
    map['is_local'] = Variable<bool>(isLocal);
    map['active'] = Variable<bool>(active);
    map['npub'] = Variable<String>(npub);
    map['address'] = Variable<String>(address);
    map['city'] = Variable<String>(city);
    map['phone'] = Variable<String>(phone);
    map['email'] = Variable<String>(email);
    map['email2'] = Variable<String>(email2);
    map['notes'] = Variable<String>(notes);
    map['picture_url'] = Variable<String>(picture_url);
    map['picture_pathname'] = Variable<String>(picture_pathname);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DbContactsCompanion toCompanion(bool nullToAbsent) {
    return DbContactsCompanion(
      id: Value(id),
      name: Value(name),
      surname: Value(surname),
      username: Value(username),
      isLocal: Value(isLocal),
      active: Value(active),
      npub: Value(npub),
      address: Value(address),
      city: Value(city),
      phone: Value(phone),
      email: Value(email),
      email2: Value(email2),
      notes: Value(notes),
      picture_url: Value(picture_url),
      picture_pathname: Value(picture_pathname),
      createdAt: Value(createdAt),
    );
  }

  factory DbContact.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbContact(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      surname: serializer.fromJson<String>(json['surname']),
      username: serializer.fromJson<String>(json['username']),
      isLocal: serializer.fromJson<bool>(json['isLocal']),
      active: serializer.fromJson<bool>(json['active']),
      npub: serializer.fromJson<String>(json['npub']),
      address: serializer.fromJson<String>(json['address']),
      city: serializer.fromJson<String>(json['city']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      email2: serializer.fromJson<String>(json['email2']),
      notes: serializer.fromJson<String>(json['notes']),
      picture_url: serializer.fromJson<String>(json['picture_url']),
      picture_pathname: serializer.fromJson<String>(json['picture_pathname']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'surname': serializer.toJson<String>(surname),
      'username': serializer.toJson<String>(username),
      'isLocal': serializer.toJson<bool>(isLocal),
      'active': serializer.toJson<bool>(active),
      'npub': serializer.toJson<String>(npub),
      'address': serializer.toJson<String>(address),
      'city': serializer.toJson<String>(city),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
      'email2': serializer.toJson<String>(email2),
      'notes': serializer.toJson<String>(notes),
      'picture_url': serializer.toJson<String>(picture_url),
      'picture_pathname': serializer.toJson<String>(picture_pathname),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DbContact copyWith(
          {int? id,
          String? name,
          String? surname,
          String? username,
          bool? isLocal,
          bool? active,
          String? npub,
          String? address,
          String? city,
          String? phone,
          String? email,
          String? email2,
          String? notes,
          String? picture_url,
          String? picture_pathname,
          DateTime? createdAt}) =>
      DbContact(
        id: id ?? this.id,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        username: username ?? this.username,
        isLocal: isLocal ?? this.isLocal,
        active: active ?? this.active,
        npub: npub ?? this.npub,
        address: address ?? this.address,
        city: city ?? this.city,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        email2: email2 ?? this.email2,
        notes: notes ?? this.notes,
        picture_url: picture_url ?? this.picture_url,
        picture_pathname: picture_pathname ?? this.picture_pathname,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbContact(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('username: $username, ')
          ..write('isLocal: $isLocal, ')
          ..write('active: $active, ')
          ..write('npub: $npub, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('email2: $email2, ')
          ..write('notes: $notes, ')
          ..write('picture_url: $picture_url, ')
          ..write('picture_pathname: $picture_pathname, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      surname,
      username,
      isLocal,
      active,
      npub,
      address,
      city,
      phone,
      email,
      email2,
      notes,
      picture_url,
      picture_pathname,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbContact &&
          other.id == this.id &&
          other.name == this.name &&
          other.surname == this.surname &&
          other.username == this.username &&
          other.isLocal == this.isLocal &&
          other.active == this.active &&
          other.npub == this.npub &&
          other.address == this.address &&
          other.city == this.city &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.email2 == this.email2 &&
          other.notes == this.notes &&
          other.picture_url == this.picture_url &&
          other.picture_pathname == this.picture_pathname &&
          other.createdAt == this.createdAt);
}

class DbContactsCompanion extends UpdateCompanion<DbContact> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> surname;
  final Value<String> username;
  final Value<bool> isLocal;
  final Value<bool> active;
  final Value<String> npub;
  final Value<String> address;
  final Value<String> city;
  final Value<String> phone;
  final Value<String> email;
  final Value<String> email2;
  final Value<String> notes;
  final Value<String> picture_url;
  final Value<String> picture_pathname;
  final Value<DateTime> createdAt;
  const DbContactsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.username = const Value.absent(),
    this.isLocal = const Value.absent(),
    this.active = const Value.absent(),
    this.npub = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.email2 = const Value.absent(),
    this.notes = const Value.absent(),
    this.picture_url = const Value.absent(),
    this.picture_pathname = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DbContactsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String surname,
    required String username,
    required bool isLocal,
    required bool active,
    required String npub,
    required String address,
    required String city,
    required String phone,
    required String email,
    required String email2,
    required String notes,
    required String picture_url,
    required String picture_pathname,
    required DateTime createdAt,
  })  : name = Value(name),
        surname = Value(surname),
        username = Value(username),
        isLocal = Value(isLocal),
        active = Value(active),
        npub = Value(npub),
        address = Value(address),
        city = Value(city),
        phone = Value(phone),
        email = Value(email),
        email2 = Value(email2),
        notes = Value(notes),
        picture_url = Value(picture_url),
        picture_pathname = Value(picture_pathname),
        createdAt = Value(createdAt);
  static Insertable<DbContact> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? surname,
    Expression<String>? username,
    Expression<bool>? isLocal,
    Expression<bool>? active,
    Expression<String>? npub,
    Expression<String>? address,
    Expression<String>? city,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? email2,
    Expression<String>? notes,
    Expression<String>? picture_url,
    Expression<String>? picture_pathname,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (username != null) 'username': username,
      if (isLocal != null) 'is_local': isLocal,
      if (active != null) 'active': active,
      if (npub != null) 'npub': npub,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (email2 != null) 'email2': email2,
      if (notes != null) 'notes': notes,
      if (picture_url != null) 'picture_url': picture_url,
      if (picture_pathname != null) 'picture_pathname': picture_pathname,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DbContactsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? surname,
      Value<String>? username,
      Value<bool>? isLocal,
      Value<bool>? active,
      Value<String>? npub,
      Value<String>? address,
      Value<String>? city,
      Value<String>? phone,
      Value<String>? email,
      Value<String>? email2,
      Value<String>? notes,
      Value<String>? picture_url,
      Value<String>? picture_pathname,
      Value<DateTime>? createdAt}) {
    return DbContactsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      username: username ?? this.username,
      isLocal: isLocal ?? this.isLocal,
      active: active ?? this.active,
      npub: npub ?? this.npub,
      address: address ?? this.address,
      city: city ?? this.city,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      email2: email2 ?? this.email2,
      notes: notes ?? this.notes,
      picture_url: picture_url ?? this.picture_url,
      picture_pathname: picture_pathname ?? this.picture_pathname,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (isLocal.present) {
      map['is_local'] = Variable<bool>(isLocal.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (npub.present) {
      map['npub'] = Variable<String>(npub.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (email2.present) {
      map['email2'] = Variable<String>(email2.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (picture_url.present) {
      map['picture_url'] = Variable<String>(picture_url.value);
    }
    if (picture_pathname.present) {
      map['picture_pathname'] = Variable<String>(picture_pathname.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbContactsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('username: $username, ')
          ..write('isLocal: $isLocal, ')
          ..write('active: $active, ')
          ..write('npub: $npub, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('email2: $email2, ')
          ..write('notes: $notes, ')
          ..write('picture_url: $picture_url, ')
          ..write('picture_pathname: $picture_pathname, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NpubsTable extends Npubs with TableInfo<$NpubsTable, Npub> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NpubsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 64, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _privkeyMeta =
      const VerificationMeta('privkey');
  @override
  late final GeneratedColumn<String> privkey = GeneratedColumn<String>(
      'privkey', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, pubkey, label, privkey];
  @override
  String get aliasedName => _alias ?? 'npubs';
  @override
  String get actualTableName => 'npubs';
  @override
  VerificationContext validateIntegrity(Insertable<Npub> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('privkey')) {
      context.handle(_privkeyMeta,
          privkey.isAcceptableOrUnknown(data['privkey']!, _privkeyMeta));
    } else if (isInserting) {
      context.missing(_privkeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Npub map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Npub(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      privkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}privkey'])!,
    );
  }

  @override
  $NpubsTable createAlias(String alias) {
    return $NpubsTable(attachedDatabase, alias);
  }
}

class Npub extends DataClass implements Insertable<Npub> {
  final int id;
  final String pubkey;
  final String label;
  final String privkey;
  const Npub(
      {required this.id,
      required this.pubkey,
      required this.label,
      required this.privkey});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['label'] = Variable<String>(label);
    map['privkey'] = Variable<String>(privkey);
    return map;
  }

  NpubsCompanion toCompanion(bool nullToAbsent) {
    return NpubsCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      label: Value(label),
      privkey: Value(privkey),
    );
  }

  factory Npub.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Npub(
      id: serializer.fromJson<int>(json['id']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      label: serializer.fromJson<String>(json['label']),
      privkey: serializer.fromJson<String>(json['privkey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pubkey': serializer.toJson<String>(pubkey),
      'label': serializer.toJson<String>(label),
      'privkey': serializer.toJson<String>(privkey),
    };
  }

  Npub copyWith({int? id, String? pubkey, String? label, String? privkey}) =>
      Npub(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        label: label ?? this.label,
        privkey: privkey ?? this.privkey,
      );
  @override
  String toString() {
    return (StringBuffer('Npub(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('label: $label, ')
          ..write('privkey: $privkey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pubkey, label, privkey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Npub &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.label == this.label &&
          other.privkey == this.privkey);
}

class NpubsCompanion extends UpdateCompanion<Npub> {
  final Value<int> id;
  final Value<String> pubkey;
  final Value<String> label;
  final Value<String> privkey;
  const NpubsCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.label = const Value.absent(),
    this.privkey = const Value.absent(),
  });
  NpubsCompanion.insert({
    this.id = const Value.absent(),
    required String pubkey,
    required String label,
    required String privkey,
  })  : pubkey = Value(pubkey),
        label = Value(label),
        privkey = Value(privkey);
  static Insertable<Npub> custom({
    Expression<int>? id,
    Expression<String>? pubkey,
    Expression<String>? label,
    Expression<String>? privkey,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (label != null) 'label': label,
      if (privkey != null) 'privkey': privkey,
    });
  }

  NpubsCompanion copyWith(
      {Value<int>? id,
      Value<String>? pubkey,
      Value<String>? label,
      Value<String>? privkey}) {
    return NpubsCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      label: label ?? this.label,
      privkey: privkey ?? this.privkey,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (privkey.present) {
      map['privkey'] = Variable<String>(privkey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NpubsCompanion(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('label: $label, ')
          ..write('privkey: $privkey')
          ..write(')'))
        .toString();
  }
}

class $DbEventsTable extends DbEvents with TableInfo<$DbEventsTable, DbEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _eventIdMeta =
      const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
      'event_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _pubkeyRefMeta =
      const VerificationMeta('pubkeyRef');
  @override
  late final GeneratedColumn<int> pubkeyRef = GeneratedColumn<int>(
      'pubkey_ref', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES npubs (id)'));
  static const VerificationMeta _receiverRefMeta =
      const VerificationMeta('receiverRef');
  @override
  late final GeneratedColumn<int> receiverRef = GeneratedColumn<int>(
      'receiver_ref', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES npubs (id)'));
  static const VerificationMeta _toContactMeta =
      const VerificationMeta('toContact');
  @override
  late final GeneratedColumn<int> toContact = GeneratedColumn<int>(
      'to_contact', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_contacts (id)'));
  static const VerificationMeta _fromContactMeta =
      const VerificationMeta('fromContact');
  @override
  late final GeneratedColumn<int> fromContact = GeneratedColumn<int>(
      'from_contact', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_contacts (id)'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1024),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _plaintextMeta =
      const VerificationMeta('plaintext');
  @override
  late final GeneratedColumn<String> plaintext = GeneratedColumn<String>(
      'plaintext', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1024),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<int> kind = GeneratedColumn<int>(
      'kind', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _decryptErrorMeta =
      const VerificationMeta('decryptError');
  @override
  late final GeneratedColumn<bool> decryptError =
      GeneratedColumn<bool>('decrypt_error', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("decrypt_error" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        eventId,
        pubkeyRef,
        receiverRef,
        toContact,
        fromContact,
        content,
        plaintext,
        createdAt,
        kind,
        decryptError
      ];
  @override
  String get aliasedName => _alias ?? 'db_events';
  @override
  String get actualTableName => 'db_events';
  @override
  VerificationContext validateIntegrity(Insertable<DbEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('pubkey_ref')) {
      context.handle(_pubkeyRefMeta,
          pubkeyRef.isAcceptableOrUnknown(data['pubkey_ref']!, _pubkeyRefMeta));
    } else if (isInserting) {
      context.missing(_pubkeyRefMeta);
    }
    if (data.containsKey('receiver_ref')) {
      context.handle(
          _receiverRefMeta,
          receiverRef.isAcceptableOrUnknown(
              data['receiver_ref']!, _receiverRefMeta));
    } else if (isInserting) {
      context.missing(_receiverRefMeta);
    }
    if (data.containsKey('to_contact')) {
      context.handle(_toContactMeta,
          toContact.isAcceptableOrUnknown(data['to_contact']!, _toContactMeta));
    } else if (isInserting) {
      context.missing(_toContactMeta);
    }
    if (data.containsKey('from_contact')) {
      context.handle(
          _fromContactMeta,
          fromContact.isAcceptableOrUnknown(
              data['from_contact']!, _fromContactMeta));
    } else if (isInserting) {
      context.missing(_fromContactMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('plaintext')) {
      context.handle(_plaintextMeta,
          plaintext.isAcceptableOrUnknown(data['plaintext']!, _plaintextMeta));
    } else if (isInserting) {
      context.missing(_plaintextMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('decrypt_error')) {
      context.handle(
          _decryptErrorMeta,
          decryptError.isAcceptableOrUnknown(
              data['decrypt_error']!, _decryptErrorMeta));
    } else if (isInserting) {
      context.missing(_decryptErrorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbEvent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      eventId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_id'])!,
      pubkeyRef: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pubkey_ref'])!,
      receiverRef: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}receiver_ref'])!,
      toContact: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_contact'])!,
      fromContact: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_contact'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      plaintext: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plaintext'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kind'])!,
      decryptError: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}decrypt_error'])!,
    );
  }

  @override
  $DbEventsTable createAlias(String alias) {
    return $DbEventsTable(attachedDatabase, alias);
  }
}

class DbEvent extends DataClass implements Insertable<DbEvent> {
  /// All events table
  final int id;
  final String eventId;
  final int pubkeyRef;
  final int receiverRef;
  final int toContact;
  final int fromContact;
  final String content;
  final String plaintext;
  final DateTime createdAt;
  final int kind;
  final bool decryptError;
  const DbEvent(
      {required this.id,
      required this.eventId,
      required this.pubkeyRef,
      required this.receiverRef,
      required this.toContact,
      required this.fromContact,
      required this.content,
      required this.plaintext,
      required this.createdAt,
      required this.kind,
      required this.decryptError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<String>(eventId);
    map['pubkey_ref'] = Variable<int>(pubkeyRef);
    map['receiver_ref'] = Variable<int>(receiverRef);
    map['to_contact'] = Variable<int>(toContact);
    map['from_contact'] = Variable<int>(fromContact);
    map['content'] = Variable<String>(content);
    map['plaintext'] = Variable<String>(plaintext);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['kind'] = Variable<int>(kind);
    map['decrypt_error'] = Variable<bool>(decryptError);
    return map;
  }

  DbEventsCompanion toCompanion(bool nullToAbsent) {
    return DbEventsCompanion(
      id: Value(id),
      eventId: Value(eventId),
      pubkeyRef: Value(pubkeyRef),
      receiverRef: Value(receiverRef),
      toContact: Value(toContact),
      fromContact: Value(fromContact),
      content: Value(content),
      plaintext: Value(plaintext),
      createdAt: Value(createdAt),
      kind: Value(kind),
      decryptError: Value(decryptError),
    );
  }

  factory DbEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbEvent(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<String>(json['eventId']),
      pubkeyRef: serializer.fromJson<int>(json['pubkeyRef']),
      receiverRef: serializer.fromJson<int>(json['receiverRef']),
      toContact: serializer.fromJson<int>(json['toContact']),
      fromContact: serializer.fromJson<int>(json['fromContact']),
      content: serializer.fromJson<String>(json['content']),
      plaintext: serializer.fromJson<String>(json['plaintext']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      kind: serializer.fromJson<int>(json['kind']),
      decryptError: serializer.fromJson<bool>(json['decryptError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<String>(eventId),
      'pubkeyRef': serializer.toJson<int>(pubkeyRef),
      'receiverRef': serializer.toJson<int>(receiverRef),
      'toContact': serializer.toJson<int>(toContact),
      'fromContact': serializer.toJson<int>(fromContact),
      'content': serializer.toJson<String>(content),
      'plaintext': serializer.toJson<String>(plaintext),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'kind': serializer.toJson<int>(kind),
      'decryptError': serializer.toJson<bool>(decryptError),
    };
  }

  DbEvent copyWith(
          {int? id,
          String? eventId,
          int? pubkeyRef,
          int? receiverRef,
          int? toContact,
          int? fromContact,
          String? content,
          String? plaintext,
          DateTime? createdAt,
          int? kind,
          bool? decryptError}) =>
      DbEvent(
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        pubkeyRef: pubkeyRef ?? this.pubkeyRef,
        receiverRef: receiverRef ?? this.receiverRef,
        toContact: toContact ?? this.toContact,
        fromContact: fromContact ?? this.fromContact,
        content: content ?? this.content,
        plaintext: plaintext ?? this.plaintext,
        createdAt: createdAt ?? this.createdAt,
        kind: kind ?? this.kind,
        decryptError: decryptError ?? this.decryptError,
      );
  @override
  String toString() {
    return (StringBuffer('DbEvent(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('pubkeyRef: $pubkeyRef, ')
          ..write('receiverRef: $receiverRef, ')
          ..write('toContact: $toContact, ')
          ..write('fromContact: $fromContact, ')
          ..write('content: $content, ')
          ..write('plaintext: $plaintext, ')
          ..write('createdAt: $createdAt, ')
          ..write('kind: $kind, ')
          ..write('decryptError: $decryptError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      eventId,
      pubkeyRef,
      receiverRef,
      toContact,
      fromContact,
      content,
      plaintext,
      createdAt,
      kind,
      decryptError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbEvent &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.pubkeyRef == this.pubkeyRef &&
          other.receiverRef == this.receiverRef &&
          other.toContact == this.toContact &&
          other.fromContact == this.fromContact &&
          other.content == this.content &&
          other.plaintext == this.plaintext &&
          other.createdAt == this.createdAt &&
          other.kind == this.kind &&
          other.decryptError == this.decryptError);
}

class DbEventsCompanion extends UpdateCompanion<DbEvent> {
  final Value<int> id;
  final Value<String> eventId;
  final Value<int> pubkeyRef;
  final Value<int> receiverRef;
  final Value<int> toContact;
  final Value<int> fromContact;
  final Value<String> content;
  final Value<String> plaintext;
  final Value<DateTime> createdAt;
  final Value<int> kind;
  final Value<bool> decryptError;
  const DbEventsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.pubkeyRef = const Value.absent(),
    this.receiverRef = const Value.absent(),
    this.toContact = const Value.absent(),
    this.fromContact = const Value.absent(),
    this.content = const Value.absent(),
    this.plaintext = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.kind = const Value.absent(),
    this.decryptError = const Value.absent(),
  });
  DbEventsCompanion.insert({
    this.id = const Value.absent(),
    required String eventId,
    required int pubkeyRef,
    required int receiverRef,
    required int toContact,
    required int fromContact,
    required String content,
    required String plaintext,
    required DateTime createdAt,
    required int kind,
    required bool decryptError,
  })  : eventId = Value(eventId),
        pubkeyRef = Value(pubkeyRef),
        receiverRef = Value(receiverRef),
        toContact = Value(toContact),
        fromContact = Value(fromContact),
        content = Value(content),
        plaintext = Value(plaintext),
        createdAt = Value(createdAt),
        kind = Value(kind),
        decryptError = Value(decryptError);
  static Insertable<DbEvent> custom({
    Expression<int>? id,
    Expression<String>? eventId,
    Expression<int>? pubkeyRef,
    Expression<int>? receiverRef,
    Expression<int>? toContact,
    Expression<int>? fromContact,
    Expression<String>? content,
    Expression<String>? plaintext,
    Expression<DateTime>? createdAt,
    Expression<int>? kind,
    Expression<bool>? decryptError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (pubkeyRef != null) 'pubkey_ref': pubkeyRef,
      if (receiverRef != null) 'receiver_ref': receiverRef,
      if (toContact != null) 'to_contact': toContact,
      if (fromContact != null) 'from_contact': fromContact,
      if (content != null) 'content': content,
      if (plaintext != null) 'plaintext': plaintext,
      if (createdAt != null) 'created_at': createdAt,
      if (kind != null) 'kind': kind,
      if (decryptError != null) 'decrypt_error': decryptError,
    });
  }

  DbEventsCompanion copyWith(
      {Value<int>? id,
      Value<String>? eventId,
      Value<int>? pubkeyRef,
      Value<int>? receiverRef,
      Value<int>? toContact,
      Value<int>? fromContact,
      Value<String>? content,
      Value<String>? plaintext,
      Value<DateTime>? createdAt,
      Value<int>? kind,
      Value<bool>? decryptError}) {
    return DbEventsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      pubkeyRef: pubkeyRef ?? this.pubkeyRef,
      receiverRef: receiverRef ?? this.receiverRef,
      toContact: toContact ?? this.toContact,
      fromContact: fromContact ?? this.fromContact,
      content: content ?? this.content,
      plaintext: plaintext ?? this.plaintext,
      createdAt: createdAt ?? this.createdAt,
      kind: kind ?? this.kind,
      decryptError: decryptError ?? this.decryptError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (pubkeyRef.present) {
      map['pubkey_ref'] = Variable<int>(pubkeyRef.value);
    }
    if (receiverRef.present) {
      map['receiver_ref'] = Variable<int>(receiverRef.value);
    }
    if (toContact.present) {
      map['to_contact'] = Variable<int>(toContact.value);
    }
    if (fromContact.present) {
      map['from_contact'] = Variable<int>(fromContact.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (plaintext.present) {
      map['plaintext'] = Variable<String>(plaintext.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (kind.present) {
      map['kind'] = Variable<int>(kind.value);
    }
    if (decryptError.present) {
      map['decrypt_error'] = Variable<bool>(decryptError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbEventsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('pubkeyRef: $pubkeyRef, ')
          ..write('receiverRef: $receiverRef, ')
          ..write('toContact: $toContact, ')
          ..write('fromContact: $fromContact, ')
          ..write('content: $content, ')
          ..write('plaintext: $plaintext, ')
          ..write('createdAt: $createdAt, ')
          ..write('kind: $kind, ')
          ..write('decryptError: $decryptError')
          ..write(')'))
        .toString();
  }
}

class $ContactNpubsTable extends ContactNpubs
    with TableInfo<$ContactNpubsTable, ContactNpub> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactNpubsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<int> contact = GeneratedColumn<int>(
      'contact', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_contacts (id)'));
  static const VerificationMeta _npubMeta = const VerificationMeta('npub');
  @override
  late final GeneratedColumn<int> npub = GeneratedColumn<int>(
      'npub', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES npubs (id)'));
  @override
  List<GeneratedColumn> get $columns => [contact, npub];
  @override
  String get aliasedName => _alias ?? 'contact_npubs';
  @override
  String get actualTableName => 'contact_npubs';
  @override
  VerificationContext validateIntegrity(Insertable<ContactNpub> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('npub')) {
      context.handle(
          _npubMeta, npub.isAcceptableOrUnknown(data['npub']!, _npubMeta));
    } else if (isInserting) {
      context.missing(_npubMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ContactNpub map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactNpub(
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}contact'])!,
      npub: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}npub'])!,
    );
  }

  @override
  $ContactNpubsTable createAlias(String alias) {
    return $ContactNpubsTable(attachedDatabase, alias);
  }
}

class ContactNpub extends DataClass implements Insertable<ContactNpub> {
  final int contact;
  final int npub;
  const ContactNpub({required this.contact, required this.npub});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['contact'] = Variable<int>(contact);
    map['npub'] = Variable<int>(npub);
    return map;
  }

  ContactNpubsCompanion toCompanion(bool nullToAbsent) {
    return ContactNpubsCompanion(
      contact: Value(contact),
      npub: Value(npub),
    );
  }

  factory ContactNpub.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactNpub(
      contact: serializer.fromJson<int>(json['contact']),
      npub: serializer.fromJson<int>(json['npub']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'contact': serializer.toJson<int>(contact),
      'npub': serializer.toJson<int>(npub),
    };
  }

  ContactNpub copyWith({int? contact, int? npub}) => ContactNpub(
        contact: contact ?? this.contact,
        npub: npub ?? this.npub,
      );
  @override
  String toString() {
    return (StringBuffer('ContactNpub(')
          ..write('contact: $contact, ')
          ..write('npub: $npub')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(contact, npub);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactNpub &&
          other.contact == this.contact &&
          other.npub == this.npub);
}

class ContactNpubsCompanion extends UpdateCompanion<ContactNpub> {
  final Value<int> contact;
  final Value<int> npub;
  final Value<int> rowid;
  const ContactNpubsCompanion({
    this.contact = const Value.absent(),
    this.npub = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContactNpubsCompanion.insert({
    required int contact,
    required int npub,
    this.rowid = const Value.absent(),
  })  : contact = Value(contact),
        npub = Value(npub);
  static Insertable<ContactNpub> custom({
    Expression<int>? contact,
    Expression<int>? npub,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (contact != null) 'contact': contact,
      if (npub != null) 'npub': npub,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContactNpubsCompanion copyWith(
      {Value<int>? contact, Value<int>? npub, Value<int>? rowid}) {
    return ContactNpubsCompanion(
      contact: contact ?? this.contact,
      npub: npub ?? this.npub,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (contact.present) {
      map['contact'] = Variable<int>(contact.value);
    }
    if (npub.present) {
      map['npub'] = Variable<int>(npub.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactNpubsCompanion(')
          ..write('contact: $contact, ')
          ..write('npub: $npub, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EtagsTable extends Etags with TableInfo<$EtagsTable, Etag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EtagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _eventIdMeta =
      const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
      'event_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _markerMeta = const VerificationMeta('marker');
  @override
  late final GeneratedColumn<String> marker = GeneratedColumn<String>(
      'marker', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _relayRefMeta =
      const VerificationMeta('relayRef');
  @override
  late final GeneratedColumn<int> relayRef = GeneratedColumn<int>(
      'relay_ref', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, eventId, marker, relayRef];
  @override
  String get aliasedName => _alias ?? 'etags';
  @override
  String get actualTableName => 'etags';
  @override
  VerificationContext validateIntegrity(Insertable<Etag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('marker')) {
      context.handle(_markerMeta,
          marker.isAcceptableOrUnknown(data['marker']!, _markerMeta));
    } else if (isInserting) {
      context.missing(_markerMeta);
    }
    if (data.containsKey('relay_ref')) {
      context.handle(_relayRefMeta,
          relayRef.isAcceptableOrUnknown(data['relay_ref']!, _relayRefMeta));
    } else if (isInserting) {
      context.missing(_relayRefMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Etag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Etag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      eventId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_id'])!,
      marker: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}marker'])!,
      relayRef: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}relay_ref'])!,
    );
  }

  @override
  $EtagsTable createAlias(String alias) {
    return $EtagsTable(attachedDatabase, alias);
  }
}

class Etag extends DataClass implements Insertable<Etag> {
  final int id;
  final String eventId;
  final String marker;
  final int relayRef;
  const Etag(
      {required this.id,
      required this.eventId,
      required this.marker,
      required this.relayRef});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<String>(eventId);
    map['marker'] = Variable<String>(marker);
    map['relay_ref'] = Variable<int>(relayRef);
    return map;
  }

  EtagsCompanion toCompanion(bool nullToAbsent) {
    return EtagsCompanion(
      id: Value(id),
      eventId: Value(eventId),
      marker: Value(marker),
      relayRef: Value(relayRef),
    );
  }

  factory Etag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Etag(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<String>(json['eventId']),
      marker: serializer.fromJson<String>(json['marker']),
      relayRef: serializer.fromJson<int>(json['relayRef']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<String>(eventId),
      'marker': serializer.toJson<String>(marker),
      'relayRef': serializer.toJson<int>(relayRef),
    };
  }

  Etag copyWith({int? id, String? eventId, String? marker, int? relayRef}) =>
      Etag(
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        marker: marker ?? this.marker,
        relayRef: relayRef ?? this.relayRef,
      );
  @override
  String toString() {
    return (StringBuffer('Etag(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('marker: $marker, ')
          ..write('relayRef: $relayRef')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, eventId, marker, relayRef);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Etag &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.marker == this.marker &&
          other.relayRef == this.relayRef);
}

class EtagsCompanion extends UpdateCompanion<Etag> {
  final Value<int> id;
  final Value<String> eventId;
  final Value<String> marker;
  final Value<int> relayRef;
  const EtagsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.marker = const Value.absent(),
    this.relayRef = const Value.absent(),
  });
  EtagsCompanion.insert({
    this.id = const Value.absent(),
    required String eventId,
    required String marker,
    required int relayRef,
  })  : eventId = Value(eventId),
        marker = Value(marker),
        relayRef = Value(relayRef);
  static Insertable<Etag> custom({
    Expression<int>? id,
    Expression<String>? eventId,
    Expression<String>? marker,
    Expression<int>? relayRef,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (marker != null) 'marker': marker,
      if (relayRef != null) 'relay_ref': relayRef,
    });
  }

  EtagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? eventId,
      Value<String>? marker,
      Value<int>? relayRef}) {
    return EtagsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      marker: marker ?? this.marker,
      relayRef: relayRef ?? this.relayRef,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (marker.present) {
      map['marker'] = Variable<String>(marker.value);
    }
    if (relayRef.present) {
      map['relay_ref'] = Variable<int>(relayRef.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EtagsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('marker: $marker, ')
          ..write('relayRef: $relayRef')
          ..write(')'))
        .toString();
  }
}

class $EventPtagsTable extends EventPtags
    with TableInfo<$EventPtagsTable, EventPtag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventPtagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventMeta = const VerificationMeta('event');
  @override
  late final GeneratedColumn<int> event = GeneratedColumn<int>(
      'event', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_events (id)'));
  static const VerificationMeta _ptagMeta = const VerificationMeta('ptag');
  @override
  late final GeneratedColumn<int> ptag = GeneratedColumn<int>(
      'ptag', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES npubs (id)'));
  @override
  List<GeneratedColumn> get $columns => [event, ptag];
  @override
  String get aliasedName => _alias ?? 'event_ptags';
  @override
  String get actualTableName => 'event_ptags';
  @override
  VerificationContext validateIntegrity(Insertable<EventPtag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event')) {
      context.handle(
          _eventMeta, event.isAcceptableOrUnknown(data['event']!, _eventMeta));
    } else if (isInserting) {
      context.missing(_eventMeta);
    }
    if (data.containsKey('ptag')) {
      context.handle(
          _ptagMeta, ptag.isAcceptableOrUnknown(data['ptag']!, _ptagMeta));
    } else if (isInserting) {
      context.missing(_ptagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EventPtag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventPtag(
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}event'])!,
      ptag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ptag'])!,
    );
  }

  @override
  $EventPtagsTable createAlias(String alias) {
    return $EventPtagsTable(attachedDatabase, alias);
  }
}

class EventPtag extends DataClass implements Insertable<EventPtag> {
  final int event;
  final int ptag;
  const EventPtag({required this.event, required this.ptag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event'] = Variable<int>(event);
    map['ptag'] = Variable<int>(ptag);
    return map;
  }

  EventPtagsCompanion toCompanion(bool nullToAbsent) {
    return EventPtagsCompanion(
      event: Value(event),
      ptag: Value(ptag),
    );
  }

  factory EventPtag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventPtag(
      event: serializer.fromJson<int>(json['event']),
      ptag: serializer.fromJson<int>(json['ptag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'event': serializer.toJson<int>(event),
      'ptag': serializer.toJson<int>(ptag),
    };
  }

  EventPtag copyWith({int? event, int? ptag}) => EventPtag(
        event: event ?? this.event,
        ptag: ptag ?? this.ptag,
      );
  @override
  String toString() {
    return (StringBuffer('EventPtag(')
          ..write('event: $event, ')
          ..write('ptag: $ptag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(event, ptag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventPtag &&
          other.event == this.event &&
          other.ptag == this.ptag);
}

class EventPtagsCompanion extends UpdateCompanion<EventPtag> {
  final Value<int> event;
  final Value<int> ptag;
  final Value<int> rowid;
  const EventPtagsCompanion({
    this.event = const Value.absent(),
    this.ptag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventPtagsCompanion.insert({
    required int event,
    required int ptag,
    this.rowid = const Value.absent(),
  })  : event = Value(event),
        ptag = Value(ptag);
  static Insertable<EventPtag> custom({
    Expression<int>? event,
    Expression<int>? ptag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (event != null) 'event': event,
      if (ptag != null) 'ptag': ptag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventPtagsCompanion copyWith(
      {Value<int>? event, Value<int>? ptag, Value<int>? rowid}) {
    return EventPtagsCompanion(
      event: event ?? this.event,
      ptag: ptag ?? this.ptag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (event.present) {
      map['event'] = Variable<int>(event.value);
    }
    if (ptag.present) {
      map['ptag'] = Variable<int>(ptag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventPtagsCompanion(')
          ..write('event: $event, ')
          ..write('ptag: $ptag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventEtagsTable extends EventEtags
    with TableInfo<$EventEtagsTable, EventEtag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventEtagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventMeta = const VerificationMeta('event');
  @override
  late final GeneratedColumn<int> event = GeneratedColumn<int>(
      'event', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_events (id)'));
  static const VerificationMeta _etagMeta = const VerificationMeta('etag');
  @override
  late final GeneratedColumn<int> etag = GeneratedColumn<int>(
      'etag', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES etags (id)'));
  @override
  List<GeneratedColumn> get $columns => [event, etag];
  @override
  String get aliasedName => _alias ?? 'event_etags';
  @override
  String get actualTableName => 'event_etags';
  @override
  VerificationContext validateIntegrity(Insertable<EventEtag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event')) {
      context.handle(
          _eventMeta, event.isAcceptableOrUnknown(data['event']!, _eventMeta));
    } else if (isInserting) {
      context.missing(_eventMeta);
    }
    if (data.containsKey('etag')) {
      context.handle(
          _etagMeta, etag.isAcceptableOrUnknown(data['etag']!, _etagMeta));
    } else if (isInserting) {
      context.missing(_etagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EventEtag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventEtag(
      event: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}event'])!,
      etag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}etag'])!,
    );
  }

  @override
  $EventEtagsTable createAlias(String alias) {
    return $EventEtagsTable(attachedDatabase, alias);
  }
}

class EventEtag extends DataClass implements Insertable<EventEtag> {
  final int event;
  final int etag;
  const EventEtag({required this.event, required this.etag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event'] = Variable<int>(event);
    map['etag'] = Variable<int>(etag);
    return map;
  }

  EventEtagsCompanion toCompanion(bool nullToAbsent) {
    return EventEtagsCompanion(
      event: Value(event),
      etag: Value(etag),
    );
  }

  factory EventEtag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventEtag(
      event: serializer.fromJson<int>(json['event']),
      etag: serializer.fromJson<int>(json['etag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'event': serializer.toJson<int>(event),
      'etag': serializer.toJson<int>(etag),
    };
  }

  EventEtag copyWith({int? event, int? etag}) => EventEtag(
        event: event ?? this.event,
        etag: etag ?? this.etag,
      );
  @override
  String toString() {
    return (StringBuffer('EventEtag(')
          ..write('event: $event, ')
          ..write('etag: $etag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(event, etag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventEtag &&
          other.event == this.event &&
          other.etag == this.etag);
}

class EventEtagsCompanion extends UpdateCompanion<EventEtag> {
  final Value<int> event;
  final Value<int> etag;
  final Value<int> rowid;
  const EventEtagsCompanion({
    this.event = const Value.absent(),
    this.etag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventEtagsCompanion.insert({
    required int event,
    required int etag,
    this.rowid = const Value.absent(),
  })  : event = Value(event),
        etag = Value(etag);
  static Insertable<EventEtag> custom({
    Expression<int>? event,
    Expression<int>? etag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (event != null) 'event': event,
      if (etag != null) 'etag': etag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventEtagsCompanion copyWith(
      {Value<int>? event, Value<int>? etag, Value<int>? rowid}) {
    return EventEtagsCompanion(
      event: event ?? this.event,
      etag: etag ?? this.etag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (event.present) {
      map['event'] = Variable<int>(event.value);
    }
    if (etag.present) {
      map['etag'] = Variable<int>(etag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventEtagsCompanion(')
          ..write('event: $event, ')
          ..write('etag: $etag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbRelaysTable extends DbRelays with TableInfo<$DbRelaysTable, DbRelay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbRelaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 1024),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _writeMeta = const VerificationMeta('write');
  @override
  late final GeneratedColumn<bool> write =
      GeneratedColumn<bool>('write', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("write" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _readMeta = const VerificationMeta('read');
  @override
  late final GeneratedColumn<bool> read =
      GeneratedColumn<bool>('read', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("read" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [id, url, notes, write, read];
  @override
  String get aliasedName => _alias ?? 'db_relays';
  @override
  String get actualTableName => 'db_relays';
  @override
  VerificationContext validateIntegrity(Insertable<DbRelay> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('write')) {
      context.handle(
          _writeMeta, write.isAcceptableOrUnknown(data['write']!, _writeMeta));
    } else if (isInserting) {
      context.missing(_writeMeta);
    }
    if (data.containsKey('read')) {
      context.handle(
          _readMeta, read.isAcceptableOrUnknown(data['read']!, _readMeta));
    } else if (isInserting) {
      context.missing(_readMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbRelay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbRelay(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      write: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}write'])!,
      read: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}read'])!,
    );
  }

  @override
  $DbRelaysTable createAlias(String alias) {
    return $DbRelaysTable(attachedDatabase, alias);
  }
}

class DbRelay extends DataClass implements Insertable<DbRelay> {
  final int id;
  final String url;
  final String notes;
  final bool write;
  final bool read;
  const DbRelay(
      {required this.id,
      required this.url,
      required this.notes,
      required this.write,
      required this.read});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['notes'] = Variable<String>(notes);
    map['write'] = Variable<bool>(write);
    map['read'] = Variable<bool>(read);
    return map;
  }

  DbRelaysCompanion toCompanion(bool nullToAbsent) {
    return DbRelaysCompanion(
      id: Value(id),
      url: Value(url),
      notes: Value(notes),
      write: Value(write),
      read: Value(read),
    );
  }

  factory DbRelay.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbRelay(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      notes: serializer.fromJson<String>(json['notes']),
      write: serializer.fromJson<bool>(json['write']),
      read: serializer.fromJson<bool>(json['read']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'notes': serializer.toJson<String>(notes),
      'write': serializer.toJson<bool>(write),
      'read': serializer.toJson<bool>(read),
    };
  }

  DbRelay copyWith(
          {int? id, String? url, String? notes, bool? write, bool? read}) =>
      DbRelay(
        id: id ?? this.id,
        url: url ?? this.url,
        notes: notes ?? this.notes,
        write: write ?? this.write,
        read: read ?? this.read,
      );
  @override
  String toString() {
    return (StringBuffer('DbRelay(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('notes: $notes, ')
          ..write('write: $write, ')
          ..write('read: $read')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, notes, write, read);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbRelay &&
          other.id == this.id &&
          other.url == this.url &&
          other.notes == this.notes &&
          other.write == this.write &&
          other.read == this.read);
}

class DbRelaysCompanion extends UpdateCompanion<DbRelay> {
  final Value<int> id;
  final Value<String> url;
  final Value<String> notes;
  final Value<bool> write;
  final Value<bool> read;
  const DbRelaysCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.notes = const Value.absent(),
    this.write = const Value.absent(),
    this.read = const Value.absent(),
  });
  DbRelaysCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String notes,
    required bool write,
    required bool read,
  })  : url = Value(url),
        notes = Value(notes),
        write = Value(write),
        read = Value(read);
  static Insertable<DbRelay> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? notes,
    Expression<bool>? write,
    Expression<bool>? read,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (notes != null) 'notes': notes,
      if (write != null) 'write': write,
      if (read != null) 'read': read,
    });
  }

  DbRelaysCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<String>? notes,
      Value<bool>? write,
      Value<bool>? read}) {
    return DbRelaysCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      notes: notes ?? this.notes,
      write: write ?? this.write,
      read: read ?? this.read,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (write.present) {
      map['write'] = Variable<bool>(write.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbRelaysCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('notes: $notes, ')
          ..write('write: $write, ')
          ..write('read: $read')
          ..write(')'))
        .toString();
  }
}

class $DbRelayGroupsTable extends DbRelayGroups
    with TableInfo<$DbRelayGroupsTable, DbRelayGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbRelayGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? 'db_relay_groups';
  @override
  String get actualTableName => 'db_relay_groups';
  @override
  VerificationContext validateIntegrity(Insertable<DbRelayGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbRelayGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbRelayGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $DbRelayGroupsTable createAlias(String alias) {
    return $DbRelayGroupsTable(attachedDatabase, alias);
  }
}

class DbRelayGroup extends DataClass implements Insertable<DbRelayGroup> {
  final int id;
  const DbRelayGroup({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  DbRelayGroupsCompanion toCompanion(bool nullToAbsent) {
    return DbRelayGroupsCompanion(
      id: Value(id),
    );
  }

  factory DbRelayGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbRelayGroup(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  DbRelayGroup copyWith({int? id}) => DbRelayGroup(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('DbRelayGroup(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is DbRelayGroup && other.id == this.id);
}

class DbRelayGroupsCompanion extends UpdateCompanion<DbRelayGroup> {
  final Value<int> id;
  const DbRelayGroupsCompanion({
    this.id = const Value.absent(),
  });
  DbRelayGroupsCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<DbRelayGroup> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  DbRelayGroupsCompanion copyWith({Value<int>? id}) {
    return DbRelayGroupsCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbRelayGroupsCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $DbContactsTable dbContacts = $DbContactsTable(this);
  late final $NpubsTable npubs = $NpubsTable(this);
  late final $DbEventsTable dbEvents = $DbEventsTable(this);
  late final $ContactNpubsTable contactNpubs = $ContactNpubsTable(this);
  late final $EtagsTable etags = $EtagsTable(this);
  late final $EventPtagsTable eventPtags = $EventPtagsTable(this);
  late final $EventEtagsTable eventEtags = $EventEtagsTable(this);
  late final $DbRelaysTable dbRelays = $DbRelaysTable(this);
  late final $DbRelayGroupsTable dbRelayGroups = $DbRelayGroupsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dbContacts,
        npubs,
        dbEvents,
        contactNpubs,
        etags,
        eventPtags,
        eventEtags,
        dbRelays,
        dbRelayGroups
      ];
}
