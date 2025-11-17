import 'package:chessmate/data/services/database_service.dart';
import 'package:chessmate/domain/models/player/player.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';

class PlayerRepository {
  final DatabaseService _database;

  PlayerRepository(this._database);

  Future<Either<String, Player>> createPlayer(Player player) {
    return _database.createPlayer(player);
  }

  Future<Either<String, void>> deletePlayer(int id) {
    return _database.deletePlayer(id);
  }

  Future<Either<String, Player>> getPlayerById(int id) {
    return _database.getPlayerById(id);
  }

  Future<Either<String, IList<Player>>> getPlayersInTournament(
    int tournamentId,
  ) {
    return _database.getPlayersInTournament(tournamentId);
  }

  Future<Either<String, void>> updatePlayer(int id, Player player) {
    return _database.updatePlayer(id, player);
  }
}
