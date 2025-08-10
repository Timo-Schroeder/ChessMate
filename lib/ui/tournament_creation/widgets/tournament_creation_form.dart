import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../../../domain/models/tournament/tournament_format.dart';
import '../../../l10n/app_localizations.dart';
import '../view_model/tournament_creation_view_model.dart';

class TournamentCreationForm extends StatelessWidget with WatchItMixin {
  const TournamentCreationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final nameError =
        watchPropertyValue((TournamentCreationViewModel vm) => vm.nameError);
    final startDateError = watchPropertyValue(
      (TournamentCreationViewModel vm) => vm.startDateError,
    );
    final endDateError =
        watchPropertyValue((TournamentCreationViewModel vm) => vm.endDateError);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.tournamentCreationNameSection,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!
                .tournamentCreationNameTextFieldLabel,
          ),
          onChanged: (value) =>
              di<TournamentCreationViewModel>().tournamentName = value,
        ),
        Text(
          nameError,
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context)!.tournamentCreationDateRangeSection,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        YaruDateTimeEntry(
          includeTime: false,
          firstDateTime: DateTime(1900),
          lastDateTime: DateTime(2100),
          acceptEmpty: false,
          initialDateTime: DateTime.now(),
          onChanged: onStartDateChange,
        ),
        Text(
          startDateError,
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 16),
        YaruDateTimeEntry(
          includeTime: false,
          firstDateTime: DateTime(1900),
          lastDateTime: DateTime(2100),
          initialDateTime: DateTime.now(),
          onChanged: onEndDateChange,
        ),
        Text(
          endDateError,
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context)!.tournamentCreationFormatSection,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        YaruPopupMenuButton<TournamentFormat>(
          initialValue: TournamentFormat.swiss,
          itemBuilder: formatChoiceBuilder,
          onSelected: (value) =>
              di<TournamentCreationViewModel>().tournamentFormat = value,
          child: Text(TournamentFormat.swiss.name),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              // Cannot be extracted due to local variable: context
              // ignore: prefer-extracting-callbacks
              onPressed: () {
                di<TournamentCreationViewModel>().cancelTournamentCreation();
                context.go('/tournament-selection');
              },
              child: Text(
                AppLocalizations.of(context)!.tournamentCreationCancelButton,
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              // Cannot be extracted due to local variable: context
              // ignore: prefer-extracting-callbacks
              onPressed: () {
                final success =
                    di<TournamentCreationViewModel>().createTournament();

                if (success) {
                  context.go('/tournament-selection');
                }
              },
              child: Text(
                AppLocalizations.of(context)!.tournamentCreationCreateButton,
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<PopupMenuEntry<TournamentFormat>> formatChoiceBuilder(
    BuildContext context,
  ) {
    return [
      for (final value in TournamentFormat.values)
        PopupMenuItem(
          value: value,
          child: Text(
            value.name,
          ),
        ),
    ];
  }

  void onEndDateChange(DateTime? date) {
    if (date != null) {
      di<TournamentCreationViewModel>().tournamentEndDate = date;
    }
  }

  void onStartDateChange(DateTime? date) {
    if (date != null) {
      di<TournamentCreationViewModel>().tournamentStartDate = date;
    }
  }
}
