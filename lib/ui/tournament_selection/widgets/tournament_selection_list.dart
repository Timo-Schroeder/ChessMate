import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../../../utils/locator.dart';
import '../view_model/tournament_selection_view_model.dart';

class TournamentSelectionList extends StatelessWidget with WatchItMixin {
  TournamentSelectionList({super.key});

  @override
  Widget build(BuildContext context) {
    final tournamentList =
        watchPropertyValue((TournamentSelectionViewModel m) => m.tournaments);

    return YaruSection(
        headline: const Text('Tournaments'),
        width: 400,
        height: 400,
        padding: const EdgeInsets.all(kYaruPagePadding),
        child: ListView(
          children: [
            for (final tournament in tournamentList)
              YaruTile(
                title: Text(tournament.name),
                trailing: YaruIconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    locator<TournamentSelectionViewModel>()
                        .deleteTournament(tournament.id);
                  },
                ),
              ),
          ],
        ));
  }
}
