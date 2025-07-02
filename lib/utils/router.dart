import 'package:go_router/go_router.dart';

import '../ui/tournament_creation/widgets/tournament_creation_screen.dart';
import '../ui/tournament_selection/widgets/tournament_selection_screen.dart';

final router = GoRouter(
  initialLocation: '/tournament-selection',
  routes: [
    GoRoute(
      name: 'tournament-selection',
      path: '/tournament-selection',
      builder: (context, state) => const TournamentSelectionScreen(),
    ),
    GoRoute(
      name: 'tournament-creation',
      path: '/tournament-creation',
      builder: (context, state) => TournamentCreationScreen(),
    )
  ],
);
