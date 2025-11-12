import 'package:chessmate/ui/core/ui/navigation_panel.dart';
import 'package:flutter/material.dart';
import 'package:yaru/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen(this._id, {super.key});

  final int _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const YaruWindowTitleBar(
        border: BorderSide(
          style: BorderStyle.none,
        ),
      ),
      body: Row(
        children: [
          const SizedBox(
            width: 250,
            child: NavigationPanel(),
          ),
          Center(
            child: Text('$_id'),
          ),
        ],
      ),
    );
  }
}
