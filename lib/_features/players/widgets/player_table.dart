import 'package:chessmate/_features/players/_managers/player_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';

class PlayerTable extends WatchingWidget {
  const PlayerTable({super.key});

  @override
  Widget build(BuildContext context) {
    final playerList = watchPropertyValue((PlayerManager vm) => vm.players);

    if (playerList.isEmpty) {
      return const Center(child: Text('No players found for this tournament.'));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('First Name')),
          DataColumn(label: Text('Last Name')),
          DataColumn(label: Text('Club')),
          DataColumn(label: Text('Year of Birth'), numeric: true),
          DataColumn(label: Text('Gender')),
          DataColumn(label: Text('Title')),
          DataColumn(label: Text('National Rating'), numeric: true),
          DataColumn(label: Text('ELO'), numeric: true),
        ],
        rows: playerList.map((player) {
          return DataRow(
            cells: [
              DataCell(Text(player.firstName)),
              DataCell(Text(player.lastName)),
              DataCell(Text(player.club ?? 'N/A')),
              DataCell(Text(player.yearOfBirth.toString())),
              DataCell(Text(player.gender.name)),
              DataCell(Text(player.title.name)),
              DataCell(Text(player.nationalRating?.toString() ?? 'N/A')),
              DataCell(Text(player.elo?.toString() ?? 'N/A')),
            ],
          );
        }).toList(),
        showCheckboxColumn: false,
        sortColumnIndex: 6,
      ),
    );
  }
}
