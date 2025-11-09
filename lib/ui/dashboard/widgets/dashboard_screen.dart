import 'package:chessmate/ui/core/ui/header_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final int _id;

  const DashboardScreen(this._id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      body: Center(
        child: Text('$_id'),
      ),
    );
  }
}
