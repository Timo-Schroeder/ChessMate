import 'package:chessmate/routing/routes.dart';
import 'package:chessmate/ui/core/ui/navigation_panel_scaffold.dart';
import 'package:chessmate/ui/dashboard/widgets/dashboard_screen.dart';
import 'package:chessmate/ui/player_management/widgets/player_management_screen.dart';
import 'package:chessmate/ui/round_management/widgets/round_management_screen.dart';
import 'package:chessmate/ui/standings/widgets/standings_screen.dart';
import 'package:chessmate/ui/settings/widgets/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:chessmate/ui/tournament_creation/widgets/tournament_creation_screen.dart';
import 'package:chessmate/ui/tournament_selection/widgets/tournament_selection_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.tournamentSelection,
  routes: [
    GoRoute(
      path: Routes.tournamentSelection,
      builder: (context, state) => const TournamentSelectionScreen(),
    ),
    GoRoute(
      path: Routes.tournamentCreation,
      builder: (context, state) => TournamentCreationScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => NavigationPanelScaffold(child),
      routes: [
        GoRoute(
          path: '${Routes.dashboard}/:id',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters['id']!) ?? -1;

            return DashboardScreen(id);
          },
        ),
        GoRoute(
          path: '${Routes.playerManagement}/:id',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters['id']!) ?? -1;
            return PlayerManagementScreen(tournamentId: id);
          },
        ),
        GoRoute(
          path: '${Routes.roundManagement}/:id',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters['id']!) ?? -1;
            return RoundManagementScreen(tournamentId: id);
          },
        ),
        GoRoute(
          path: '${Routes.standings}/:id',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters['id']!) ?? -1;
            return StandingsScreen(tournamentId: id);
          },
        ),
        GoRoute(
          path: '${Routes.settings}/:id',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters['id']!) ?? -1;
            return SettingsScreen(tournamentId: id);
          },
        ),
      ],
    ),
  ],
);
