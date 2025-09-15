import 'package:go_router/go_router.dart';

import '../ui/tournament_creation/widgets/tournament_creation_screen.dart';
import '../ui/tournament_selection/widgets/tournament_selection_screen.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Routes.tournamentSelection,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.tournamentSelection,
      builder: (context, state) => const TournamentSelectionScreen(),
    ),
    GoRoute(
      path: Routes.tournamentCreation,
      builder: (context, state) => TournamentCreationScreen(),
    ),
  ],
);
