// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get chessMateTitle => 'ChessMate';

  @override
  String get newTournamentButtonText => 'Neues Turnier';

  @override
  String get tournamentsHeading => 'Turniere';

  @override
  String tournamentCreationTitle(String name) {
    return 'Neues Turnier: $name';
  }

  @override
  String get tournamentCreationNameSection => 'Name:';

  @override
  String get tournamentCreationNameTextFieldLabel => 'Name';

  @override
  String get tournamentCreationDateRangeSection => 'Zeit:';

  @override
  String get tournamentCreationDateRangeStartDateLabel => 'Startdatum';

  @override
  String get tournamentCreationDateRangeEndDateLabel => 'Enddatum';

  @override
  String get tournamentCreationFormatSection => 'Format:';

  @override
  String get tournamentCreationCancelButton => 'Abbrechen';

  @override
  String get tournamentCreationCreateButton => 'Erstellen';

  @override
  String get tournamentSelectionTournamentListHeading => 'Turniere';

  @override
  String get tournamentSelectionArchiveListHeading => 'Archiv';

  @override
  String get tournamentSelectionListNoTournamentsAvailable =>
      'Keine Turniere verfügbar';

  @override
  String get tournamentSelectionListNoArchivedTournaments =>
      'Keine archivierten Turniere';

  @override
  String get tournamentCreationHeaderBar => 'Neues Turnier:';
}
