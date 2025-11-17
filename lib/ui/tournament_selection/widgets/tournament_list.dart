import 'package:chessmate/routing/routes.dart';
import 'package:chessmate/ui/tournament_selection/view_model/tournament_selection_view_model.dart';
import 'package:chessmate/l10n/localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

class TournamentList extends StatelessWidget with WatchItMixin {
  const TournamentList({required this.showArchived, super.key});

  final bool showArchived;

  @override
  Widget build(BuildContext context) {
    final viewModel = watchIt<TournamentSelectionViewModel>();
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final tournamentList = viewModel.tournaments.reversed;

    final filteredTournaments = tournamentList
        .where((t) => t.isArchived == showArchived)
        .toList();

    return filteredTournaments.isEmpty
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
                          // Cannot be extracted due to local variable: context
                          // ignore: prefer-extracting-callbacks
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
                          // Cannot be extracted due to local variable: tournament
                          // ignore: prefer-extracting-callbacks
                          onPressed: () {
                            final id = tournament.id;
                            if (id != null) {
                              sl<TournamentSelectionViewModel>()
                                  .flipArchiveStatus(id);
                            }
                          },
                        ),
                        YaruIconButton(
                          icon: const Icon(Icons.delete),
                          // Cannot be extracted due to local variable: tournament
                          // ignore: prefer-extracting-callbacks
                          onPressed: () {
                            final id = tournament.id;
                            if (id != null) {
                              sl<TournamentSelectionViewModel>()
                                  .deleteTournament(id);
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
