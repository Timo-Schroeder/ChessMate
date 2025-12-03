// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get newTournamentButtonText => 'New Tournament';

  @override
  String get tournamentsHeading => 'Tournaments';

  @override
  String tournamentCreationTitle(String name) {
    return 'New Tournament: $name';
  }

  @override
  String get tournamentCreationNameSection => 'Name:';

  @override
  String get tournamentCreationNameTextFieldLabel => 'Name';

  @override
  String get tournamentCreationDateRangeSection => 'Daterange:';

  @override
  String get tournamentCreationDateRangeStartDateLabel => 'Enter Start Date';

  @override
  String get tournamentCreationDateRangeEndDateLabel => 'Enter End Date';

  @override
  String get tournamentCreationFormatSection => 'Format:';

  @override
  String get tournamentCreationCancelButton => 'Cancel';

  @override
  String get tournamentCreationCreateButton => 'Create';

  @override
  String get tournamentSelectionTournamentListHeading => 'Tournaments';

  @override
  String get tournamentSelectionArchiveListHeading => 'Archive';

  @override
  String get tournamentSelectionListNoTournamentsAvailable =>
      'No tournaments available';

  @override
  String get tournamentSelectionListNoArchivedTournaments =>
      'No archived tournaments';

  @override
  String get tournamentCreationHeaderBar => 'New Tournament:';
}
