import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:watch_it/watch_it.dart' show sl;

import '../../../domain/models/tournament/tournament.dart' show Tournament;
import '../../../domain/models/tournament/tournament_format.dart';
import '../../../domain/use_cases/tournament/tournament_use_case.dart';

class TournamentCreationViewModel extends SafeChangeNotifier {
  final _tournamentUseCase = sl<TournamentUseCase>();

  final _name = ValueNotifier<String>('');
  final _format = ValueNotifier<TournamentFormat>(TournamentFormat.swiss);
  final _startDate = ValueNotifier<DateTime>(DateTime.now());
  final _endDate = ValueNotifier<DateTime>(DateTime.now());

  late final ValueListenable<bool> _isNameValid;
  late final ValueListenable<bool> _isStartDateValid;
  late final ValueListenable<bool> _isEndDateValid;
  late final ValueListenable<bool> _isFormValid;

  late final submitCommand = Command.createAsyncNoParamNoResult(
    () async {
      try {
        final tournament = Tournament(
          name: _name.value,
          format: _format.value,
          startDate: _startDate.value,
          endDate: _endDate.value,
          isArchived: false,
        );
        _tournamentUseCase.createTournament(tournament);
      } catch (e) {
        rethrow;
      }
    },
    restriction: _isFormValid.map((isValid) => !isValid),
  );

  TournamentCreationViewModel() {
    _setupValidation();
  }

  ValueNotifier<TournamentFormat> get format => _format;
  ValueNotifier<String> get name => _name;
  ValueNotifier<DateTime> get startDate => _startDate;
  ValueNotifier<DateTime> get endDate => _endDate;

  ValueListenable<bool> get isNameValid => _isNameValid;
  ValueListenable<bool> get isStartDateValid => _isStartDateValid;
  ValueListenable<bool> get isEndDateValid => _isEndDateValid;

  void _setupValidation() {
    _isNameValid = _name.map<bool>((name) {
      final trimmed = name.trim();
      return trimmed.isNotEmpty && trimmed.length >= 3;
    });

    _isStartDateValid = _startDate.map<bool>(
      (startDate) => startDate.isAfter(
        DateTime.now().subtract(const Duration(days: 1)),
      ),
    );

    _isEndDateValid = _startDate.combineLatest(
      _endDate,
      (startDate, endDate) =>
          endDate.isAfter(startDate) ||
          (endDate.year == startDate.year &&
              endDate.month == startDate.month &&
              endDate.day == startDate.day),
    );

    _isFormValid = _isNameValid
        .combineLatest(
          _isStartDateValid,
          (nameValid, startDateValid) => nameValid && startDateValid,
        )
        .combineLatest(
          _isEndDateValid,
          (formValid, endDateValid) => formValid && endDateValid,
        );
  }
}
