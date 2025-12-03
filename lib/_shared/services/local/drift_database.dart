import 'dart:io';

import 'package:chessmate/_shared/services/local/tables/players.dart';
import 'package:chessmate/_shared/services/local/tables/tournaments.dart';
import 'package:chessmate/_features/tournaments/_models/tournament_format.dart';
import 'package:chessmate/_features/players/_models/gender.dart';
import 'package:chessmate/_features/players/_models/fide_title.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DriftDatabase(tables: [Tournaments, Players])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  factory AppDatabase.standard() {
    return AppDatabase(_openConnection());
  }

  factory AppDatabase.inMemory() {
    return AppDatabase(NativeDatabase.memory());
  }

  @override
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
