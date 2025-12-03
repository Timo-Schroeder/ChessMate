import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_it/flutter_it.dart';

import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/domain/models/tournament/tournament.dart';

class TournamentManager {
  TournamentManager(this._tournamentRepository) {
    loadTournamentsCommand.run();
  }

  final TournamentRepository _tournamentRepository;

  late final loadTournamentsCommand =
      Command.createAsyncNoParam<IList<Tournament>>(
        () => _tournamentRepository.getTournaments(),
        initialValue: List<Tournament>.empty().lock,
      );

  late final addTournamentCommand = Command.createAsyncNoResult<Tournament>((
    tournament,
  ) async {
    await _tournamentRepository.createTournament(tournament);
    loadTournamentsCommand.run();
  }, restriction: loadTournamentsCommand.isRunningSync);

  late final deleteTournamentCommand = Command.createAsyncNoResult<int>((
    id,
  ) async {
    await _tournamentRepository.deleteTournament(id);
    loadTournamentsCommand.run();
  }, restriction: loadTournamentsCommand.isRunningSync);

  late final flipArchivedStatusOfTournamentCommand =
      Command.createAsyncNoResult<int>((id) async {
        final tournament = await _tournamentRepository.getTournamentById(id);
        final newTournament = tournament.copyWith(
          isArchived: !tournament.isArchived,
        );
        await _tournamentRepository.updateTournament(id, newTournament);
        loadTournamentsCommand.run();
      }, restriction: loadTournamentsCommand.isRunningSync);

  void dispose() {
    loadTournamentsCommand.dispose();
    addTournamentCommand.dispose();
    deleteTournamentCommand.dispose();
    flipArchivedStatusOfTournamentCommand.dispose();
  }
}
