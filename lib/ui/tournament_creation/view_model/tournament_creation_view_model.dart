import 'package:flutter/material.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../../domain/models/tournament/tournament.dart';
import '../../../domain/models/tournament/tournament_format.dart';
import '../../../domain/use_cases/tournament/tourament_use_case.dart';
import '../../../utils/locator.dart';

class TournamentCreationViewModel extends SafeChangeNotifier {
  final _tournamentUseCase = locator<TournamentUseCase>();

  String _name = '';
  TournamentFormat _format = TournamentFormat.swiss;
  DateTimeRange _dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  TournamentFormat get tournamentFormat => _format;
  set tournamentFormat(TournamentFormat tournamentFormat) =>
      _format = tournamentFormat;

  DateTimeRange get tournamentDateRange => _dateRange;
  set tournamentDateRange(DateTimeRange timeRange) => _dateRange = timeRange;

  String get tournamentName => _name;
  set tournamentName(String name) => _name = name;

  Future<void> createTournament(Tournament tournament) async {
    await _tournamentUseCase.createTournament(tournament);
  }
}
