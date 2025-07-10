import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../../domain/models/tournament/tournament.dart' show Tournament;
import '../../../domain/models/tournament/tournament_format.dart';
import '../../../domain/use_cases/tournament/tourament_use_case.dart';
import '../../../utils/locator.dart';

class TournamentCreationViewModel extends SafeChangeNotifier {
  final _tournamentUseCase = locator<TournamentUseCase>();

  String _name = '';
  TournamentFormat _format = TournamentFormat.swiss;
  DateTime? _startDate;
  DateTime? _endDate;
  String _nameError = '';
  String _startDateError = '';
  String _endDateError = '';

  TournamentFormat get tournamentFormat => _format;
  set tournamentFormat(TournamentFormat tournamentFormat) {
    _format = tournamentFormat;
    notifyListeners();
  }

  DateTime? get tournamentStartDate => _startDate;
  set tournamentStartDate(DateTime? startDate) {
    _startDate = startDate;
    if (startDate != null) {
      _startDateError = '';
    }
    notifyListeners();
  }

  DateTime? get tournamentEndDate => _endDate;
  set tournamentEndDate(DateTime? endDate) {
    _endDate = endDate;
    if (endDate != null) {
      _endDateError = '';
    }
    notifyListeners();
  }

  String get tournamentName => _name;
  set tournamentName(String name) {
    _name = name;
    if (_name.isNotEmpty) {
      _nameError = '';
    }
    notifyListeners();
  }

  String get nameError => _nameError;

  String get startDateError => _startDateError;

  String get endDateError => _endDateError;

  bool createTournament() {
    _nameError = '';
    _startDateError = '';
    _endDateError = '';

    notifyListeners();

    if (_name.isEmpty) {
      _nameError = 'Name cannot be empty';
    }

    if (_startDate == null) {
      _startDateError = 'Start date cannot be empty';
    } else if (_startDate!
        .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
      // Subtract one day, as DateTime.now() also includes hours and minutes and
      //is therefore after the date itself.
      _startDateError = 'Start date cannot be before current date';
    }

    if (_endDate == null) {
      _endDateError = 'End date cannot be empty';
    } else if (_endDate!.isBefore(_startDate!)) {
      _endDateError = 'End date cannot be before start date';
    }

    if (_nameError.isNotEmpty ||
        _startDateError.isNotEmpty ||
        _endDateError.isNotEmpty) {
      notifyListeners();
      return false;
    }

    final tournament = Tournament(
      name: _name,
      format: _format,
      startDate: _startDate!,
      endDate: _endDate!,
    );
    _tournamentUseCase.createTournament(tournament);

    tournamentName = '';
    tournamentStartDate = null;
    tournamentEndDate = null;

    return true;
  }

  void cancelTournamentCreation() {
    _nameError = '';
    _startDateError = '';
    _endDateError = '';
    _name = '';
    _startDate = null;
    _endDate = null;
    notifyListeners();
  }
}
