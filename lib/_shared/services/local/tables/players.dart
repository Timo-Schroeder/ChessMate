import 'package:chessmate/_features/players/_models/fide_title.dart';
import 'package:chessmate/_features/players/_models/gender.dart';
import 'package:chessmate/_shared/services/local/tables/tournaments.dart';

import 'package:drift/drift.dart';

class Players extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get firstName => text().withLength(min: 1, max: 32)();

  TextColumn get lastName => text().withLength(min: 1, max: 32)();

  IntColumn get yearOfBirth => integer()();

  TextColumn get gender => textEnum<Gender>()();

  IntColumn get nationalRating => integer().nullable()();

  IntColumn get elo => integer().nullable()();

  TextColumn get club => text().withLength(min: 1, max: 64).nullable()();

  TextColumn get fideTitle => textEnum<FideTitle>()();

  BoolColumn get active => boolean().withDefault(const Constant(true))();

  IntColumn get tournamentId => integer().references(Tournaments, #id)();
}
