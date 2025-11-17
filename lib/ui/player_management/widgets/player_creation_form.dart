import 'package:chessmate/domain/models/player/fide_title.dart';
import 'package:chessmate/domain/models/player/gender.dart';
import 'package:chessmate/ui/player_management/view_model/player_management_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

class PlayerCreationForm extends StatelessWidget with WatchItMixin {
  const PlayerCreationForm(this.tournamentId, {super.key});

  final int tournamentId;

  @override
  Widget build(BuildContext context) {
    final firstNameError = watchPropertyValue(
      (PlayerManagementViewModel vm) => vm.playerCreationFirstNameError,
    );
    final lastNameError = watchPropertyValue(
      (PlayerManagementViewModel vm) => vm.playerCreationLastNameError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'First Name: '),
          onChanged: (value) =>
              sl<PlayerManagementViewModel>().playerCreationFirstName = value,
        ),
        Text(firstNameError, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Last Name: '),
          onChanged: (value) =>
              sl<PlayerManagementViewModel>().playerCreationLastName = value,
        ),
        Text(lastNameError, style: const TextStyle(color: Colors.red)),
        const Text('Club', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Club Name: '),
          onChanged: (value) =>
              sl<PlayerManagementViewModel>().playerCreationClub = value,
        ),

        const SizedBox(height: 16),
        const Text(
          'Year of Birth',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Year of Birth: '),
          onChanged: (value) =>
              sl<PlayerManagementViewModel>().playerCreationYearOfBirth =
                  int.parse(value),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),

        const SizedBox(height: 16),
        const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        YaruPopupMenuButton<Gender>(
          initialValue: Gender.male,
          itemBuilder: genderFormatChoiceBuilder,
          onSelected: (value) =>
              sl<PlayerManagementViewModel>().playerCreationGender = value,
          child: Text(
            sl<PlayerManagementViewModel>().playerCreationGender.name,
          ),
        ),

        const SizedBox(height: 16),
        const Text(
          'National Rating',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'National Rating: '),
          onChanged: (value) =>
              sl<PlayerManagementViewModel>().playerCreationNationalRating =
                  int.parse(value),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),

        const SizedBox(height: 16),
        const Text('Elo', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Elo: '),
          onChanged: (value) =>
              sl<PlayerManagementViewModel>().playerCreationElo = int.parse(
                value,
              ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),

        const SizedBox(height: 16),
        const Text('Fide Title', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        YaruPopupMenuButton<FideTitle>(
          initialValue: FideTitle.none,
          itemBuilder: fideTitleFormatChoiceBuilder,
          onSelected: (value) =>
              sl<PlayerManagementViewModel>().playerCreationFideTitle = value,
          child: Text(
            sl<PlayerManagementViewModel>().playerCreationFideTitle.name,
          ),
        ),

        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                sl<PlayerManagementViewModel>().cancelPlayerAddition();
                Navigator.maybePop(context);
              },
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 32),
            ElevatedButton(
              onPressed: () {
                if (sl<PlayerManagementViewModel>().addPlayer(tournamentId)) {
                  Navigator.maybePop(context);
                }
              },
              child: const Text('Add Player'),
            ),
          ],
        ),
      ],
    );
  }

  List<PopupMenuEntry<Gender>> genderFormatChoiceBuilder(BuildContext context) {
    return [
      for (final value in Gender.values)
        PopupMenuItem(value: value, child: Text(value.name)),
    ];
  }

  List<PopupMenuEntry<FideTitle>> fideTitleFormatChoiceBuilder(
    BuildContext context,
  ) {
    return [
      for (final value in FideTitle.values)
        PopupMenuItem(value: value, child: Text(value.name)),
    ];
  }
}
