import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Dashboard'),
        Text('Players'),
        Text('Rounds'),
      ],
    );
  }
}
