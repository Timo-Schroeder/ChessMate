import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru/yaru.dart';
import 'package:chessmate/routing/routes.dart'; // Import Routes

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

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
        icon: Icons.circle, // Using Icons.circle as per user request
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
      width: 250, // Match the width in NavigationPanelScaffold
      child: Column(
        children: [
          // Add a header or title if desired, e.g., "ChessMate"
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
  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  final String route;
  final IconData icon;
  final String label;
}
