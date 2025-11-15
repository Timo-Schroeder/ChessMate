import 'dart:io';

import 'package:chessmate/data/tables/tournaments.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:chessmate/domain/models/tournament/tournament_format.dart';

part 'drift_database.g.dart';

@DriftDatabase(tables: [Tournaments])
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
