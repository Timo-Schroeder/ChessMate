import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/models/tournament/tournament.dart';
import '../../utils/locator.dart';
import '../services/database_service.dart';

abstract class TournamentRepository {
  Future<Either<String, IList<Tournament>>> getTournaments();

  Future<Either<String, Tournament>> getTournamentById(int id);

  Future<Either<String, Tournament>> createTournament(Tournament tournament);

  Future<Either<String, void>> deleteTournament(int id);
}

class TournamentRepositoryImpl implements TournamentRepository {
  final _database = locator<DatabaseService>();

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
