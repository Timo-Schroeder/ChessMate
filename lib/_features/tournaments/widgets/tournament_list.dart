import 'package:chessmate/_features/tournaments/_managers/tournament_manager.dart';
import 'package:chessmate/_shared/ui/widgets/localizations_context.dart';
import 'package:chessmate/routing/routes.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:yaru/yaru.dart';

class TournamentList extends StatelessWidget with WatchItMixin {
  const TournamentList({required this.showArchived, super.key});

  final bool showArchived;

  @override
  Widget build(BuildContext context) {
    final tournaments = watchValue(
      (TournamentManager m) => m.loadTournamentsCommand,
    );
    final isRunning = watchValue(
      (TournamentManager m) => m.loadTournamentsCommand.isRunning,
    );

    final filteredTournaments = tournaments
        .where((t) => t.isArchived == showArchived)
        .toList()
        .reversed;

    return isRunning
        ? const YaruCircularProgressIndicator()
        : filteredTournaments.isEmpty
        ? Center(
            child: Text(
              showArchived
                  ? context.l10n.tournamentSelectionListNoArchivedTournaments
                  : context.l10n.tournamentSelectionListNoTournamentsAvailable,
            ),
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final tournament in filteredTournaments)
                  YaruTile(
                    title: Text(tournament.name),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        YaruIconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            final id = tournament.id;
                            if (id != null) {
                              context.go('${Routes.dashboard}/$id');
                            }
                          },
                        ),
                        YaruIconButton(
                          icon: Icon(
                            showArchived ? Icons.file_open : Icons.archive,
                          ),
                          onPressed: () {
                            final id = tournament.id;
                            if (id != null) {
                              sl<TournamentManager>()
                                  .flipArchivedStatusOfTournamentCommand(id);
                            }
                          },
                        ),
                        YaruIconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            final id = tournament.id;
                            if (id != null) {
                              sl<TournamentManager>().deleteTournamentCommand(
                                id,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
  }
}
