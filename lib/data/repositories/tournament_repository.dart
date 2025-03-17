import 'dart:io';

import 'package:chessmatey/data/services/database_service.dart';
import 'package:chessmatey/domain/models/tournament/tournament.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class TournamentRepository {
  Future<Either<String, IList<Tournament>>> getTournaments();

  Future<Either<String, Tournament>> getTournamentById(int id);

  Future<Either<String, Tournament>> createTournament(Tournament tournament);

  Future<Either<String, void>> deleteTournament(int id);
}

class TournamentRepositoryImpl implements TournamentRepository {
  TournamentRepositoryImpl({required DatabaseService database})
      : _database = database;

  final DatabaseService _database;

  @override
  Future<Either<String, IList<Tournament>>> getTournaments() async {
    if (!_database.isOpen()) {
      await _database.open();
    }
    return _database.getAllTournaments();
  }

  @override
  Future<Either<String, Tournament>> getTournamentById(int id) async {
    if (!_database.isOpen()) {
      await _database.open();
    }
    return _database.getTournamentById(id);
  }

  @override
  Future<Either<String, Tournament>> createTournament(
      Tournament tournament) async {
    if (!_database.isOpen()) {
      await _database.open();
    }
    return _database.createTournament(tournament);
  }

  @override
  Future<Either<String, void>> deleteTournament(int id) async {
    if (!_database.isOpen()) {
      await _database.open();
    }
    return _database.deleteTournament(id);
  }
}

final tournamentRepositoryProvider = Provider<TournamentRepository>((ref) {
  late DatabaseService database;

  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    sqfliteFfiInit();
    database = DatabaseService(databaseFactory: databaseFactoryFfi);
  } else {
    database = DatabaseService(databaseFactory: databaseFactory);
  }

  return TournamentRepositoryImpl(database: database);
});
