import 'package:chessmate/_features/players/_models/player.dart';
import 'package:chessmate/_features/tournaments/_models/tournament.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

abstract class DatabaseService {
  Future<void> init();

  Future<IList<Tournament>> getAllTournaments();

  Future<Tournament> getTournamentById(int id);

  Future<Either<String, Tournament>> createTournament(Tournament tournament);

  Future<Either<String, void>> updateTournament(int id, Tournament tournament);

  Future<Either<String, void>> deleteTournament(int id);

  Future<Either<String, IList<Player>>> getPlayersInTournament(
    int tournamentId,
  );

  Future<Either<String, Player>> getPlayerById(int id);

  Future<Either<String, Player>> createPlayer(Player player);

  Future<Either<String, void>> deletePlayer(int id);

  Future<Either<String, void>> updatePlayer(int id, Player player);
}
