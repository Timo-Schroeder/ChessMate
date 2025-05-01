import '../../core/ui/header_bar.dart';
import '../../tournament_creation/widgets/tournament_creation_screen.dart';
import 'tournament_selection_list.dart';
import 'package:flutter/material.dart';

class TournamentSelectionScreen extends StatelessWidget {
  const TournamentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TournamentSelectionList(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TournamentCreationScreen(),
                  ),
                );
              },
              child: const Text('New Tournament'),
            ),
          ],
        ),
      ),
    );
  }
}
