import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';

import 'package:chessmate/domain/models/tournament/tournament.dart';
import 'package:chessmate/data/services/database_service.dart';

class TournamentRepository {
  final DatabaseService _database;

  TournamentRepository(this._database);

  Future<Either<String, IList<Tournament>>> getTournaments() {
    return _database.getAllTournaments();
  }

  Future<Either<String, Tournament>> getTournamentById(int id) {
    return _database.getTournamentById(id);
  }

  Future<Either<String, Tournament>> createTournament(
    Tournament tournament,
  ) {
    return _database.createTournament(tournament);
  }

  Future<Either<String, void>> deleteTournament(int id) {
    return _database.deleteTournament(id);
  }

  Future<Either<String, void>> updateTournament(
    int id,
    Tournament tournament,
  ) {
    return _database.updateTournament(id, tournament);
  }
}
