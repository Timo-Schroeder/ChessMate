import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import 'package:chessmate/utils/locator.dart';
import 'package:chessmate/ui/tournament_selection/view_model/tournament_selection_view_model.dart';

class TournamentArchiveList extends StatelessWidget with WatchItMixin {
  TournamentArchiveList({super.key});
  static const double _kTournamentArchiveWidth = 400.0;
  static const double _kTournamentArchiveHeight = 400.0;

  @override
  Widget build(BuildContext context) {
    final tournamentList = watchPropertyValue(
      (TournamentSelectionViewModel m) => m.tournaments.reversed,
    );

    return YaruSection(
      headline: const Text('Archived Tournaments'),
      width: _kTournamentArchiveWidth,
      height: _kTournamentArchiveHeight,
      padding: const EdgeInsets.all(kYaruPagePadding),
      child: ListView(
        children: [
          for (final tournament in tournamentList)
            tournament.isArchived
                ? YaruTile(
                    title: Text(tournament.name),
                    trailing: Row(
                      children: [
                        YaruIconButton(
                          icon: const Icon(Icons.edit_document),
                          // Cannot be extracted due to local variable: tournament
                          // ignore: prefer-extracting-callbacks
                          onPressed: () {
                            final id = tournament.id;
                            if (id != null) {
                              locator<TournamentSelectionViewModel>()
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
                              locator<TournamentSelectionViewModel>()
                                  .deleteTournament(id);
                            }
                          },
                        ),
                      ],
                    ),
                  )
                : Container(),
        ],
      ),
    );
  }
}
