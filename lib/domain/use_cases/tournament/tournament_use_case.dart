import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../../data/repositories/tournament_repository.dart';
import '../../../utils/locator.dart';
import '../../models/tournament/tournament.dart';

class TournamentUseCase extends SafeChangeNotifier {
  final _tournamentRepository = locator<TournamentRepository>();
  List<Tournament> _tournaments = [];

  IList<Tournament> get tournaments => _tournaments.lock;

  Future<void> init() async {
    final result = await _tournamentRepository.getTournaments();
    result.match(
      (l) => left('Tournaments could not be loaded'),
      (r) {
        _tournaments = r.unlock;
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
}
