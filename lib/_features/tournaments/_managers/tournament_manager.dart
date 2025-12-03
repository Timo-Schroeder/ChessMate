import 'package:chessmate/_features/tournaments/_models/tournament.dart';
import 'package:chessmate/_shared/services/local/database_service.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_it/flutter_it.dart';

class TournamentManager {
  TournamentManager(this._databaseService) {
    loadTournamentsCommand.run();
  }

  final DatabaseService _databaseService;

  late final loadTournamentsCommand =
      Command.createAsyncNoParam<IList<Tournament>>(
        () => _databaseService.getAllTournaments(),
        initialValue: List<Tournament>.empty().lock,
      );

  late final addTournamentCommand = Command.createAsyncNoResult<Tournament>((
    tournament,
  ) async {
    await _databaseService.createTournament(tournament);
    loadTournamentsCommand.run();
  }, restriction: loadTournamentsCommand.isRunningSync);

  late final deleteTournamentCommand = Command.createAsyncNoResult<int>((
    id,
  ) async {
    await _databaseService.deleteTournament(id);
    loadTournamentsCommand.run();
  }, restriction: loadTournamentsCommand.isRunningSync);

  late final flipArchivedStatusOfTournamentCommand =
      Command.createAsyncNoResult<int>((id) async {
        final tournament = await _databaseService.getTournamentById(id);
        final newTournament = tournament.copyWith(
          isArchived: !tournament.isArchived,
        );
        await _databaseService.updateTournament(id, newTournament);
        loadTournamentsCommand.run();
      }, restriction: loadTournamentsCommand.isRunningSync);

  void dispose() {
    loadTournamentsCommand.dispose();
    addTournamentCommand.dispose();
    deleteTournamentCommand.dispose();
    flipArchivedStatusOfTournamentCommand.dispose();
  }
}
