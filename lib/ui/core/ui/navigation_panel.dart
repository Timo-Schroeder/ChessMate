import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru/yaru.dart';
import 'package:chessmate/routing/routes.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  static const double kNavigationPanelWidth = 250;

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context);
    final tournamentId =
        int.tryParse(currentRoute.pathParameters['id'] ?? '') ?? -1;

    // Define navigation items
    final navigationItems = [
      _NavigationItem(
        icon: Icons.dashboard,
        label: 'Dashboard',
        route: '${Routes.dashboard}/$tournamentId',
      ),
      _NavigationItem(
        icon: Icons.people,
        label: 'Player Management',
        route: '${Routes.playerManagement}/$tournamentId',
      ),
      _NavigationItem(
        icon: Icons.circle,
        label: 'Round Management',
        route: '${Routes.roundManagement}/$tournamentId',
      ),
      _NavigationItem(
        icon: Icons.list,
        label: 'Standings',
        route: '${Routes.standings}/$tournamentId',
      ),
      _NavigationItem(
        icon: Icons.settings,
        label: 'Settings',
        route: '${Routes.settings}/$tournamentId',
      ),
    ];

    return YaruBorderContainer(
      width: kNavigationPanelWidth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'ChessMate',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: navigationItems.length,
              itemBuilder: (context, index) {
                final item = navigationItems[index];
                final isSelected = currentRoute.uri.toString() == item.route;

                return YaruMasterTile(
                  leading: Icon(item.icon),
                  title: Text(item.label),
                  selected: isSelected,
                  // Cannot be extracted due to local variable: context
                  // ignore: prefer-extracting-callbacks
                  onTap: () {
                    if (!isSelected) {
                      context.go(item.route);
                    }
                  },
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
