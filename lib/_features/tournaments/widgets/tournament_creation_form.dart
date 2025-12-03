import 'package:chessmate/_features/tournaments/_managers/tournament_creation_form_manager.dart';
import 'package:chessmate/_features/tournaments/_models/tournament_format.dart';
import 'package:chessmate/_shared/ui/widgets/localizations_context.dart';
import 'package:chessmate/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:yaru/yaru.dart';

class TournamentCreationForm extends StatelessWidget with WatchItMixin {
  const TournamentCreationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final nameError = watchPropertyValue(
      (TournamentCreationFormManager vm) => vm.nameError,
    );
    final startDateError = watchPropertyValue(
      (TournamentCreationFormManager vm) => vm.startDateError,
    );
    final endDateError = watchPropertyValue(
      (TournamentCreationFormManager vm) => vm.endDateError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.tournamentCreationNameSection,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: context.l10n.tournamentCreationNameTextFieldLabel,
          ),
          onChanged: (value) =>
              di<TournamentCreationFormManager>().tournamentName = value,
        ),
        Text(nameError, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 16),
        Text(
          context.l10n.tournamentCreationDateRangeSection,
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
        Text(startDateError, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 16),
        YaruDateTimeEntry(
          includeTime: false,
          firstDateTime: DateTime(1900),
          lastDateTime: DateTime(2100),
          initialDateTime: DateTime.now(),
          onChanged: onEndDateChange,
        ),
        Text(endDateError, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 16),
        Text(
          context.l10n.tournamentCreationFormatSection,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        YaruPopupMenuButton<TournamentFormat>(
          initialValue: TournamentFormat.swiss,
          itemBuilder: formatChoiceBuilder,
          onSelected: (value) =>
              di<TournamentCreationFormManager>().tournamentFormat = value,
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
                di<TournamentCreationFormManager>().cancelTournamentCreation();
                context.go('/tournament-selection');
              },
              child: Text(context.l10n.tournamentCreationCancelButton),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              // Cannot be extracted due to local variable: context
              // ignore: prefer-extracting-callbacks
              onPressed: () {
                final success = di<TournamentCreationFormManager>()
                    .createTournament();

                if (success) {
                  context.go(Routes.tournamentSelection);
                }
              },
              child: Text(context.l10n.tournamentCreationCreateButton),
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
        PopupMenuItem(value: value, child: Text(value.name)),
    ];
  }

  void onEndDateChange(DateTime? date) {
    if (date != null) {
      di<TournamentCreationFormManager>().tournamentEndDate = date;
    }
  }

  void onStartDateChange(DateTime? date) {
    if (date != null) {
      di<TournamentCreationFormManager>().tournamentStartDate = date;
    }
  }
}
