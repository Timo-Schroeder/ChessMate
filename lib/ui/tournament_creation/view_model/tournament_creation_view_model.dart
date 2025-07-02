import 'package:drift/drift.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../../domain/models/tournament/tournament.dart' show Tournament;
import '../../../domain/models/tournament/tournament_format.dart';
import '../../../domain/use_cases/tournament/tourament_use_case.dart';
import '../../../utils/locator.dart';

class TournamentCreationViewModel extends SafeChangeNotifier {
  final _tournamentUseCase = locator<TournamentUseCase>();

  String _name = '';
  TournamentFormat _format = TournamentFormat.swiss;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  TournamentFormat get tournamentFormat => _format;
  set tournamentFormat(TournamentFormat tournamentFormat) =>
      _format = tournamentFormat;

  DateTime get tournamentStartDate => _startDate;
  set tournamentStartDate(DateTime startDate) => _startDate = startDate;

  DateTime get tournamentEndDate => _endDate;
  set tournamentEndDate(DateTime endDate) => _endDate = endDate;

  String get tournamentName => _name;
  set tournamentName(String name) => _name = name;

  Future<bool> createTournament() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    if (_name.isEmpty) {
      _error = 'Name cannot be empty';
      notifyListeners();
      return false;
    }

    // Subtract one day, as DateTime.now() also includes hours and minutes and
    //is therefore after the date itself.
    if (_startDate.isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      _error = 'Start date cannot be before current date';
      notifyListeners();
      return false;
    }

    if (_endDate.isBefore(_startDate)) {
      _error = 'End date cannot be before start date';
      notifyListeners();
      return false;
    }

    final tournament = Tournament(
      name: _name,
      format: _format,
      startDate: _startDate,
      endDate: _endDate,
    );
    await _tournamentUseCase.createTournament(tournament);
    return true;
  }
}
