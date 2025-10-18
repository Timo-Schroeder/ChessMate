import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../../../domain/models/tournament/tournament_format.dart';
import '../../../l10n/localizations_context.dart';
import '../view_model/tournament_creation_view_model.dart';

class TournamentCreationForm extends StatelessWidget with WatchItMixin {
  const TournamentCreationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final canExecute = watchValue(
      (TournamentCreationViewModel vm) => vm.submitCommand.canExecute,
    );

    final isExecuting = watchValue(
      (TournamentCreationViewModel vm) => vm.submitCommand.isExecuting,
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
              di<TournamentCreationViewModel>().updateName(value),
        ),
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
        const SizedBox(height: 16),
        YaruDateTimeEntry(
          includeTime: false,
          firstDateTime: DateTime(1900),
          lastDateTime: DateTime(2100),
          initialDateTime: DateTime.now(),
          onChanged: onEndDateChange,
        ),
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
              di<TournamentCreationViewModel>().updateFormat(value),
          child: Text(TournamentFormat.swiss.name),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: isExecuting
                  ? () {
                      di<TournamentCreationViewModel>().dispose();
                      context.go('/tournament-selection');
                    }
                  : null,
              child: Text(
                context.l10n.tournamentCreationCancelButton,
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: canExecute
                  ? () {
                      sl<TournamentCreationViewModel>().submitCommand();
                      context.go('/tournament-selection');
                    }
                  : null,
              child: isExecuting
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      context.l10n.tournamentCreationCreateButton,
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
      di<TournamentCreationViewModel>().updateEndDate(date);
    }
  }

  void onStartDateChange(DateTime? date) {
    if (date != null) {
      di<TournamentCreationViewModel>().updateStartDate(date);
    }
  }
}
