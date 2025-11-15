// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $TournamentsTable extends Tournaments
    with TableInfo<$TournamentsTable, Tournament> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TournamentsTable(this.attachedDatabase, [this._alias]);
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
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<TournamentFormat, String> format =
      GeneratedColumn<String>('format', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TournamentFormat>($TournamentsTable.$converterformat);
  static const VerificationMeta _hasStartedMeta =
      const VerificationMeta('hasStarted');
  @override
  late final GeneratedColumn<bool> hasStarted = GeneratedColumn<bool>(
      'has_started', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_started" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hasFinishedMeta =
      const VerificationMeta('hasFinished');
  @override
  late final GeneratedColumn<bool> hasFinished = GeneratedColumn<bool>(
      'has_finished', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_finished" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        startDate,
        endDate,
        format,
        hasStarted,
        hasFinished,
        isArchived
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tournaments';
  @override
  VerificationContext validateIntegrity(Insertable<Tournament> instance,
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
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('has_started')) {
      context.handle(
          _hasStartedMeta,
          hasStarted.isAcceptableOrUnknown(
              data['has_started']!, _hasStartedMeta));
    }
    if (data.containsKey('has_finished')) {
      context.handle(
          _hasFinishedMeta,
          hasFinished.isAcceptableOrUnknown(
              data['has_finished']!, _hasFinishedMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tournament map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tournament(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      format: $TournamentsTable.$converterformat.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format'])!),
      hasStarted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_started'])!,
      hasFinished: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_finished'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
    );
  }

  @override
  $TournamentsTable createAlias(String alias) {
    return $TournamentsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TournamentFormat, String, String> $converterformat =
      const EnumNameConverter<TournamentFormat>(TournamentFormat.values);
}

class Tournament extends DataClass implements Insertable<Tournament> {
  final int id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final TournamentFormat format;
  final bool hasStarted;
  final bool hasFinished;
  final bool isArchived;
  const Tournament(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.format,
      required this.hasStarted,
      required this.hasFinished,
      required this.isArchived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    {
      map['format'] =
          Variable<String>($TournamentsTable.$converterformat.toSql(format));
    }
    map['has_started'] = Variable<bool>(hasStarted);
    map['has_finished'] = Variable<bool>(hasFinished);
    map['is_archived'] = Variable<bool>(isArchived);
    return map;
  }

  TournamentsCompanion toCompanion(bool nullToAbsent) {
    return TournamentsCompanion(
      id: Value(id),
      name: Value(name),
      startDate: Value(startDate),
      endDate: Value(endDate),
      format: Value(format),
      hasStarted: Value(hasStarted),
      hasFinished: Value(hasFinished),
      isArchived: Value(isArchived),
    );
  }

  factory Tournament.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tournament(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      format: $TournamentsTable.$converterformat
          .fromJson(serializer.fromJson<String>(json['format'])),
      hasStarted: serializer.fromJson<bool>(json['hasStarted']),
      hasFinished: serializer.fromJson<bool>(json['hasFinished']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'format': serializer
          .toJson<String>($TournamentsTable.$converterformat.toJson(format)),
      'hasStarted': serializer.toJson<bool>(hasStarted),
      'hasFinished': serializer.toJson<bool>(hasFinished),
      'isArchived': serializer.toJson<bool>(isArchived),
    };
  }

  Tournament copyWith(
          {int? id,
          String? name,
          DateTime? startDate,
          DateTime? endDate,
          TournamentFormat? format,
          bool? hasStarted,
          bool? hasFinished,
          bool? isArchived}) =>
      Tournament(
        id: id ?? this.id,
        name: name ?? this.name,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        format: format ?? this.format,
        hasStarted: hasStarted ?? this.hasStarted,
        hasFinished: hasFinished ?? this.hasFinished,
        isArchived: isArchived ?? this.isArchived,
      );
  Tournament copyWithCompanion(TournamentsCompanion data) {
    return Tournament(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      format: data.format.present ? data.format.value : this.format,
      hasStarted:
          data.hasStarted.present ? data.hasStarted.value : this.hasStarted,
      hasFinished:
          data.hasFinished.present ? data.hasFinished.value : this.hasFinished,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tournament(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('format: $format, ')
          ..write('hasStarted: $hasStarted, ')
          ..write('hasFinished: $hasFinished, ')
          ..write('isArchived: $isArchived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, startDate, endDate, format,
      hasStarted, hasFinished, isArchived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tournament &&
          other.id == this.id &&
          other.name == this.name &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.format == this.format &&
          other.hasStarted == this.hasStarted &&
          other.hasFinished == this.hasFinished &&
          other.isArchived == this.isArchived);
}

class TournamentsCompanion extends UpdateCompanion<Tournament> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<TournamentFormat> format;
  final Value<bool> hasStarted;
  final Value<bool> hasFinished;
  final Value<bool> isArchived;
  const TournamentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.format = const Value.absent(),
    this.hasStarted = const Value.absent(),
    this.hasFinished = const Value.absent(),
    this.isArchived = const Value.absent(),
  });
  TournamentsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    required TournamentFormat format,
    this.hasStarted = const Value.absent(),
    this.hasFinished = const Value.absent(),
    this.isArchived = const Value.absent(),
  })  : name = Value(name),
        startDate = Value(startDate),
        endDate = Value(endDate),
        format = Value(format);
  static Insertable<Tournament> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? format,
    Expression<bool>? hasStarted,
    Expression<bool>? hasFinished,
    Expression<bool>? isArchived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (format != null) 'format': format,
      if (hasStarted != null) 'has_started': hasStarted,
      if (hasFinished != null) 'has_finished': hasFinished,
      if (isArchived != null) 'is_archived': isArchived,
    });
  }

  TournamentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<TournamentFormat>? format,
      Value<bool>? hasStarted,
      Value<bool>? hasFinished,
      Value<bool>? isArchived}) {
    return TournamentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      format: format ?? this.format,
      hasStarted: hasStarted ?? this.hasStarted,
      hasFinished: hasFinished ?? this.hasFinished,
      isArchived: isArchived ?? this.isArchived,
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
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(
          $TournamentsTable.$converterformat.toSql(format.value));
    }
    if (hasStarted.present) {
      map['has_started'] = Variable<bool>(hasStarted.value);
    }
    if (hasFinished.present) {
      map['has_finished'] = Variable<bool>(hasFinished.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TournamentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('format: $format, ')
          ..write('hasStarted: $hasStarted, ')
          ..write('hasFinished: $hasFinished, ')
          ..write('isArchived: $isArchived')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TournamentsTable tournaments = $TournamentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tournaments];
}

typedef $$TournamentsTableCreateCompanionBuilder = TournamentsCompanion
    Function({
  Value<int> id,
  required String name,
  required DateTime startDate,
  required DateTime endDate,
  required TournamentFormat format,
  Value<bool> hasStarted,
  Value<bool> hasFinished,
  Value<bool> isArchived,
});
typedef $$TournamentsTableUpdateCompanionBuilder = TournamentsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<TournamentFormat> format,
  Value<bool> hasStarted,
  Value<bool> hasFinished,
  Value<bool> isArchived,
});

class $$TournamentsTableFilterComposer
    extends Composer<_$AppDatabase, $TournamentsTable> {
  $$TournamentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TournamentFormat, TournamentFormat, String>
      get format => $composableBuilder(
          column: $table.format,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get hasStarted => $composableBuilder(
      column: $table.hasStarted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasFinished => $composableBuilder(
      column: $table.hasFinished, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));
}

class $$TournamentsTableOrderingComposer
    extends Composer<_$AppDatabase, $TournamentsTable> {
  $$TournamentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasStarted => $composableBuilder(
      column: $table.hasStarted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasFinished => $composableBuilder(
      column: $table.hasFinished, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));
}

class $$TournamentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TournamentsTable> {
  $$TournamentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TournamentFormat, String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<bool> get hasStarted => $composableBuilder(
      column: $table.hasStarted, builder: (column) => column);

  GeneratedColumn<bool> get hasFinished => $composableBuilder(
      column: $table.hasFinished, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);
}

class $$TournamentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TournamentsTable,
    Tournament,
    $$TournamentsTableFilterComposer,
    $$TournamentsTableOrderingComposer,
    $$TournamentsTableAnnotationComposer,
    $$TournamentsTableCreateCompanionBuilder,
    $$TournamentsTableUpdateCompanionBuilder,
    (Tournament, BaseReferences<_$AppDatabase, $TournamentsTable, Tournament>),
    Tournament,
    PrefetchHooks Function()> {
  $$TournamentsTableTableManager(_$AppDatabase db, $TournamentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TournamentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TournamentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TournamentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<TournamentFormat> format = const Value.absent(),
            Value<bool> hasStarted = const Value.absent(),
            Value<bool> hasFinished = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
          }) =>
              TournamentsCompanion(
            id: id,
            name: name,
            startDate: startDate,
            endDate: endDate,
            format: format,
            hasStarted: hasStarted,
            hasFinished: hasFinished,
            isArchived: isArchived,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required DateTime startDate,
            required DateTime endDate,
            required TournamentFormat format,
            Value<bool> hasStarted = const Value.absent(),
            Value<bool> hasFinished = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
          }) =>
              TournamentsCompanion.insert(
            id: id,
            name: name,
            startDate: startDate,
            endDate: endDate,
            format: format,
            hasStarted: hasStarted,
            hasFinished: hasFinished,
            isArchived: isArchived,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TournamentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TournamentsTable,
    Tournament,
    $$TournamentsTableFilterComposer,
    $$TournamentsTableOrderingComposer,
    $$TournamentsTableAnnotationComposer,
    $$TournamentsTableCreateCompanionBuilder,
    $$TournamentsTableUpdateCompanionBuilder,
    (Tournament, BaseReferences<_$AppDatabase, $TournamentsTable, Tournament>),
    Tournament,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TournamentsTableTableManager get tournaments =>
      $$TournamentsTableTableManager(_db, _db.tournaments);
}
