import 'package:chessmate/data/services/database_service.dart';
import 'package:chessmate/domain/models/player/player.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';

abstract class PlayerReporitory {
  Future<Either<String, IList<Player>>> getPlayersInTournament(
    int tournamentId,
  );

  Future<Either<String, Player>> getPlayerById(int id);

  Future<Either<String, Player>> createPlayer(Player player);

  Future<Either<String, void>> deletePlayer(int id);

  Future<Either<String, void>> updatePlayer(int id, Player player);
}

class PlayerRepositoryImpl implements PlayerReporitory {
  final DatabaseService _database;

  PlayerRepositoryImpl(this._database);

  @override
  Future<Either<String, Player>> createPlayer(Player player) {
    return _database.createPlayer(player);
  }

  @override
  Future<Either<String, void>> deletePlayer(int id) {
    return _database.deletePlayer(id);
  }

  @override
  Future<Either<String, Player>> getPlayerById(int id) {
    return _database.getPlayerById(id);
  }

  @override
  Future<Either<String, IList<Player>>> getPlayersInTournament(
    int tournamentId,
  ) {
    return _database.getPlayersInTournament(tournamentId);
  }

  @override
  Future<Either<String, void>> updatePlayer(int id, Player player) {
    return _database.updatePlayer(id, player);
  }
}
