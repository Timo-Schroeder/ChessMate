import 'package:chessmate/l10n/localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import 'package:chessmate/ui/core/ui/header_bar.dart';
import 'package:chessmate/ui/tournament_creation/view_model/tournament_creation_view_model.dart';
import 'package:chessmate/ui/tournament_creation/widgets/tournament_creation_form.dart';

class TournamentCreationScreen extends StatelessWidget with WatchItMixin {
  TournamentCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tournamentName = watchPropertyValue(
      (TournamentCreationViewModel vm) => vm.tournamentName,
    );

    return Scaffold(
      appBar: HeaderBar(
        title: Text(
          '${context.l10n.tournamentCreationHeaderBar} $tournamentName',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TournamentCreationForm(),
      ),
    );
  }
}
