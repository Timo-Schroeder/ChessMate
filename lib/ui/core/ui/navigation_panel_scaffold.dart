import 'package:chessmate/ui/core/ui/navigation_panel.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class NavigationPanelScaffold extends StatelessWidget {
  const NavigationPanelScaffold(this.child, {super.key});

  static const double kNavigationPanelWidth = 280;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: kNavigationPanelWidth,
          child: Scaffold(
            appBar: YaruWindowTitleBar(
              border: const BorderSide(style: BorderStyle.none),
              title: const Text(
                'ChessMate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              isClosable: false,
              isMaximizable: false,
              isMinimizable: false,
              isRestorable: false,
              backgroundColor: Theme.of(context).splashColor,
              heroTag: 'navigation_title_bar',
            ),
            body: const NavigationPanel(),
          ),
        ),
        const VerticalDivider(thickness: 5),
        Expanded(
          child: Scaffold(
            appBar: const YaruWindowTitleBar(
              border: BorderSide(style: BorderStyle.none),
              heroTag: 'main_title_bar',
            ),
            body: child,
          ),
        ),
      ],
    );
  }
}
