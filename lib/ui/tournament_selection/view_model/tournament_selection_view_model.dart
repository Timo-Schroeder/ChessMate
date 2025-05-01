import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../../domain/models/tournament/tournament.dart';
import '../../../domain/use_cases/tournament/tourament_use_case.dart';
import '../../../utils/locator.dart' show locator;

class TournamentSelectionViewModel extends SafeChangeNotifier {
  final _tournamentUseCase = locator<TournamentUseCase>();

  IList<Tournament> get tournaments => _tournamentUseCase.tournaments;

  TournamentSelectionViewModel() {
    _tournamentUseCase.addListener(_onTournamentUseCaseChanged);
  }

  @override
  void dispose() {
    _tournamentUseCase.removeListener(_onTournamentUseCaseChanged);
    super.dispose();
  }

  void _onTournamentUseCaseChanged() {
    notifyListeners();
  }

  void deleteTournament(int id) {
    _tournamentUseCase.deleteTournament(id);
  }
}
