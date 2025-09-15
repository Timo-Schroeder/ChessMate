import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:watch_it/watch_it.dart' show sl;

import '../../domain/models/tournament/tournament.dart';
import '../services/database_service.dart';

abstract class TournamentRepository {
  Future<Either<String, IList<Tournament>>> getTournaments();

  Future<Either<String, Tournament>> getTournamentById(int id);

  Future<Either<String, Tournament>> createTournament(Tournament tournament);

  Future<Either<String, void>> deleteTournament(int id);

  Future<Either<String, void>> updateTournament(
    int id,
    Tournament tournament,
  );
}

class TournamentRepositoryImpl implements TournamentRepository {
  final _database = sl<DatabaseService>();

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
    Tournament tournament,
  ) async {
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

  @override
  Future<Either<String, void>> updateTournament(
    int id,
    Tournament tournament,
  ) async {
    if (!_database.isOpen()) {
      await _database.open();
    }

    return _database.updateTournament(id, tournament);
  }
}
