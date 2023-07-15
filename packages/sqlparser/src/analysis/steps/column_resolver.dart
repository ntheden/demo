part of '../analysis.dart';

/// Walks the AST and, for each select statement it sees, finds out which
/// columns are returned and which columns are available. For instance, when
/// we have a table "t" with two columns "a" and "b", the select statement
/// "SELECT a FROM t" has one result column but two columns available.
class ColumnResolver extends RecursiveVisitor<ColumnResolverContext, void> {
  final AnalysisContext context;

  ColumnResolver(this.context);

  @override
  void visitSelectStatement(SelectStatement e, ColumnResolverContext arg) {
    // visit children first so that common table expressions are resolved
    visitChildren(e, arg);
    _resolveSelect(e, arg);
  }

  @override
  void visitCompoundSelectStatement(
      CompoundSelectStatement e, ColumnResolverContext arg) {
    // first, visit all children so that the compound parts have their columns
    // resolved
    visitChildren(e, arg);

    _resolveCompoundSelect(e);
  }

  @override
  void visitValuesSelectStatement(
      ValuesSelectStatement e, ColumnResolverContext arg) {
    // visit children to resolve CTEs
    visitChildren(e, arg);

    _resolveValuesSelect(e);
  }

  @override
  void visitCommonTableExpression(
      CommonTableExpression e, ColumnResolverContext arg) {
    visitChildren(
      e,
      const ColumnResolverContext(referencesUseNameOfReferencedColumn: false),
    );

    final resolved = e.as.resolvedColumns;
    final names = e.columnNames;
    if (names != null && resolved != null && names.length != resolved.length) {
      context.reportError(AnalysisError(
        type: AnalysisErrorType.cteColumnCountMismatch,
        message: 'This CTE declares ${names.length} columns, but its select '
            'statement actually returns ${resolved.length}.',
        relevantNode: e,
      ));
    }
  }

  @override
  void visitDoUpdate(DoUpdate e, ColumnResolverContext arg) {
    final surroundingInsert = e.parents.whereType<InsertStatement>().first;
    final table = surroundingInsert.table.resultSet;

    if (table != null) {
      // add "excluded" table qualifier that referring to the row that would
      // have been inserted had the uniqueness constraint not been violated.
      e.scope.addAlias(e, table, 'excluded');
    }

    visitChildren(e, arg);
  }

  @override
  void visitTableReference(TableReference e, void arg) {
    if (e.resolved == null) {
      _resolveTableReference(e);
    }
  }

  @override
  void visitUpdateStatement(UpdateStatement e, ColumnResolverContext arg) {
    // Resolve CTEs first
    e.withClause?.accept(this, arg);

    final availableColumns = <Column>[];

    // Add columns from the main table, if it was resolved
    _handle(e.table, availableColumns, arg);
    // Also add columns from a FROM clause, if one is present
    final from = e.from;
    if (from != null) _handle(from, availableColumns, arg);

    e.statementScope.expansionOfStarColumn = availableColumns;
    for (final child in e.childNodes) {
      // Visit remaining children
      if (child != e.table && child != e.from && child != e.withClause) {
        visit(child, arg);
      }
    }

    _resolveReturningClause(e, e.table.resultSet, arg);
  }

  ResultSet? _addIfResolved(AstNode node, TableReference ref) {
    final table = _resolveTableReference(ref);
    if (table != null) {
      node.statementScope.expansionOfStarColumn = table.resolvedColumns;
    }

    return table;
  }

  @override
  void visitInsertStatement(InsertStatement e, ColumnResolverContext arg) {
    // Resolve CTEs first
    e.withClause?.accept(this, arg);

    final into = _addIfResolved(e, e.table);
    for (final child in e.childNodes) {
      if (child != e.withClause) visit(child, arg);
    }
    _resolveReturningClause(e, into, arg);
  }

  @override
  void visitDeleteStatement(DeleteStatement e, ColumnResolverContext arg) {
    // Resolve CTEs first
    e.withClause?.accept(this, arg);

    final from = _addIfResolved(e, e.from);
    for (final child in e.childNodes) {
      if (child != e.withClause) visit(child, arg);
    }
    _resolveReturningClause(e, from, arg);
  }

  /// Infers the result set of a `RETURNING` clause.
  ///
  /// The behavior of `RETURNING` clauses is a bit weird when there are multiple
  /// tables available (which can happen with `UPDATE FROM`). When a star column
  /// is used, it only expands to columns from the main table:
  /// ```sql
  /// CREATE TABLE x (a, b);
  /// -- here, the `*` in returning does not include columns from `old`.
  /// UPDATE x SET a = x.a + 1 FROM (SELECT * FROM x) AS old RETURNING *;
  /// ```
  ///
  /// However, individual columns from other tables are available and supported:
  /// ```sql
  /// UPDATE x SET a = x.a + 1 FROM (SELECT * FROM x) AS old
  ///   RETURNING old.a, old.b;
  /// ```
  ///
  /// Note that `old.*` is forbidden by sqlite and not applicable here.
  void _resolveReturningClause(
    StatementReturningColumns stmt,
    ResultSet? mainTable,
    ColumnResolverContext context,
  ) {
    final clause = stmt.returning;
    if (clause == null) return;

    final columns = _resolveColumns(
      stmt.statementScope,
      clause.columns,
      context,
      columnsForStar: mainTable?.resolvedColumns,
    );
    stmt.returnedResultSet = CustomResultSet(columns);
  }

  @override
  void visitCreateTriggerStatement(
      CreateTriggerStatement e, ColumnResolverContext arg) {
    final table = _resolveTableReference(e.onTable);
    if (table == null) {
      // further analysis is not really possible without knowing the table
      super.visitCreateTriggerStatement(e, arg);
      return;
    }

    final scope = e.statementScope;

    // Add columns of the target table for when and update of clauses
    scope.expansionOfStarColumn = table.resolvedColumns;

    if (e.target.introducesNew) {
      scope.addAlias(e, table, 'new');
    }
    if (e.target.introducesOld) {
      scope.addAlias(e, table, 'old');
    }

    visitChildren(e, arg);
  }

  void _handle(Queryable queryable, List<Column> availableColumns,
      ColumnResolverContext state) {
    void addColumns(Iterable<Column> columns) {
      ResultSetAvailableInStatement? available;
      if (queryable is TableOrSubquery) {
        available = queryable.availableResultSet;
      }

      if (available != null) {
        availableColumns.addAll(
            [for (final column in columns) AvailableColumn(column, available)]);
      } else {
        availableColumns.addAll(columns);
      }
    }

    queryable.when(
      isTable: (table) {
        final resolved = _resolveTableReference(table);
        if (resolved != null) {
          // an error will be logged when resolved is null, so the != null check
          // is fine and avoids crashes
          addColumns(table.resultSet!.resolvedColumns!);
        }
      },
      isSelect: (select) {
        // Inside subqueries, references don't take the name of the referenced
        // column.
        final childState =
            ColumnResolverContext(referencesUseNameOfReferencedColumn: false);

        // the inner select statement doesn't have access to columns defined in
        // the outer statements, which is why we use _resolveSelect instead of
        // passing availableColumns down to a recursive call of _handle
        final stmt = select.statement;
        if (stmt is CompoundSelectStatement) {
          _resolveCompoundSelect(stmt);
        } else if (stmt is SelectStatement) {
          _resolveSelect(stmt, childState);
        } else if (stmt is ValuesSelectStatement) {
          _resolveValuesSelect(stmt);
        } else {
          throw AssertionError('Unknown type of select statement: $stmt');
        }

        addColumns(stmt.resolvedColumns!);
      },
      isJoin: (join) {
        _handle(join.primary, availableColumns, state);
        for (final query in join.joins.map((j) => j.query)) {
          _handle(query, availableColumns, state);
        }
      },
      isTableFunction: (function) {
        final handler = context
            .engineOptions.addedTableFunctions[function.name.toLowerCase()];
        final resolved = handler?.resolveTableValued(context, function);

        if (resolved == null) {
          context.reportError(AnalysisError(
            type: AnalysisErrorType.unknownFunction,
            message: 'Could not extract the result set for this table function',
            relevantNode: function,
          ));
        } else {
          function.resultSet = resolved;
          addColumns(resolved.resolvedColumns!);
        }
      },
    );
  }

  void _resolveSelect(SelectStatement s, ColumnResolverContext context) {
    final availableColumns = <Column>[];
    if (s.from != null) {
      _handle(s.from!, availableColumns, context);
    }

    final scope = s.statementScope;
    scope.expansionOfStarColumn = availableColumns;

    s.resolvedColumns = _resolveColumns(scope, s.columns, context);
  }

  List<Column> _resolveColumns(StatementScope scope, List<ResultColumn> columns,
      ColumnResolverContext state,
      {List<Column>? columnsForStar}) {
    final usedColumns = <Column>[];
    final availableColumns = <Column>[...?scope.expansionOfStarColumn];

    // a select statement can include everything from its sub queries as a
    // result, but also expressions that appear as result columns
    for (final resultColumn in columns) {
      if (resultColumn is StarResultColumn) {
        Iterable<Column>? visibleColumnsForStar;

        if (resultColumn.tableName != null) {
          final tableResolver = scope.resolveResultSet(resultColumn.tableName!);
          if (tableResolver == null) {
            context.reportError(AnalysisError(
              type: AnalysisErrorType.referencedUnknownTable,
              message: 'Unknown table: ${resultColumn.tableName}',
              relevantNode: resultColumn,
            ));
            continue;
          }

          visibleColumnsForStar =
              tableResolver.resultSet.resultSet?.resolvedColumns?.map(
                  (tableColumn) => AvailableColumn(tableColumn, tableResolver));
        } else {
          // we have a * column without a table, that resolves to every column
          // available
          visibleColumnsForStar = columnsForStar ?? availableColumns;

          // Star columns can't be used without a table (e.g. `SELECT *` is
          // not allowed)
          if (scope.resultSets.isEmpty) {
            context.reportError(AnalysisError(
              type: AnalysisErrorType.starColumnWithoutTable,
              message: "Can't use * when no tables have been added",
              relevantNode: resultColumn,
            ));
          }
        }

        final added =
            visibleColumnsForStar!.where((e) => e.includedInResults).toList();

        usedColumns.addAll(added);
        resultColumn.resolvedColumns = added;
      } else if (resultColumn is ExpressionResultColumn) {
        final expression = resultColumn.expression;
        Column column;

        if (expression is Reference) {
          var fixedName = resultColumn.as;
          if (!state.referencesUseNameOfReferencedColumn) {
            fixedName = _nameOfResultColumn(resultColumn);
          }

          column = ReferenceExpressionColumn(
            expression,
            overriddenName: fixedName,
            mappedBy: resultColumn.mappedBy,
          );
        } else {
          final name = _nameOfResultColumn(resultColumn)!;
          column = ExpressionColumn(
            name: name,
            expression: resultColumn.expression,
            mappedBy: resultColumn.mappedBy,
          );
        }

        usedColumns.add(column);
        resultColumn.resolvedColumns = [column];

        if (resultColumn.as != null) {
          // make this column available for references if there is no other
          // column with the same name
          final name = resultColumn.as;
          if (!availableColumns.any((c) => c.name == name)) {
            availableColumns.add(column);
            scope.namedResultColumns.add(column);
          }
        }
      } else if (resultColumn is NestedStarResultColumn) {
        final target = scope.resolveResultSet(resultColumn.tableName);

        if (target == null) {
          context.reportError(AnalysisError(
            type: AnalysisErrorType.referencedUnknownTable,
            message: 'Unknown table: ${resultColumn.tableName}',
            relevantNode: resultColumn,
          ));
          continue;
        }

        resultColumn.resultSet = target.resultSet.resultSet;
      } else if (resultColumn is NestedQueryColumn) {
        _resolveSelect(resultColumn.select, state);
      }
    }

    return usedColumns;
  }

  void _resolveCompoundSelect(CompoundSelectStatement statement) {
    final columnSets = [
      statement.base.resolvedColumns,
      for (var part in statement.additional) part.select.resolvedColumns
    ];

    // each select statement must return the same amount of columns
    final amount = columnSets.first!.length;
    for (var i = 1; i < columnSets.length; i++) {
      if (columnSets[i]!.length != amount) {
        context.reportError(AnalysisError(
          type: AnalysisErrorType.compoundColumnCountMismatch,
          relevantNode: statement,
          message: 'The parts of this compound statement return different '
              'amount of columns',
        ));
        break;
      }
    }

    final resolved = <CompoundSelectColumn>[];

    // merge all columns at each position into a CompoundSelectColumn
    for (var i = 0; i < amount; i++) {
      final columnsAtThisIndex = [
        for (var set in columnSets)
          if (set!.length > i) set[i]
      ];

      resolved.add(
          CompoundSelectColumn(columnsAtThisIndex)..containingSet = statement);
    }
    statement.resolvedColumns = resolved;
  }

  void _resolveValuesSelect(ValuesSelectStatement statement) {
    // ideally all tuples should have the same arity, but the parser doesn't
    // enforce that.
    final amountOfColumns =
        statement.values.fold<int?>(null, (maxLength, tuple) {
      final lengthHere = tuple.expressions.length;
      return maxLength == null ? lengthHere : max(maxLength, lengthHere);
    })!;

    final columns = <Column>[];

    for (var i = 0; i < amountOfColumns; i++) {
      // Columns in a VALUES clause appear to be named "Column$i", where i is a
      // one-based index.
      final columnName = 'Column${i + 1}';
      final expressions = statement.values
          .where((tuple) => tuple.expressions.length > i)
          .map((tuple) => tuple.expressions[i])
          .toList();

      columns.add(ValuesSelectColumn(columnName, expressions)
        ..containingSet = statement);
    }

    statement.resolvedColumns = columns;
  }

  String? _nameOfResultColumn(ExpressionResultColumn c) {
    if (c.as != null) return c.as;

    if (c.expression is Reference) {
      return (c.expression as Reference).columnName;
    }

    // in this case it's just the literal expression. So for instance,
    // "SELECT 3+  5" has a result column called "3+ 5" (consecutive whitespace
    // is removed).
    final span = context.sql.substring(c.firstPosition, c.lastPosition);
    // todo remove consecutive whitespace
    return span;
  }

  ResultSet? _resolveTableReference(TableReference r) {
    final scope = r.scope;

    // Try resolving to a top-level table in the schema and to a result set that
    // may have been added to the table
    final resolvedInSchema = scope.resolveResultSetToAdd(r.tableName);
    final resolvedInQuery = scope.resolveResultSet(r.tableName);
    final createdName = r.as;

    // Prefer using a table that has already been added if this isn't the
    // definition of the added table reference
    if (resolvedInQuery != null && resolvedInQuery.origin != r) {
      final resolved = resolvedInQuery.resultSet.resultSet;
      if (resolved != null) {
        return r.resolved =
            createdName != null ? TableAlias(resolved, createdName) : resolved;
      }
    } else if (resolvedInSchema != null) {
      return r.resolved = createdName != null
          ? TableAlias(resolvedInSchema, createdName)
          : resolvedInSchema;
    } else {
      Iterable<String>? available;

      if (scope is StatementScope) {
        available = StatementScope.cast(scope)
            .allAvailableResultSets
            .where((e) => e.resultSet.resultSet != null)
            .map((t) {
          final resultSet = t.resultSet.resultSet;
          if (resultSet is HumanReadable) {
            return (resultSet as HumanReadable).humanReadableDescription();
          }

          return t.toString();
        });
      }

      context.reportError(UnresolvedReferenceError(
        type: AnalysisErrorType.referencedUnknownTable,
        relevantNode: r,
        reference: r.tableName,
        available: available ?? const Iterable.empty(),
      ));
    }

    return null;
  }
}

class ColumnResolverContext {
  /// Whether reference columns should use the name of the referenced column as
  /// their own name (as opposed to their lexeme).
  ///
  /// This typically doesn't make a difference, as references uses the same
  /// name as the referenced column. It does make a difference for rowid
  /// references though:
  ///
  /// ```sql
  /// CREATE TABLE foo (id INTEGER NOT NULL PRIMARY KEY);
  ///
  /// SELECT rowid FROM foo; -- returns a column named "id"
  /// SELECT * FROM (SELECT rowid FROM foo); -- returns a column named "rowid"
  /// WITH bar AS (SELECT rowid FROM foo) SELECT * FROM bar; -- again, "rowid"
  /// ```
  ///
  /// As the example shows, references don't take the name of their referenced
  /// column in subqueries or CTEs.
  final bool referencesUseNameOfReferencedColumn;

  const ColumnResolverContext(
      {this.referencesUseNameOfReferencedColumn = true});
}
