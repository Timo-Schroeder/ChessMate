import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../../../domain/models/tournament/tournament_format.dart';
import '../../../utils/locator.dart';
import '../../core/ui/header_bar.dart';
import '../view_model/tournament_creation_view_model.dart';

class TournamentCreationScreen extends StatelessWidget with WatchItMixin {
  TournamentCreationScreen({super.key});
  final _tournamentCreationViewModel = locator<TournamentCreationViewModel>();

  @override
  Widget build(BuildContext context) {
    final tournamentFormat = watchPropertyValue(
        (TournamentCreationViewModel m) => m.tournamentFormat);
    return Scaffold(
      appBar: HeaderBar(
        leading: IconButton(
          onPressed: () => context.go('/tournament-selection'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (text) {
                _tournamentCreationViewModel.tournamentName = text;
              },
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
              initialDateTime: DateTime.now(),
              onChanged: (date) {
                if (date != null) {
                  _tournamentCreationViewModel.tournamentStartDate = date;
                }
              },
            ),
            const SizedBox(height: 16),
            YaruDateTimeEntry(
              includeTime: false,
              firstDateTime: DateTime(1900),
              lastDateTime: DateTime(2100),
              initialDateTime: DateTime.now(),
              onChanged: (date) {
                if (date != null) {
                  _tournamentCreationViewModel.tournamentEndDate = date;
                }
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Format:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            YaruPopupMenuButton<TournamentFormat>(
              initialValue: tournamentFormat,
              child: Text(tournamentFormat.name),
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
                  _tournamentCreationViewModel.tournamentFormat = value,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _tournamentCreationViewModel.createTournament();
                    context.go('/tournament-selection');
                  },
                  child: const Text('Create'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
