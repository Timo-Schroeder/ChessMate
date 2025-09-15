import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../view_model/tournament_selection_view_model.dart';

class TournamentSelectionList extends StatelessWidget with WatchItMixin {
  TournamentSelectionList({super.key});

  @override
  Widget build(BuildContext context) {
    final tournamentList = watchPropertyValue(
      (TournamentSelectionViewModel m) => m.tournaments.reversed,
    );

    return Column(
      children: [
        for (final tournament in tournamentList)
          !tournament.isArchived
              ? YaruTile(
                  title: Text(tournament.name),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  trailing: Row(
                    children: [
                      YaruIconButton(
                        icon: const Icon(Icons.archive),
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
                )
              : Container(),
      ],
    );
  }
}
