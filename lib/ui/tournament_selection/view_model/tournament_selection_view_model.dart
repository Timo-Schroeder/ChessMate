import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:watch_it/watch_it.dart' show di;

import '../../../domain/models/tournament/tournament.dart';
import '../../../domain/use_cases/tournament/tournament_use_case.dart';

class TournamentSelectionViewModel extends SafeChangeNotifier {
  final _tournamentUseCase = di<TournamentUseCase>();

  TournamentSelectionViewModel() {
    _tournamentUseCase.addListener(_onTournamentUseCaseChanged);
  }

  IList<Tournament> get tournaments => _tournamentUseCase.tournaments;

  void deleteTournament(int id) {
    _tournamentUseCase.deleteTournament(id);
  }

  @override
  void dispose() {
    _tournamentUseCase.removeListener(_onTournamentUseCaseChanged);
    super.dispose();
  }

  void flipArchiveStatus(int id) {
    _tournamentUseCase.flipArchiveStatusOfTournament(id);
  }

  void _onTournamentUseCaseChanged() {
    notifyListeners();
  }
}
