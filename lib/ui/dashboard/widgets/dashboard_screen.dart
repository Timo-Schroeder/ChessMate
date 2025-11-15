import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen(this._id, {super.key});

  final int _id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$_id'),
    );
  }
}
