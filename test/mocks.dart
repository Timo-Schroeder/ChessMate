import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart'; // Added import
import 'package:fast_immutable_collections/fast_immutable_collections.dart'; // Added import

import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/data/services/database_service.dart'; // Import the abstract DatabaseService
import 'package:chessmate/domain/models/tournament/tournament.dart'; // Needed for IList<Tournament>

class MockTournamentRepository extends Mock implements TournamentRepository {}

class MockDatabaseService extends Mock implements DatabaseService {
  @override
  Future<void> init() => super.noSuchMethod(Invocation.method(#init, []));

  @override
  Future<Either<String, IList<Tournament>>> getAllTournaments() =>
      super.noSuchMethod(Invocation.method(#getAllTournaments, []));

  @override
  Future<Either<String, Tournament>> getTournamentById(int id) =>
      super.noSuchMethod(Invocation.method(#getTournamentById, [id]));

  @override
  Future<Either<String, Tournament>> createTournament(Tournament tournament) =>
      super.noSuchMethod(Invocation.method(#createTournament, [tournament]));

  @override
  Future<Either<String, void>> updateTournament(
          int id, Tournament tournament) =>
      super
          .noSuchMethod(Invocation.method(#updateTournament, [id, tournament]));

  @override
  Future<Either<String, void>> deleteTournament(int id) =>
      super.noSuchMethod(Invocation.method(#deleteTournament, [id]));
}
