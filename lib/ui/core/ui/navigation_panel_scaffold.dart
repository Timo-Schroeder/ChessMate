import 'package:chessmate/ui/core/ui/navigation_panel.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class NavigationPanelScaffold extends StatelessWidget {
  const NavigationPanelScaffold(
    this.child, {
    super.key,
  });

  final Widget child;

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
          Expanded(child: child),
        ],
      ),
    );
  }
}
