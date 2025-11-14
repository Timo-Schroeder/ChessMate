import 'package:flutter/material.dart';

class RoundManagementScreen extends StatelessWidget {
  const RoundManagementScreen({super.key, required this.tournamentId});

  final int tournamentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Round Management Screen\nTournament ID: $tournamentId',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
