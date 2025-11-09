import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:chessmate/domain/models/tournament/tournament.dart';

abstract class DatabaseService {
  Future<void> init();

  Future<Either<String, IList<Tournament>>> getAllTournaments();

  Future<Either<String, Tournament>> getTournamentById(int id);

  Future<Either<String, Tournament>> createTournament(Tournament tournament);

  Future<Either<String, void>> updateTournament(int id, Tournament tournament);

  Future<Either<String, void>> deleteTournament(int id);
}
