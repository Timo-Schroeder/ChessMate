import 'package:chessmate/ui/player_management/widgets/player_creation_form.dart';
import 'package:chessmate/ui/player_management/widgets/player_table.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class PlayerManagementScreen extends StatelessWidget {
  const PlayerManagementScreen({super.key, required this.tournamentId});

  final int tournamentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PlayerTable(),

      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: const YaruDialogTitleBar(
              title: Text('New Player'),
              border: BorderSide(style: BorderStyle.none),
              isClosable: true,
            ),
            content: PlayerCreationForm(tournamentId),
          ),
        ),
        child: const Icon(YaruIcons.plus),
      ),
    );
  }
}
