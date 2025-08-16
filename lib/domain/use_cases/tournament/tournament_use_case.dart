import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/utils/locator.dart';
import 'package:chessmate/domain/models/tournament/tournament.dart';

class TournamentUseCase extends SafeChangeNotifier {
  final _tournamentRepository = locator<TournamentRepository>();
  List<Tournament> _tournaments = [];

  IList<Tournament> get tournaments => _tournaments.lock;

  Future<void> init() async {
    final result = await _tournamentRepository.getTournaments();
    result.match(
      (failure) => left('Tournaments could not be loaded'),
      (success) {
        _tournaments = success.unlock;
        notifyListeners();
      },
    );
  }

  Future<void> createTournament(Tournament tournament) async {
    final result = await _tournamentRepository.createTournament(tournament);
    result.match(
      (failure) => debugPrint('Failed to create tournament: $failure'),
      (success) {
        _tournaments = [..._tournaments, success];
        notifyListeners();
      },
    );
  }

  Future<void> deleteTournament(int id) async {
    final result = await _tournamentRepository.deleteTournament(id);
    result.match(
      (failure) => debugPrint('Failed to delete tournament: $failure'),
      (success) {
        _tournaments = _tournaments.where((t) => t.id != id).toList();
        notifyListeners();
      },
    );
  }

  Future<void> changeArchiveStatusOfTournament(int id, bool archived) async {
    final getTournamentResult =
        await _tournamentRepository.getTournamentById(id);
    if (getTournamentResult.isLeft()) {
      debugPrint('Failed to get tournament with id $id');

      return;
    }

    final tournament = getTournamentResult.toNullable();
    if (tournament == null) {
      debugPrint('Retrieved tournament is null');

      return;
    }

    final updatedTournament = tournament.copyWith(isArchived: archived);

    final result =
        await _tournamentRepository.updateTournament(id, updatedTournament);
    result.match(
      (failure) => debugPrint('Failed to update tournament'),
      (success) {
        _tournaments.remove(tournament);
        _tournaments.add(updatedTournament);
        notifyListeners();
      },
    );
  }
}
