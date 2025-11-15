import 'dart:io';

import 'package:chessmate/data/tables/players.dart';
import 'package:chessmate/data/tables/tournaments.dart';
import 'package:chessmate/domain/models/tournament/tournament_format.dart';
import 'package:chessmate/domain/models/player/gender.dart';
import 'package:chessmate/domain/models/player/fide_title.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DriftDatabase(tables: [Tournaments, Players])
class AppDatabase extends _$AppDatabase {
  @override
  int get schemaVersion => 1;

  AppDatabase() : super(_openConnection());
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
