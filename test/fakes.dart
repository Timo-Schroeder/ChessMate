import 'package:chessmate/domain/models/player/player.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chessmate/data/services/database_service.dart';
import 'package:chessmate/domain/models/tournament/tournament.dart';

class FakePlayer extends Fake implements Player {}

class FakeDatabaseService implements DatabaseService {
  Future<Either<String, IList<Tournament>>> Function()? getAllTournamentsStub;
  Future<Either<String, Tournament>> Function(int id)? getTournamentByIdStub;
  Future<Either<String, Tournament>> Function(Tournament tournament)?
  createTournamentStub;
  Future<Either<String, void>> Function(int id, Tournament tournament)?
  updateTournamentStub;
  Future<Either<String, void>> Function(int id)? deleteTournamentStub;
  Future<void> Function()? initStub;
  Future<Either<String, Player>> Function(Player player)? createPlayerStub;
  Future<Either<String, void>> Function(int id)? deletePlayerStub;
  Future<Either<String, Player>> Function(int id)? getPlayerByIdStub;
  Future<Either<String, IList<Player>>> Function(int tournamentId)?
  getPlayersInTournamentStub;
  Future<Either<String, void>> Function(int id, Player player)?
  updatePlayerStub;

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

  @override
  Future<Either<String, Player>> createPlayer(Player player) {
    if (createPlayerStub != null) return createPlayerStub!(player);
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> deletePlayer(int id) {
    if (deletePlayerStub != null) return deletePlayerStub!(id);
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Player>> getPlayerById(int id) {
    if (getPlayerByIdStub != null) return getPlayerByIdStub!(id);
    throw UnimplementedError();
  }

  @override
  Future<Either<String, IList<Player>>> getPlayersInTournament(
    int tournamentId,
  ) {
    if (getPlayersInTournamentStub != null) {
      return getPlayersInTournamentStub!(tournamentId);
    }
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> updatePlayer(int id, Player player) {
    if (updatePlayerStub != null) return updatePlayerStub!(id, player);
    throw UnimplementedError();
  }
}
