import 'package:chessmate/domain/models/player/player.dart';
import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart'
    show FicListExtension, IList;
import 'package:fpdart/fpdart.dart';
import 'package:drift/drift.dart' as d;

import 'package:chessmate/domain/models/tournament/tournament.dart';
import 'package:chessmate/data/services/database_service.dart';
import 'package:chessmate/data/services/drift_database.dart' as db;

class DatabaseServiceImpl implements DatabaseService {
  final db.AppDatabase _appDatabase;

  DatabaseServiceImpl(this._appDatabase);

  @override
  Future<void> init() async {
    // ignore: no-empty-block
    // Drift handles initialization internally, so this can be empty or used for any initial setup if needed.
  }

  @override
  Future<Either<String, IList<Tournament>>> getAllTournaments() async {
    try {
      final allTournaments = await _appDatabase
          .select(_appDatabase.tournaments)
          .get();
      final list = allTournaments
          .map(
            (tournamentData) => Tournament(
              id: tournamentData.id,
              name: tournamentData.name,
              startDate: tournamentData.startDate,
              endDate: tournamentData.endDate,
              format: tournamentData.format,
              hasStarted: false,
              hasFinished: false,
              isArchived: tournamentData.isArchived,
            ),
          )
          .toList();

      return right(list.lock);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Tournament>> getTournamentById(int id) async {
    try {
      final tournamentData = await (_appDatabase.select(
        _appDatabase.tournaments,
      )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

      if (tournamentData == null) {
        return left('No tournament found with id $id');
      }

      return right(
        Tournament(
          id: tournamentData.id,
          name: tournamentData.name,
          startDate: tournamentData.startDate,
          endDate: tournamentData.endDate,
          format: tournamentData.format,
          hasStarted: false,
          hasFinished: false,
          isArchived: tournamentData.isArchived,
        ),
      );
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Tournament>> createTournament(
    Tournament tournament,
  ) async {
    try {
      final id = await _appDatabase
          .into(_appDatabase.tournaments)
          .insert(
            db.TournamentsCompanion.insert(
              name: tournament.name,
              startDate: tournament.startDate,
              endDate: tournament.endDate,
              format: tournament.format,
              isArchived: d.Value(tournament.isArchived),
            ),
          );

      return right(tournament.copyWith(id: id));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updateTournament(
    int id,
    Tournament tournament,
  ) async {
    try {
      final updatedRows =
          await (_appDatabase.update(
            _appDatabase.tournaments,
          )..where((tbl) => tbl.id.equals(id))).write(
            db.TournamentsCompanion(
              name: d.Value(tournament.name),
              startDate: d.Value(tournament.startDate),
              endDate: d.Value(tournament.endDate),
              format: d.Value(tournament.format),
              isArchived: d.Value(tournament.isArchived),
            ),
          );

      if (updatedRows == 0) {
        return left('No tournament found with id $id');
      }

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteTournament(int id) async {
    try {
      final deletedRows = await (_appDatabase.delete(
        _appDatabase.tournaments,
      )..where((tbl) => tbl.id.equals(id))).go();

      if (deletedRows == 0) {
        return left('No tournament found with id $id');
      }

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Player>> createPlayer(Player player) async {
    try {
      final id = await _appDatabase
          .into(_appDatabase.players)
          .insert(
            db.PlayersCompanion.insert(
              firstName: player.firstName,
              lastName: player.lastName,
              yearOfBirth: player.yearOfBirth,
              gender: player.gender,
              nationalRating: Value(player.nationalRating),
              elo: Value(player.elo),
              club: Value(player.club),
              fideTitle: player.title,
              tournamentId: player.tournamentId,
            ),
          );

      return right(player.copyWith(id: id));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deletePlayer(int id) async {
    try {
      final deletedRows = await (_appDatabase.delete(
        _appDatabase.players,
      )..where((tbl) => tbl.id.equals(id))).go();

      if (deletedRows == 0) {
        return left('No player found with id $id');
      }

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Player>> getPlayerById(int id) async {
    try {
      final playerData = await (_appDatabase.select(
        _appDatabase.players,
      )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

      if (playerData == null) {
        return left('No player found with id $id');
      }

      return right(
        Player(
          id: playerData.id,
          firstName: playerData.firstName,
          lastName: playerData.lastName,
          yearOfBirth: playerData.yearOfBirth,
          gender: playerData.gender,
          nationalRating: playerData.nationalRating,
          elo: playerData.elo,
          club: playerData.club,
          title: playerData.fideTitle,
          active: playerData.active,
          tournamentId: playerData.tournamentId,
        ),
      );
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, IList<Player>>> getPlayersInTournament(
    int tournamentId,
  ) async {
    try {
      final playersInTournament = await _appDatabase
          .select(_appDatabase.players)
          .get();
      final list = playersInTournament
          .where((playerData) => playerData.tournamentId == tournamentId)
          .map(
            (playerData) => Player(
              id: playerData.id,
              firstName: playerData.firstName,
              lastName: playerData.lastName,
              yearOfBirth: playerData.yearOfBirth,
              gender: playerData.gender,
              nationalRating: playerData.nationalRating,
              elo: playerData.elo,
              club: playerData.club,
              title: playerData.fideTitle,
              active: playerData.active,
              tournamentId: playerData.tournamentId,
            ),
          )
          .toList();

      return right(list.lock);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updatePlayer(int id, Player player) async {
    try {
      final updatedRows =
          await (_appDatabase.update(
            _appDatabase.players,
          )..where((tbl) => tbl.id.equals(id))).write(
            db.PlayersCompanion(
              firstName: d.Value(player.firstName),
              lastName: d.Value(player.lastName),
              yearOfBirth: d.Value(player.yearOfBirth),
              gender: d.Value(player.gender),
              nationalRating: d.Value(player.nationalRating),
              elo: d.Value(player.elo),
              club: d.Value(player.club),
              fideTitle: d.Value(player.title),
              active: d.Value(player.active),
              tournamentId: d.Value(player.tournamentId),
            ),
          );

      if (updatedRows == 0) {
        return left('No tournament found with id $id');
      }

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
