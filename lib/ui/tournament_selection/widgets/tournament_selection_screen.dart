import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru/yaru.dart';

import '../../../l10n/localizations_context.dart';
import '../../core/ui/header_bar.dart';
import 'tournament_archive_list.dart';
import 'tournament_selection_list.dart';

class TournamentSelectionScreen extends StatelessWidget {
  const TournamentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double kTournamentSectionWidth = 600.0;
    const double kTournamentSectionHeight = 600.0;

    return Scaffold(
      appBar: const HeaderBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            YaruExpansionPanel(
              width: kTournamentSectionWidth,
              height: kTournamentSectionHeight,
              isInitiallyExpanded: [
                true,
                false,
              ],
              headers: [
                Text(
                  'Tournaments',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Archive',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
              children: [
                TournamentSelectionList(),
                TournamentArchiveList(),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go('/tournament-creation');
              },
              child: Text(
                context.l10n.newTournamentButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
