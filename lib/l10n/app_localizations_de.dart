// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

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
}
