import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:chessmate/data/services/database_service.dart';
import 'package:chessmate/domain/models/tournament/tournament.dart';

class FakeDatabaseService implements DatabaseService {
  // Stubs for methods
  Future<Either<String, IList<Tournament>>> Function()? getAllTournamentsStub;
  Future<Either<String, Tournament>> Function(int id)? getTournamentByIdStub;
  Future<Either<String, Tournament>> Function(Tournament tournament)?
      createTournamentStub;
  // ignore: void_checks
  Future<Either<String, void>> Function(int id, Tournament tournament)?
      updateTournamentStub;
  // ignore: void_checks
  Future<Either<String, void>> Function(int id)? deleteTournamentStub;
  Future<void> Function()? initStub;

  @override
  Future<Either<String, IList<Tournament>>> getAllTournaments() {
    if (getAllTournamentsStub != null) return getAllTournamentsStub!();
    throw UnimplementedError('getAllTournaments has not been stubbed');
  }

  @override
  Future<Either<String, Tournament>> getTournamentById(int id) {
    if (getTournamentByIdStub != null) return getTournamentByIdStub!(id);
    throw UnimplementedError('getTournamentById has not been stubbed');
  }

  @override
  Future<Either<String, Tournament>> createTournament(Tournament tournament) {
    if (createTournamentStub != null) return createTournamentStub!(tournament);
    throw UnimplementedError('createTournament has not been stubbed');
  }

  @override
  Future<Either<String, void>> updateTournament(int id, Tournament tournament) {
    if (updateTournamentStub != null) {
      return updateTournamentStub!(id, tournament);
    }
    throw UnimplementedError('updateTournament has not been stubbed');
  }

  @override
  Future<Either<String, void>> deleteTournament(int id) {
    if (deleteTournamentStub != null) return deleteTournamentStub!(id);
    throw UnimplementedError('deleteTournament has not been stubbed');
  }

  @override
  Future<void> init() {
    if (initStub != null) return initStub!();
    throw UnimplementedError('init has not been stubbed');
  }
}
