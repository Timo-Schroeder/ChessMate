import 'package:chessmate/_features/players/_managers/player_manager.dart';
import 'package:chessmate/_features/players/widgets/player_creation_form.dart';
import 'package:chessmate/_features/players/widgets/player_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:yaru/yaru.dart';

class PlayerManagementScreen extends StatelessWidget {
  const PlayerManagementScreen({super.key, required this.tournamentId});

  final int tournamentId;

  @override
  Widget build(BuildContext context) {
    // Trigger the fetch. The ViewModel is smart enough to not re-fetch on every build.
    sl<PlayerManager>().fetchPlayers(tournamentId);

    return Scaffold(
      body: const PlayerTable(),

      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: YaruDialogTitleBar(
              title: const Text('New Player'),
              border: const BorderSide(style: BorderStyle.none),
              isClosable: true,
              onClose: (context) {
                sl<PlayerManager>().cancelPlayerAddition();
                Navigator.maybePop(context);
              },
            ),
            content: SizedBox(
              width: 400,
              height: 500,
              child: PlayerCreationForm(tournamentId),
            ),
          ),
        ),
        child: const Icon(YaruIcons.plus),
      ),
    );
  }
}
