import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../core/ui/header_bar.dart';
import '../view_model/tournament_creation_view_model.dart';
import 'tournament_creation_form.dart';

class TournamentCreationScreen extends StatelessWidget with WatchItMixin {
  TournamentCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tournamentName = watchPropertyValue(
      (TournamentCreationViewModel vm) => vm.name.value,
    );

    return Scaffold(
      appBar: HeaderBar(title: Text('New Tournament: $tournamentName')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TournamentCreationForm(),
      ),
    );
  }
}
