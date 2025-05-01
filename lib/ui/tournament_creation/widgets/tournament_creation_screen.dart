import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../../../domain/models/tournament/tournament.dart';
import '../../../domain/models/tournament/tournament_format.dart';
import '../../../utils/locator.dart';
import '../../core/ui/header_bar.dart';
import '../view_model/tournament_creation_view_model.dart';

class TournamentCreationScreen extends StatelessWidget with WatchItMixin {
  TournamentCreationScreen({super.key});
  final _tournamentCreationViewModel = locator<TournamentCreationViewModel>();
  final _nameController = TextEditingController();
  final _startDateController = YaruDateTimeEntryController.now();
  final _endDateController = YaruDateTimeEntryController.now();

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
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Daterange:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            YaruDateTimeEntry(
              controller: _startDateController,
              includeTime: false,
              firstDateTime: DateTime(1900),
              lastDateTime: DateTime(2100),
            ),
            const SizedBox(height: 16),
            YaruDateTimeEntry(
              controller: _endDateController,
              includeTime: false,
              firstDateTime: DateTime(1900),
              lastDateTime: DateTime(2100),
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
                    if (_nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Name is required')),
                      );
                      return;
                    }
                    if (_startDateController.value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Start date is required')),
                      );
                      return;
                    }
                    if (_endDateController.value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('End date is required')),
                      );
                      return;
                    }
                    if (_startDateController.value!
                        .isAfter(_endDateController.value!)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Start date must be before end date')),
                      );
                      return;
                    }
                    _tournamentCreationViewModel.createTournament(Tournament(
                      id: -1,
                      name: _nameController.text,
                      startDate: _startDateController.value!,
                      endDate: _endDateController.value!,
                      format: tournamentFormat,
                    ));
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
