import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import 'package:chessmate/utils/locator.dart';
import 'package:chessmate/ui/tournament_selection/view_model/tournament_selection_view_model.dart';

class TournamentSelectionList extends StatelessWidget with WatchItMixin {
  TournamentSelectionList({super.key});
  static const double _kTournamentSectionWidth = 400.0;
  static const double _kTournamentSectionHeight = 400.0;

  @override
  Widget build(BuildContext context) {
    final tournamentList = watchPropertyValue(
      (TournamentSelectionViewModel m) => m.tournaments.reversed,
    );

    return YaruSection(
      headline: const Text('Tournaments'),
      width: _kTournamentSectionWidth,
      height: _kTournamentSectionHeight,
      padding: const EdgeInsets.all(kYaruPagePadding),
      child: ListView(
        children: [
          for (final tournament in tournamentList)
            YaruTile(
              title: Text(tournament.name),
              trailing: YaruIconButton(
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
            ),
        ],
      ),
    );
  }
}
