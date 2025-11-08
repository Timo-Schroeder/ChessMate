import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/domain/models/tournament/tournament.dart';
import 'package:watch_it/watch_it.dart';

class TournamentUseCase extends SafeChangeNotifier {
  final _tournamentRepository = sl<TournamentRepository>();
  List<Tournament> _tournaments = [];
  bool _isLoading = true;

  IList<Tournament> get tournaments => _tournaments.lock;
  bool get isLoading => _isLoading;

  Future<void> loadInitialData() async {
    _isLoading = true;
    notifyListeners();

    final result = await _tournamentRepository.getTournaments();
    result.match(
      (failure) => left('Tournaments could not be loaded'),
      (success) {
        _tournaments = success.unlock;
      },
    );
    _isLoading = false;
    notifyListeners();
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

  Future<void> flipArchiveStatusOfTournament(int id) async {
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

    final updatedTournament =
        tournament.copyWith(isArchived: !tournament.isArchived);

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
