import 'package:chessmate/routing/routes.dart';
import 'package:chessmate/ui/dashboard/widgets/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:chessmate/ui/tournament_creation/widgets/tournament_creation_screen.dart';
import 'package:chessmate/ui/tournament_selection/widgets/tournament_selection_screen.dart';

final router = GoRouter(
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
    GoRoute(
      path: '${Routes.dashboard}/:id',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id']!) ?? -1;

        return DashboardScreen(id);
      },
    ),
  ],
);
