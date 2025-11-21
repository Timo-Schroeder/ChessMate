import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:chessmate/ui/player_management/view_model/player_management_view_model.dart';

class PlayerTable extends WatchingWidget {
  const PlayerTable({super.key});

  @override
  Widget build(BuildContext context) {
    final playerList = watchPropertyValue(
      (PlayerManagementViewModel vm) => vm.players,
    );

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
