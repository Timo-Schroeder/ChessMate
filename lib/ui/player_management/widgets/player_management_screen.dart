import 'package:chessmate/ui/player_management/view_model/player_management_view_model.dart';
import 'package:chessmate/ui/player_management/widgets/player_creation_form.dart';
import 'package:chessmate/ui/player_management/widgets/player_table.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
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
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: YaruDialogTitleBar(
              title: const Text('New Player'),
              border: const BorderSide(style: BorderStyle.none),
              isClosable: true,
              onClose: (context) {
                sl<PlayerManagementViewModel>().cancelPlayerAddition();
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
