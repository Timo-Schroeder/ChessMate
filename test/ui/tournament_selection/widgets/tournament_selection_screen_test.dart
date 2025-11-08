import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart'; // For sl
import 'package:fast_immutable_collections/fast_immutable_collections.dart'; // New import

import 'package:chessmate/ui/tournament_selection/widgets/tournament_selection_screen.dart';
import 'package:chessmate/ui/tournament_selection/view_model/tournament_selection_view_model.dart';
import 'package:chessmate/l10n/app_localizations.dart'; // For AppLocalizations
import 'package:chessmate/ui/core/ui/header_bar.dart'; // Import HeaderBar
import '../../../mocks.dart'; // For MockTournamentSelectionViewModel and MockGoRouter

void main() {
  group('TournamentSelectionScreen', () {
    late MockTournamentSelectionViewModel mockViewModel;
    late MockGoRouter mockRouter;

    setUp(() {
      mockViewModel = MockTournamentSelectionViewModel();
      mockRouter = MockGoRouter();
      when(() => mockViewModel.tournaments).thenReturn(IList([]));
      when(() => mockViewModel.isLoading).thenReturn(false);

      // Register the mock ViewModel for GetIt
      if (sl.isRegistered<TournamentSelectionViewModel>()) {
        sl.unregister<TournamentSelectionViewModel>();
      }
      sl.registerSingleton<TournamentSelectionViewModel>(mockViewModel);
    });

    tearDown(() {
      sl.unregister<TournamentSelectionViewModel>();
    });

    Future<void> pumpTournamentSelectionScreen(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: InheritedGoRouter(
            goRouter: mockRouter,
            child: const TournamentSelectionScreen(),
          ),
        ),
      );
    }

    testWidgets('should display HeaderBar and New Tournament button',
        (WidgetTester tester) async {
      await pumpTournamentSelectionScreen(tester);

      expect(find.byType(HeaderBar), findsOneWidget);
      expect(find.text('New Tournament'),
          findsOneWidget); // Assuming default English text
    });

    testWidgets(
        'should navigate to tournament creation screen when button is pressed',
        (WidgetTester tester) async {
      await pumpTournamentSelectionScreen(tester);

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      verify(() => mockRouter.go('/tournament-creation')).called(1);
    });

    // Add more tests for TournamentList and YaruExpansionPanel if needed
  });
}
