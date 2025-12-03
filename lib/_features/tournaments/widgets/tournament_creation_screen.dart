import 'package:chessmate/_features/tournaments/_managers/tournament_creation_form_manager.dart';
import 'package:chessmate/_features/tournaments/widgets/tournament_creation_form.dart';
import 'package:chessmate/_shared/ui/widgets/header_bar.dart';
import 'package:chessmate/_shared/ui/widgets/localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';

class TournamentCreationScreen extends StatelessWidget with WatchItMixin {
  TournamentCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tournamentName = watchPropertyValue(
      (TournamentCreationFormManager vm) => vm.tournamentName,
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
