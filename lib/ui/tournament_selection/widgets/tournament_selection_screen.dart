import 'package:chessmate/l10n/localizations_context.dart';
import 'package:chessmate/ui/tournament_selection/widgets/tournament_archive_list.dart';
import 'package:go_router/go_router.dart';
import 'package:chessmate/ui/core/ui/header_bar.dart';
import 'package:chessmate/ui/tournament_selection/widgets/tournament_selection_list.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class TournamentSelectionScreen extends StatelessWidget {
  const TournamentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double kTournamentSectionWidth = 600.0;
    const double kTournamentSectionHeight = 800.0;

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
                  // Do not extract this to variable
                  // ignore: prefer-moving-to-variable
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Archive',
                  // Do not extract this to variable
                  // ignore: prefer-moving-to-variable
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
              // Cannot be extracted due to local variable: context
              // ignore: prefer-extracting-callbacks
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
