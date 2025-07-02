import 'package:fast_immutable_collections/fast_immutable_collections.dart'
    show FicListExtension, IList;
import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../domain/models/tournament/tournament.dart';
import '../../domain/models/tournament/tournament_format.dart'
    show TournamentFormat;

class DatabaseService {
  DatabaseService({required this.databaseFactory});

  final DatabaseFactory databaseFactory;

  static const _kTableTournament = 'tournament';
  static const _kColumnTournamentId = '_id';
  static const _kColumnTournamentName = 'name';
  static const _kColumnTournamentStartDate = 'start_date';
  static const _kColumnTournamentEndDate = 'end_date';
  static const _kColumnTournamentFormat = 'format';

  Database? _database;

  bool isOpen() => _database != null;

  Future<void> open() async {
    _database = await databaseFactory.openDatabase(
      join(await databaseFactory.getDatabasesPath(), 'chessmate.db'),
      options: OpenDatabaseOptions(
        onCreate: (db, version) {
          return db.execute('CREATE TABLE $_kTableTournament('
              '$_kColumnTournamentId INTEGER PRIMARY KEY AUTOINCREMENT, '
              '$_kColumnTournamentName TEXT NOT NULL, '
              '$_kColumnTournamentStartDate TEXT NOT NULL, '
              '$_kColumnTournamentEndDate TEXT NOT NULL, '
              '$_kColumnTournamentFormat TEXT NOT NULL)');
        },
        version: 1,
      ),
    );
  }

  Future<Either<String, IList<Tournament>>> getAllTournaments() async {
    try {
      final entries = await _database!.query(
        _kTableTournament,
        columns: [
          _kColumnTournamentId,
          _kColumnTournamentName,
          _kColumnTournamentStartDate,
          _kColumnTournamentEndDate,
          _kColumnTournamentFormat
        ],
      );
      final list = entries
          .map(
            (element) => Tournament(
                id: element[_kColumnTournamentId] as int,
                name: element[_kColumnTournamentName] as String,
                startDate: DateTime.parse(
                    element[_kColumnTournamentStartDate] as String),
                endDate: DateTime.parse(
                    element[_kColumnTournamentEndDate] as String),
                format: TournamentFormat.values.firstWhere((format) =>
                    format ==
                    element[_kColumnTournamentFormat] as TournamentFormat)),
          )
          .toList();
      return right(list.lock);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Tournament>> getTournamentById(int id) async {
    try {
      final entry = await _database!.query(
        _kTableTournament,
        columns: [
          _kColumnTournamentId,
          _kColumnTournamentName,
          _kColumnTournamentStartDate,
          _kColumnTournamentEndDate,
          _kColumnTournamentFormat
        ],
        where: '$_kColumnTournamentId = ?',
        whereArgs: [id],
      );
      if (entry.isEmpty) {
        return left('No tournament found with id $id');
      }
      final element = entry.first;
      return right(
        Tournament(
          id: element[_kColumnTournamentId] as int,
          name: element[_kColumnTournamentName] as String,
          startDate:
              DateTime.parse(element[_kColumnTournamentStartDate] as String),
          endDate: DateTime.parse(element[_kColumnTournamentEndDate] as String),
          format: TournamentFormat.values.firstWhere(
              (format) =>
                  format.toString() ==
                  'TournamentFormat.${element[_kColumnTournamentFormat]}',
              orElse: () => TournamentFormat.swiss),
        ),
      );
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Tournament>> createTournament(
      Tournament tournament) async {
    try {
      final id = await _database!.insert(
        _kTableTournament,
        {
          _kColumnTournamentName: tournament.name,
          _kColumnTournamentStartDate: tournament.startDate.toString(),
          _kColumnTournamentEndDate: tournament.endDate.toString(),
          _kColumnTournamentFormat: tournament.format.toString()
        },
      );
      return right(tournament.copyWith(id: id));
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> deleteTournament(int id) async {
    try {
      final rowsDeleted = await _database!.delete(_kTableTournament,
          where: '$_kColumnTournamentId = ?', whereArgs: [id]);
      if (rowsDeleted == 0) {
        return left('No tournament found with id $id');
      }
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
