import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../core/ui/header_bar.dart';
import 'tournament_selection_list.dart';
import 'package:flutter/material.dart';

class TournamentSelectionScreen extends StatelessWidget {
  const TournamentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TournamentSelectionList(),
            const SizedBox(height: 16),
            ElevatedButton(
              // Cannot be extracted due to local variable: context
              // ignore: prefer-extracting-callbacks
              onPressed: () {
                context.go('/tournament-creation');
              },
              child: Text(
                AppLocalizations.of(context)?.newTournamentButtonText ??
                    'Hello',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
