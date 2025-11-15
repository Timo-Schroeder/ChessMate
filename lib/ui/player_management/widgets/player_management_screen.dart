import 'package:flutter/material.dart';

class PlayerManagementScreen extends StatelessWidget {
  const PlayerManagementScreen({super.key, required this.tournamentId});

  final int tournamentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Player Management Screen\nTournament ID: $tournamentId',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
