import 'package:chessmate/routing/routes.dart';
import 'package:chessmate/ui/core/ui/navigation_panel_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru/yaru.dart';

void main() {
  group('NavigationPanel', () {
    testWidgets('renders all navigation tiles', (tester) async {
      final router = GoRouter(
        initialLocation: '${Routes.dashboard}/1',
        routes: [
          ShellRoute(
            builder: (context, state, child) => NavigationPanelScaffold(child),
            routes: [
              GoRoute(
                path: '${Routes.dashboard}/:id',
                builder: (context, state) => const Text('Dashboard Screen'),
              ),
              GoRoute(
                path: '${Routes.playerManagement}/:id',
                builder: (context, state) =>
                    const Text('Player Management Screen'),
              ),
              GoRoute(
                path: '${Routes.roundManagement}/:id',
                builder: (context, state) =>
                    const Text('Round Management Screen'),
              ),
              GoRoute(
                path: '${Routes.standings}/:id',
                builder: (context, state) => const Text('Standings Screen'),
              ),
              GoRoute(
                path: '${Routes.settings}/:id',
                builder: (context, state) => const Text('Settings Screen'),
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        YaruTheme(
          builder: (context, yaru, _) {
            return MaterialApp.router(
              theme: yaru.theme,
              routerConfig: router,
            );
          },
        ),
      );

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Players'), findsOneWidget);
      expect(find.text('Rounds'), findsOneWidget);
      expect(find.text('Standings'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('navigates to correct route on tap', (tester) async {
      final router = GoRouter(
        initialLocation: '${Routes.dashboard}/1',
        routes: [
          ShellRoute(
            builder: (context, state, child) => NavigationPanelScaffold(child),
            routes: [
              GoRoute(
                path: '${Routes.dashboard}/:id',
                builder: (context, state) => const Text('Dashboard Screen'),
              ),
              GoRoute(
                path: '${Routes.playerManagement}/:id',
                builder: (context, state) =>
                    const Text('Player Management Screen'),
              ),
              GoRoute(
                path: '${Routes.roundManagement}/:id',
                builder: (context, state) =>
                    const Text('Round Management Screen'),
              ),
              GoRoute(
                path: '${Routes.standings}/:id',
                builder: (context, state) => const Text('Standings Screen'),
              ),
              GoRoute(
                path: '${Routes.settings}/:id',
                builder: (context, state) => const Text('Settings Screen'),
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        YaruTheme(
          builder: (context, yaru, _) {
            return MaterialApp.router(
              theme: yaru.theme,
              routerConfig: router,
            );
          },
        ),
      );

      await tester.tap(find.text('Players'));
      await tester.pumpAndSettle();

      expect(find.text('Player Management Screen'), findsOneWidget);
      expect(
        router.routerDelegate.currentConfiguration.uri.toString(),
        '${Routes.playerManagement}/1',
      );
    });

    testWidgets('highlights the currently selected tile', (tester) async {
      final router = GoRouter(
        initialLocation: '${Routes.playerManagement}/1',
        routes: [
          ShellRoute(
            builder: (context, state, child) => NavigationPanelScaffold(child),
            routes: [
              GoRoute(
                path: '${Routes.dashboard}/:id',
                builder: (context, state) => const Text('Dashboard Screen'),
              ),
              GoRoute(
                path: '${Routes.playerManagement}/:id',
                builder: (context, state) =>
                    const Text('Player Management Screen'),
              ),
              GoRoute(
                path: '${Routes.roundManagement}/:id',
                builder: (context, state) =>
                    const Text('Round Management Screen'),
              ),
              GoRoute(
                path: '${Routes.standings}/:id',
                builder: (context, state) => const Text('Standings Screen'),
              ),
              GoRoute(
                path: '${Routes.settings}/:id',
                builder: (context, state) => const Text('Settings Screen'),
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        YaruTheme(
          builder: (context, yaru, _) {
            return MaterialApp.router(
              theme: yaru.theme,
              routerConfig: router,
            );
          },
        ),
      );

      final playerManagementTile =
          find.widgetWithText(YaruMasterTile, 'Players');
      final yaruMasterTileWidget =
          tester.widget<YaruMasterTile>(playerManagementTile);
      expect(yaruMasterTileWidget.selected, isTrue);

      final dashboardTile = find.widgetWithText(YaruMasterTile, 'Dashboard');
      final dashboardYaruMasterTileWidget =
          tester.widget<YaruMasterTile>(dashboardTile);
      expect(dashboardYaruMasterTileWidget.selected, isFalse);
    });
  });
}
