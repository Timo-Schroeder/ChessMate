import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../../../domain/models/tournament/tournament_format.dart';
import '../view_model/tournament_creation_view_model.dart';

class TournamentCreationForm extends StatelessWidget with WatchItMixin {
  const TournamentCreationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final nameError =
        watchPropertyValue((TournamentCreationViewModel vm) => vm.nameError);
    final startDateError = watchPropertyValue(
        (TournamentCreationViewModel vm) => vm.startDateError);
    final endDateError =
        watchPropertyValue((TournamentCreationViewModel vm) => vm.endDateError);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          onChanged: (value) =>
              di<TournamentCreationViewModel>().tournamentName = value,
        ),
        Text(
          nameError,
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 16),
        const Text(
          'Daterange:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        YaruDateTimeEntry(
          includeTime: false,
          firstDateTime: DateTime(1900),
          lastDateTime: DateTime(2100),
          acceptEmpty: false,
          initialDateTime: DateTime.now(),
          onChanged: (date) {
            if (date != null) {
              di<TournamentCreationViewModel>().tournamentStartDate = date;
            }
          },
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
          onChanged: (date) {
            if (date != null) {
              di<TournamentCreationViewModel>().tournamentEndDate = date;
            }
          },
        ),
        Text(
          endDateError,
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 16),
        const Text(
          'Format:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        YaruPopupMenuButton<TournamentFormat>(
          initialValue: TournamentFormat.swiss,
          child: Text(TournamentFormat.swiss.name),
          itemBuilder: (context) {
            return [
              for (final value in TournamentFormat.values)
                PopupMenuItem(
                  value: value,
                  child: Text(
                    value.name,
                  ),
                ),
            ];
          },
          onSelected: (value) =>
              di<TournamentCreationViewModel>().tournamentFormat = value,
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                di<TournamentCreationViewModel>().cancelTournamentCreation();
                context.go('/tournament-selection');
              },
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                final success =
                    di<TournamentCreationViewModel>().createTournament();

                if (success) {
                  context.go('/tournament-selection');
                }
              },
              child: const Text('Create'),
            ),
          ],
        )
      ],
    );
  }
}
