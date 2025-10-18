import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:watch_it/watch_it.dart' show sl;

import '../../../domain/models/tournament/tournament.dart' show Tournament;
import '../../../domain/models/tournament/tournament_format.dart';
import '../../../domain/use_cases/tournament/tournament_use_case.dart';

class TournamentCreationViewModel extends SafeChangeNotifier {
  static const int minNameLength = 3;

  late final Command submitCommand = Command.createAsyncNoParamNoResult(
    () async {
      final tournament = Tournament(
        name: _name.value,
        format: _format.value,
        startDate: _startDate.value,
        endDate: _endDate.value,
        isArchived: false,
      );
      await _tournamentUseCase.createTournament(tournament);

      _format.value = TournamentFormat.swiss;
      _name.value = '';
      _startDate.value = DateTime.now();
      _endDate.value = DateTime.now();

      _setupValidation();
    },
    restriction: _isFormValid.map((isValid) => !isValid),
  );

  final _tournamentUseCase = sl<TournamentUseCase>();

  final _name = ValueNotifier<String>('');
  final _format = ValueNotifier<TournamentFormat>(TournamentFormat.swiss);
  final _startDate = ValueNotifier<DateTime>(DateTime.now());
  final _endDate = ValueNotifier<DateTime>(DateTime.now());

  final _isNameValid = ValueNotifier<bool>(false);
  final _isStartDateValid = ValueNotifier<bool>(true);
  final _isEndDateValid = ValueNotifier<bool>(true);
  final _isFormValid = ValueNotifier<bool>(false);

  ValueListenable<TournamentFormat> get format => _format;
  ValueListenable<String> get name => _name;
  ValueListenable<DateTime> get startDate => _startDate;
  ValueListenable<DateTime> get endDate => _endDate;

  ValueListenable<bool> get isNameValid => _isNameValid;
  ValueListenable<bool> get isStartDateValid => _isStartDateValid;
  ValueListenable<bool> get isEndDateValid => _isEndDateValid;

  TournamentCreationViewModel() {
    _setupValidation();
  }

  void updateName(String name) {
    _name.value = name;
    _validateName();
    _validateForm();
  }

  void updateFormat(TournamentFormat format) => _format.value = format;
  void updateStartDate(DateTime date) {
    _startDate.value = date;
    _validateStartDate();
    _validateEndDate();
    _validateForm();
  }

  void updateEndDate(DateTime date) {
    _endDate.value = date;
    _validateEndDate();
    _validateForm();
  }

  @override
  void dispose() {
    _name.dispose();
    _format.dispose();
    _startDate.dispose();
    _endDate.dispose();
    submitCommand.dispose();
    super.dispose();
  }

  void _setupValidation() {
    _validateName();
    _validateStartDate();
    _validateEndDate();
    _validateForm();
  }

  void _validateName() {
    final trimmed = _name.value.trim();
    _isNameValid.value = trimmed.isNotEmpty && trimmed.length >= minNameLength;
  }

  void _validateStartDate() {
    final today = DateTime.now();
    final startOfToday = DateTime(today.year, today.month, today.day);
    final startDate = _startDate.value;
    final startOfStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);

    _isStartDateValid.value = !startOfStartDate.isBefore(startOfToday);
  }

  void _validateEndDate() {
    final startDate = _startDate.value;
    final endDate = _endDate.value;
    final start = DateTime(startDate.year, startDate.month, startDate.day);
    final end = DateTime(endDate.year, endDate.month, endDate.day);

    _isEndDateValid.value = !end.isBefore(start);
  }

  void _validateForm() {
    _isFormValid.value =
        _isNameValid.value && _isStartDateValid.value && _isEndDateValid.value;
  }
}
