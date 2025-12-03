import 'package:chessmate/_features/players/_managers/player_manager.dart';
import 'package:chessmate/_features/players/_models/fide_title.dart';
import 'package:chessmate/_features/players/_models/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:yaru/yaru.dart';

class PlayerCreationForm extends StatelessWidget with WatchItMixin {
  const PlayerCreationForm(this.tournamentId, {super.key});

  final int tournamentId;

  @override
  Widget build(BuildContext context) {
    final firstNameError = watchPropertyValue(
      (PlayerManager vm) => vm.playerCreationFirstNameError,
    );
    final lastNameError = watchPropertyValue(
      (PlayerManager vm) => vm.playerCreationLastNameError,
    );
    final yearOfBirthError = watchPropertyValue(
      (PlayerManager vm) => vm.playerCreationYearOfBirthError,
    );

    return ListView(
      children: [
        const Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'First Name: '),
          onChanged: (value) =>
              sl<PlayerManager>().playerCreationFirstName = value,
        ),
        Text(firstNameError, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Last Name: '),
          onChanged: (value) =>
              sl<PlayerManager>().playerCreationLastName = value,
        ),
        Text(lastNameError, style: const TextStyle(color: Colors.red)),
        const Text('Club', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Club Name: '),
          onChanged: (value) => sl<PlayerManager>().playerCreationClub = value,
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
              sl<PlayerManager>().playerCreationYearOfBirth = int.parse(value),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        Text(yearOfBirthError, style: const TextStyle(color: Colors.red)),

        const SizedBox(height: 16),
        const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        YaruPopupMenuButton<Gender>(
          initialValue: Gender.male,
          itemBuilder: genderFormatChoiceBuilder,
          onSelected: (value) =>
              sl<PlayerManager>().playerCreationGender = value,
          child: Text(sl<PlayerManager>().playerCreationGender.name),
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
              sl<PlayerManager>().playerCreationNationalRating = int.parse(
                value,
              ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),

        const SizedBox(height: 16),
        const Text('Elo', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Elo: '),
          onChanged: (value) =>
              sl<PlayerManager>().playerCreationElo = int.parse(value),
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
              sl<PlayerManager>().playerCreationFideTitle = value,
          child: Text(sl<PlayerManager>().playerCreationFideTitle.name),
        ),

        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                sl<PlayerManager>().cancelPlayerAddition();
                Navigator.maybePop(context);
              },
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 32),
            ElevatedButton(
              onPressed: () async {
                final success = await sl<PlayerManager>().addPlayer(
                  tournamentId,
                );
                if (success && context.mounted) {
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
