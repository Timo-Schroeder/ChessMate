import 'package:flutter/material.dart';

class StandingsScreen extends StatelessWidget {
  const StandingsScreen({super.key, required this.tournamentId});

  final int tournamentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Standings Screen\nTournament ID: $tournamentId',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
