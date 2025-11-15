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

class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _yearOfBirthMeta =
      const VerificationMeta('yearOfBirth');
  @override
  late final GeneratedColumn<int> yearOfBirth = GeneratedColumn<int>(
      'year_of_birth', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Gender, String> gender =
      GeneratedColumn<String>('gender', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Gender>($PlayersTable.$convertergender);
  static const VerificationMeta _nationalRatingMeta =
      const VerificationMeta('nationalRating');
  @override
  late final GeneratedColumn<int> nationalRating = GeneratedColumn<int>(
      'national_rating', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _eloMeta = const VerificationMeta('elo');
  @override
  late final GeneratedColumn<int> elo = GeneratedColumn<int>(
      'elo', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clubMeta = const VerificationMeta('club');
  @override
  late final GeneratedColumn<String> club = GeneratedColumn<String>(
      'club', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<FideTitle?, String> fideTitle =
      GeneratedColumn<String>('fide_title', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<FideTitle?>($PlayersTable.$converterfideTitlen);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _tournamentIdMeta =
      const VerificationMeta('tournamentId');
  @override
  late final GeneratedColumn<int> tournamentId = GeneratedColumn<int>(
      'tournament_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tournaments (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstName,
        lastName,
        yearOfBirth,
        gender,
        nationalRating,
        elo,
        club,
        fideTitle,
        active,
        tournamentId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'players';
  @override
  VerificationContext validateIntegrity(Insertable<Player> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('year_of_birth')) {
      context.handle(
          _yearOfBirthMeta,
          yearOfBirth.isAcceptableOrUnknown(
              data['year_of_birth']!, _yearOfBirthMeta));
    } else if (isInserting) {
      context.missing(_yearOfBirthMeta);
    }
    if (data.containsKey('national_rating')) {
      context.handle(
          _nationalRatingMeta,
          nationalRating.isAcceptableOrUnknown(
              data['national_rating']!, _nationalRatingMeta));
    }
    if (data.containsKey('elo')) {
      context.handle(
          _eloMeta, elo.isAcceptableOrUnknown(data['elo']!, _eloMeta));
    }
    if (data.containsKey('club')) {
      context.handle(
          _clubMeta, club.isAcceptableOrUnknown(data['club']!, _clubMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('tournament_id')) {
      context.handle(
          _tournamentIdMeta,
          tournamentId.isAcceptableOrUnknown(
              data['tournament_id']!, _tournamentIdMeta));
    } else if (isInserting) {
      context.missing(_tournamentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Player(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      yearOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year_of_birth'])!,
      gender: $PlayersTable.$convertergender.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!),
      nationalRating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}national_rating']),
      elo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}elo']),
      club: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}club']),
      fideTitle: $PlayersTable.$converterfideTitlen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fide_title'])),
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      tournamentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tournament_id'])!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Gender, String, String> $convertergender =
      const EnumNameConverter<Gender>(Gender.values);
  static JsonTypeConverter2<FideTitle, String, String> $converterfideTitle =
      const EnumNameConverter<FideTitle>(FideTitle.values);
  static JsonTypeConverter2<FideTitle?, String?, String?> $converterfideTitlen =
      JsonTypeConverter2.asNullable($converterfideTitle);
}

class Player extends DataClass implements Insertable<Player> {
  final int id;
  final String firstName;
  final String lastName;
  final int yearOfBirth;
  final Gender gender;
  final int? nationalRating;
  final int? elo;
  final String? club;
  final FideTitle? fideTitle;
  final bool active;
  final int tournamentId;
  const Player(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.yearOfBirth,
      required this.gender,
      this.nationalRating,
      this.elo,
      this.club,
      this.fideTitle,
      required this.active,
      required this.tournamentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['year_of_birth'] = Variable<int>(yearOfBirth);
    {
      map['gender'] =
          Variable<String>($PlayersTable.$convertergender.toSql(gender));
    }
    if (!nullToAbsent || nationalRating != null) {
      map['national_rating'] = Variable<int>(nationalRating);
    }
    if (!nullToAbsent || elo != null) {
      map['elo'] = Variable<int>(elo);
    }
    if (!nullToAbsent || club != null) {
      map['club'] = Variable<String>(club);
    }
    if (!nullToAbsent || fideTitle != null) {
      map['fide_title'] =
          Variable<String>($PlayersTable.$converterfideTitlen.toSql(fideTitle));
    }
    map['active'] = Variable<bool>(active);
    map['tournament_id'] = Variable<int>(tournamentId);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      yearOfBirth: Value(yearOfBirth),
      gender: Value(gender),
      nationalRating: nationalRating == null && nullToAbsent
          ? const Value.absent()
          : Value(nationalRating),
      elo: elo == null && nullToAbsent ? const Value.absent() : Value(elo),
      club: club == null && nullToAbsent ? const Value.absent() : Value(club),
      fideTitle: fideTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(fideTitle),
      active: Value(active),
      tournamentId: Value(tournamentId),
    );
  }

  factory Player.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      yearOfBirth: serializer.fromJson<int>(json['yearOfBirth']),
      gender: $PlayersTable.$convertergender
          .fromJson(serializer.fromJson<String>(json['gender'])),
      nationalRating: serializer.fromJson<int?>(json['nationalRating']),
      elo: serializer.fromJson<int?>(json['elo']),
      club: serializer.fromJson<String?>(json['club']),
      fideTitle: $PlayersTable.$converterfideTitlen
          .fromJson(serializer.fromJson<String?>(json['fideTitle'])),
      active: serializer.fromJson<bool>(json['active']),
      tournamentId: serializer.fromJson<int>(json['tournamentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'yearOfBirth': serializer.toJson<int>(yearOfBirth),
      'gender': serializer
          .toJson<String>($PlayersTable.$convertergender.toJson(gender)),
      'nationalRating': serializer.toJson<int?>(nationalRating),
      'elo': serializer.toJson<int?>(elo),
      'club': serializer.toJson<String?>(club),
      'fideTitle': serializer.toJson<String?>(
          $PlayersTable.$converterfideTitlen.toJson(fideTitle)),
      'active': serializer.toJson<bool>(active),
      'tournamentId': serializer.toJson<int>(tournamentId),
    };
  }

  Player copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          int? yearOfBirth,
          Gender? gender,
          Value<int?> nationalRating = const Value.absent(),
          Value<int?> elo = const Value.absent(),
          Value<String?> club = const Value.absent(),
          Value<FideTitle?> fideTitle = const Value.absent(),
          bool? active,
          int? tournamentId}) =>
      Player(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        yearOfBirth: yearOfBirth ?? this.yearOfBirth,
        gender: gender ?? this.gender,
        nationalRating:
            nationalRating.present ? nationalRating.value : this.nationalRating,
        elo: elo.present ? elo.value : this.elo,
        club: club.present ? club.value : this.club,
        fideTitle: fideTitle.present ? fideTitle.value : this.fideTitle,
        active: active ?? this.active,
        tournamentId: tournamentId ?? this.tournamentId,
      );
  Player copyWithCompanion(PlayersCompanion data) {
    return Player(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      yearOfBirth:
          data.yearOfBirth.present ? data.yearOfBirth.value : this.yearOfBirth,
      gender: data.gender.present ? data.gender.value : this.gender,
      nationalRating: data.nationalRating.present
          ? data.nationalRating.value
          : this.nationalRating,
      elo: data.elo.present ? data.elo.value : this.elo,
      club: data.club.present ? data.club.value : this.club,
      fideTitle: data.fideTitle.present ? data.fideTitle.value : this.fideTitle,
      active: data.active.present ? data.active.value : this.active,
      tournamentId: data.tournamentId.present
          ? data.tournamentId.value
          : this.tournamentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('yearOfBirth: $yearOfBirth, ')
          ..write('gender: $gender, ')
          ..write('nationalRating: $nationalRating, ')
          ..write('elo: $elo, ')
          ..write('club: $club, ')
          ..write('fideTitle: $fideTitle, ')
          ..write('active: $active, ')
          ..write('tournamentId: $tournamentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstName, lastName, yearOfBirth, gender,
      nationalRating, elo, club, fideTitle, active, tournamentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.yearOfBirth == this.yearOfBirth &&
          other.gender == this.gender &&
          other.nationalRating == this.nationalRating &&
          other.elo == this.elo &&
          other.club == this.club &&
          other.fideTitle == this.fideTitle &&
          other.active == this.active &&
          other.tournamentId == this.tournamentId);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<int> yearOfBirth;
  final Value<Gender> gender;
  final Value<int?> nationalRating;
  final Value<int?> elo;
  final Value<String?> club;
  final Value<FideTitle?> fideTitle;
  final Value<bool> active;
  final Value<int> tournamentId;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.yearOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.nationalRating = const Value.absent(),
    this.elo = const Value.absent(),
    this.club = const Value.absent(),
    this.fideTitle = const Value.absent(),
    this.active = const Value.absent(),
    this.tournamentId = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required int yearOfBirth,
    required Gender gender,
    this.nationalRating = const Value.absent(),
    this.elo = const Value.absent(),
    this.club = const Value.absent(),
    this.fideTitle = const Value.absent(),
    this.active = const Value.absent(),
    required int tournamentId,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        yearOfBirth = Value(yearOfBirth),
        gender = Value(gender),
        tournamentId = Value(tournamentId);
  static Insertable<Player> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<int>? yearOfBirth,
    Expression<String>? gender,
    Expression<int>? nationalRating,
    Expression<int>? elo,
    Expression<String>? club,
    Expression<String>? fideTitle,
    Expression<bool>? active,
    Expression<int>? tournamentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (yearOfBirth != null) 'year_of_birth': yearOfBirth,
      if (gender != null) 'gender': gender,
      if (nationalRating != null) 'national_rating': nationalRating,
      if (elo != null) 'elo': elo,
      if (club != null) 'club': club,
      if (fideTitle != null) 'fide_title': fideTitle,
      if (active != null) 'active': active,
      if (tournamentId != null) 'tournament_id': tournamentId,
    });
  }

  PlayersCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<int>? yearOfBirth,
      Value<Gender>? gender,
      Value<int?>? nationalRating,
      Value<int?>? elo,
      Value<String?>? club,
      Value<FideTitle?>? fideTitle,
      Value<bool>? active,
      Value<int>? tournamentId}) {
    return PlayersCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      yearOfBirth: yearOfBirth ?? this.yearOfBirth,
      gender: gender ?? this.gender,
      nationalRating: nationalRating ?? this.nationalRating,
      elo: elo ?? this.elo,
      club: club ?? this.club,
      fideTitle: fideTitle ?? this.fideTitle,
      active: active ?? this.active,
      tournamentId: tournamentId ?? this.tournamentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (yearOfBirth.present) {
      map['year_of_birth'] = Variable<int>(yearOfBirth.value);
    }
    if (gender.present) {
      map['gender'] =
          Variable<String>($PlayersTable.$convertergender.toSql(gender.value));
    }
    if (nationalRating.present) {
      map['national_rating'] = Variable<int>(nationalRating.value);
    }
    if (elo.present) {
      map['elo'] = Variable<int>(elo.value);
    }
    if (club.present) {
      map['club'] = Variable<String>(club.value);
    }
    if (fideTitle.present) {
      map['fide_title'] = Variable<String>(
          $PlayersTable.$converterfideTitlen.toSql(fideTitle.value));
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (tournamentId.present) {
      map['tournament_id'] = Variable<int>(tournamentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('yearOfBirth: $yearOfBirth, ')
          ..write('gender: $gender, ')
          ..write('nationalRating: $nationalRating, ')
          ..write('elo: $elo, ')
          ..write('club: $club, ')
          ..write('fideTitle: $fideTitle, ')
          ..write('active: $active, ')
          ..write('tournamentId: $tournamentId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TournamentsTable tournaments = $TournamentsTable(this);
  late final $PlayersTable players = $PlayersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tournaments, players];
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

final class $$TournamentsTableReferences
    extends BaseReferences<_$AppDatabase, $TournamentsTable, Tournament> {
  $$TournamentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlayersTable, List<Player>> _playersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.players,
          aliasName:
              $_aliasNameGenerator(db.tournaments.id, db.players.tournamentId));

  $$PlayersTableProcessedTableManager get playersRefs {
    final manager = $$PlayersTableTableManager($_db, $_db.players)
        .filter((f) => f.tournamentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_playersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  Expression<bool> playersRefs(
      Expression<bool> Function($$PlayersTableFilterComposer f) f) {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.players,
        getReferencedColumn: (t) => t.tournamentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayersTableFilterComposer(
              $db: $db,
              $table: $db.players,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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

  Expression<T> playersRefs<T extends Object>(
      Expression<T> Function($$PlayersTableAnnotationComposer a) f) {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.players,
        getReferencedColumn: (t) => t.tournamentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayersTableAnnotationComposer(
              $db: $db,
              $table: $db.players,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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
    (Tournament, $$TournamentsTableReferences),
    Tournament,
    PrefetchHooks Function({bool playersRefs})> {
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
              .map((e) => (
                    e.readTable(table),
                    $$TournamentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({playersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (playersRefs) db.players],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (playersRefs)
                    await $_getPrefetchedData<Tournament, $TournamentsTable,
                            Player>(
                        currentTable: table,
                        referencedTable:
                            $$TournamentsTableReferences._playersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TournamentsTableReferences(db, table, p0)
                                .playersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.tournamentId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
    (Tournament, $$TournamentsTableReferences),
    Tournament,
    PrefetchHooks Function({bool playersRefs})>;
typedef $$PlayersTableCreateCompanionBuilder = PlayersCompanion Function({
  Value<int> id,
  required String firstName,
  required String lastName,
  required int yearOfBirth,
  required Gender gender,
  Value<int?> nationalRating,
  Value<int?> elo,
  Value<String?> club,
  Value<FideTitle?> fideTitle,
  Value<bool> active,
  required int tournamentId,
});
typedef $$PlayersTableUpdateCompanionBuilder = PlayersCompanion Function({
  Value<int> id,
  Value<String> firstName,
  Value<String> lastName,
  Value<int> yearOfBirth,
  Value<Gender> gender,
  Value<int?> nationalRating,
  Value<int?> elo,
  Value<String?> club,
  Value<FideTitle?> fideTitle,
  Value<bool> active,
  Value<int> tournamentId,
});

final class $$PlayersTableReferences
    extends BaseReferences<_$AppDatabase, $PlayersTable, Player> {
  $$PlayersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TournamentsTable _tournamentIdTable(_$AppDatabase db) =>
      db.tournaments.createAlias(
          $_aliasNameGenerator(db.players.tournamentId, db.tournaments.id));

  $$TournamentsTableProcessedTableManager get tournamentId {
    final $_column = $_itemColumn<int>('tournament_id')!;

    final manager = $$TournamentsTableTableManager($_db, $_db.tournaments)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tournamentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PlayersTableFilterComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get yearOfBirth => $composableBuilder(
      column: $table.yearOfBirth, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Gender, Gender, String> get gender =>
      $composableBuilder(
          column: $table.gender,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get nationalRating => $composableBuilder(
      column: $table.nationalRating,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get elo => $composableBuilder(
      column: $table.elo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get club => $composableBuilder(
      column: $table.club, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<FideTitle?, FideTitle, String> get fideTitle =>
      $composableBuilder(
          column: $table.fideTitle,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  $$TournamentsTableFilterComposer get tournamentId {
    final $$TournamentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tournamentId,
        referencedTable: $db.tournaments,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TournamentsTableFilterComposer(
              $db: $db,
              $table: $db.tournaments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get yearOfBirth => $composableBuilder(
      column: $table.yearOfBirth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get nationalRating => $composableBuilder(
      column: $table.nationalRating,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get elo => $composableBuilder(
      column: $table.elo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get club => $composableBuilder(
      column: $table.club, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fideTitle => $composableBuilder(
      column: $table.fideTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  $$TournamentsTableOrderingComposer get tournamentId {
    final $$TournamentsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tournamentId,
        referencedTable: $db.tournaments,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TournamentsTableOrderingComposer(
              $db: $db,
              $table: $db.tournaments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<int> get yearOfBirth => $composableBuilder(
      column: $table.yearOfBirth, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Gender, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<int> get nationalRating => $composableBuilder(
      column: $table.nationalRating, builder: (column) => column);

  GeneratedColumn<int> get elo =>
      $composableBuilder(column: $table.elo, builder: (column) => column);

  GeneratedColumn<String> get club =>
      $composableBuilder(column: $table.club, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FideTitle?, String> get fideTitle =>
      $composableBuilder(column: $table.fideTitle, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  $$TournamentsTableAnnotationComposer get tournamentId {
    final $$TournamentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tournamentId,
        referencedTable: $db.tournaments,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TournamentsTableAnnotationComposer(
              $db: $db,
              $table: $db.tournaments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlayersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlayersTable,
    Player,
    $$PlayersTableFilterComposer,
    $$PlayersTableOrderingComposer,
    $$PlayersTableAnnotationComposer,
    $$PlayersTableCreateCompanionBuilder,
    $$PlayersTableUpdateCompanionBuilder,
    (Player, $$PlayersTableReferences),
    Player,
    PrefetchHooks Function({bool tournamentId})> {
  $$PlayersTableTableManager(_$AppDatabase db, $PlayersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<int> yearOfBirth = const Value.absent(),
            Value<Gender> gender = const Value.absent(),
            Value<int?> nationalRating = const Value.absent(),
            Value<int?> elo = const Value.absent(),
            Value<String?> club = const Value.absent(),
            Value<FideTitle?> fideTitle = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<int> tournamentId = const Value.absent(),
          }) =>
              PlayersCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            yearOfBirth: yearOfBirth,
            gender: gender,
            nationalRating: nationalRating,
            elo: elo,
            club: club,
            fideTitle: fideTitle,
            active: active,
            tournamentId: tournamentId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firstName,
            required String lastName,
            required int yearOfBirth,
            required Gender gender,
            Value<int?> nationalRating = const Value.absent(),
            Value<int?> elo = const Value.absent(),
            Value<String?> club = const Value.absent(),
            Value<FideTitle?> fideTitle = const Value.absent(),
            Value<bool> active = const Value.absent(),
            required int tournamentId,
          }) =>
              PlayersCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            yearOfBirth: yearOfBirth,
            gender: gender,
            nationalRating: nationalRating,
            elo: elo,
            club: club,
            fideTitle: fideTitle,
            active: active,
            tournamentId: tournamentId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PlayersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({tournamentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (tournamentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tournamentId,
                    referencedTable:
                        $$PlayersTableReferences._tournamentIdTable(db),
                    referencedColumn:
                        $$PlayersTableReferences._tournamentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PlayersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlayersTable,
    Player,
    $$PlayersTableFilterComposer,
    $$PlayersTableOrderingComposer,
    $$PlayersTableAnnotationComposer,
    $$PlayersTableCreateCompanionBuilder,
    $$PlayersTableUpdateCompanionBuilder,
    (Player, $$PlayersTableReferences),
    Player,
    PrefetchHooks Function({bool tournamentId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TournamentsTableTableManager get tournaments =>
      $$TournamentsTableTableManager(_db, _db.tournaments);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
}
