import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru/yaru.dart';
import 'package:chessmate/routing/routes.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context);
    final tournamentId =
        int.tryParse(currentRoute.pathParameters['id'] ?? '') ?? -1;

    final navigationItems = [
      _NavigationItem(
        icon: Icons.dashboard,
        label: 'Dashboard',
        route: '${Routes.dashboard}/$tournamentId',
      ),
      _NavigationItem(
        icon: Icons.people,
        label: 'Players',
        route: '${Routes.playerManagement}/$tournamentId',
      ),
      _NavigationItem(
        icon: Icons.circle,
        label: 'Rounds',
        route: '${Routes.roundManagement}/$tournamentId',
      ),
      _NavigationItem(
        icon: Icons.list,
        label: 'Standings',
        route: '${Routes.standings}/$tournamentId',
      ),
      _NavigationItem(
        icon: YaruIcons.settings,
        label: 'Settings',
        route: '${Routes.settings}/$tournamentId',
      ),
    ];

    return Container(
      color: Theme.of(context).splashColor,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: navigationItems.length,
              itemBuilder: (context, index) {
                final item = navigationItems[index];
                final isSelected = currentRoute.uri.toString() == item.route;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                  child: YaruMasterTile(
                    leading: Icon(item.icon),
                    title: Text(
                      item.label,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    selected: isSelected,
                    // Cannot be extracted due to local variable: context
                    // ignore: prefer-extracting-callbacks
                    onTap: () {
                      if (!isSelected) {
                        context.go(item.route);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem {
  final String route;
  final IconData icon;
  final String label;

  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}
