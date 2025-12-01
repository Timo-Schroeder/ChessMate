import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'package:chessmate/domain/models/tournament/tournament.dart';
import 'package:chessmate/domain/use_cases/tournament/tournament_use_case.dart';

class TournamentSelectionViewModel extends SafeChangeNotifier {
  final TournamentUseCase _tournamentUseCase;

  IList<Tournament> get tournaments => _tournamentUseCase.tournaments;
  bool get isLoading => _tournamentUseCase.isLoading;

  TournamentSelectionViewModel(this._tournamentUseCase) {
    _tournamentUseCase.addListener(_onTournamentUseCaseChanged);
  }

  @override
  void dispose() {
    _tournamentUseCase.removeListener(_onTournamentUseCaseChanged);
    super.dispose();
  }

  void deleteTournament(int id) {
    _tournamentUseCase.deleteTournament(id);
  }

  void flipArchiveStatus(int id) {
    _tournamentUseCase.flipArchiveStatusOfTournament(id);
  }

  void _onTournamentUseCaseChanged() {
    notifyListeners();
  }
}
