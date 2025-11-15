import 'package:chessmate/domain/models/tournament/tournament_format.dart';
import 'package:drift/drift.dart';

class Tournaments extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 32)();

  DateTimeColumn get startDate => dateTime()();

  DateTimeColumn get endDate => dateTime()();

  TextColumn get format => textEnum<TournamentFormat>()();

  BoolColumn get hasStarted => boolean().withDefault(const Constant(false))();

  BoolColumn get hasFinished => boolean().withDefault(const Constant(false))();

  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
}
