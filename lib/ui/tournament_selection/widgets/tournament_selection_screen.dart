import 'package:chessmate/l10n/localizations_context.dart';
import 'package:chessmate/routing/routes.dart';
import 'package:chessmate/ui/tournament_selection/widgets/tournament_list.dart';
import 'package:go_router/go_router.dart';
import 'package:chessmate/ui/core/ui/header_bar.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class TournamentSelectionScreen extends StatelessWidget {
  const TournamentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = MediaQuery.of(context).size.width;
            final panelWidth = screenWidth > 800 ? 600.0 : screenWidth * 0.9;

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: panelWidth,
                      child: YaruExpansionPanel(
                        isInitiallyExpanded: const [true, false],
                        headers: [
                          Text(
                            context
                                .l10n.tournamentSelectionTournamentListHeading,
                            // Do not extract this to variable
                            // ignore: prefer-moving-to-variable
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            context.l10n.tournamentSelectionArchiveListHeading,
                            // Do not extract this to variable
                            // ignore: prefer-moving-to-variable
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                        children: const [
                          TournamentList(showArchived: false),
                          TournamentList(showArchived: true),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.go(Routes.tournamentCreation),
                    child: Text(context.l10n.newTournamentButtonText),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
