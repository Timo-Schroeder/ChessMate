import 'package:flutter/material.dart';

class PlayerTable extends StatelessWidget {
  const PlayerTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        const DataColumn(label: Text('First Name')),
        const DataColumn(label: Text('Last Name')),
        const DataColumn(label: Text('Club')),
        const DataColumn(label: Text('Year of Birth'), numeric: true),
        const DataColumn(label: Text('Gender')),
        const DataColumn(label: Text('Title')),
        const DataColumn(label: Text('National Rating'), numeric: true),
        const DataColumn(label: Text('ELO'), numeric: true),
      ],
      rows: [
        const DataRow(
          cells: [
            DataCell(Text('Timo')),
            DataCell(Text('Schröder')),
            DataCell(Text('SC TS Ahrtal')),
            DataCell(Text('2002')),
            DataCell(Text('Male')),
            DataCell(Text('')),
            DataCell(Text('1507')),
            DataCell(Text('???')),
          ],
        ),
      ],
      showCheckboxColumn: false,
      sortColumnIndex: 6,
    );
  }
}
