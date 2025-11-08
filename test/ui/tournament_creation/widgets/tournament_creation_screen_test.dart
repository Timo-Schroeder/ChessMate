import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:watch_it/watch_it.dart'; // For sl
import 'package:go_router/go_router.dart'; // For GoRouter
// For YaruDateTimeEntry

import 'package:chessmate/ui/tournament_creation/widgets/tournament_creation_screen.dart';
import 'package:chessmate/ui/tournament_creation/view_model/tournament_creation_view_model.dart';
import 'package:chessmate/ui/core/ui/header_bar.dart'; // Import HeaderBar
import 'package:chessmate/ui/tournament_creation/widgets/tournament_creation_form.dart'; // New import
import 'package:chessmate/domain/models/tournament/tournament_format.dart'; // New import
import 'package:chessmate/l10n/app_localizations.dart'; // New import
import '../../../mocks.dart'; // For MockTournamentCreationViewModel and MockGoRouter

void main() {
  group('TournamentCreationScreen', () {
    late MockTournamentCreationViewModel mockViewModel;
    late MockGoRouter mockRouter;

    setUp(() {
      mockViewModel = MockTournamentCreationViewModel();
      mockRouter = MockGoRouter();

      when(() => mockViewModel.tournamentName).thenReturn('');
      when(() => mockViewModel.tournamentFormat)
          .thenReturn(TournamentFormat.swiss);
      when(() => mockViewModel.tournamentStartDate).thenReturn(null);
      when(() => mockViewModel.tournamentEndDate).thenReturn(null);
      when(() => mockViewModel.nameError).thenReturn('');
      when(() => mockViewModel.startDateError).thenReturn('');
      when(() => mockViewModel.endDateError).thenReturn('');
      when(() => mockViewModel.createTournament()).thenReturn(true);
      when(() => mockViewModel.cancelTournamentCreation()).thenAnswer((_) {});

      // Register the mock ViewModel for GetIt
      if (sl.isRegistered<TournamentCreationViewModel>()) {
        sl.unregister<TournamentCreationViewModel>();
      }
      sl.registerSingleton<TournamentCreationViewModel>(mockViewModel);
    });

    tearDown(() {
      sl.unregister<TournamentCreationViewModel>();
    });

    Future<void> pumpTournamentCreationScreen(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: InheritedGoRouter(
            goRouter: mockRouter,
            child: TournamentCreationScreen(),
          ),
        ),
      );
    }

    testWidgets(
        'should display HeaderBar with initial title and TournamentCreationForm',
        (WidgetTester tester) async {
      await pumpTournamentCreationScreen(tester);

      expect(find.byType(HeaderBar), findsOneWidget);
      expect(find.text('New Tournament: '), findsOneWidget);
      expect(find.byType(TournamentCreationForm), findsOneWidget);
    });

    testWidgets('should update HeaderBar title when tournamentName changes',
        (WidgetTester tester) async {
      await pumpTournamentCreationScreen(tester);

      // Simulate a change in the view model's tournamentName
      when(() => mockViewModel.tournamentName).thenReturn('My New Tournament');
      mockViewModel.notifyListeners(); // Explicitly call notifyListeners
      await tester.pump();

      expect(find.text('New Tournament: My New Tournament'), findsOneWidget);
    });

    testWidgets(
        'should update tournamentName in ViewModel when text is entered',
        (WidgetTester tester) async {
      await pumpTournamentCreationScreen(tester);

      final nameField = find.widgetWithText(TextFormField, 'Name');
      expect(nameField, findsOneWidget);

      await tester.enterText(nameField, 'New Tournament Name');
      verify(() => mockViewModel.tournamentName = 'New Tournament Name')
          .called(1);
    });

    testWidgets('should display name validation error',
        (WidgetTester tester) async {
      await pumpTournamentCreationScreen(tester);

      when(() => mockViewModel.nameError).thenReturn('Name cannot be empty');
      mockViewModel.notifyListeners();
      await tester.pump();

      expect(find.text('Name cannot be empty'), findsOneWidget);
    });

    testWidgets('should call createTournament and navigate on success',
        (WidgetTester tester) async {
      await pumpTournamentCreationScreen(tester);

      when(() => mockViewModel.createTournament()).thenReturn(true);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Create'));
      await tester.pumpAndSettle();

      verify(() => mockViewModel.createTournament()).called(1);
      verify(() => mockRouter.go('/tournament-selection')).called(1);
    });

    testWidgets('should call cancelTournamentCreation and navigate on cancel',
        (WidgetTester tester) async {
      await pumpTournamentCreationScreen(tester);

      await tester.tap(find.widgetWithText(OutlinedButton, 'Cancel'));
      await tester.pumpAndSettle();

      verify(() => mockViewModel.cancelTournamentCreation()).called(1);
      verify(() => mockRouter.go('/tournament-selection')).called(1);
    });

    testWidgets('should not navigate on createTournament failure',
        (WidgetTester tester) async {
      await pumpTournamentCreationScreen(tester);

      when(() => mockViewModel.createTournament()).thenReturn(false);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Create'));
      await tester.pumpAndSettle();

      verify(() => mockViewModel.createTournament()).called(1);
      verifyNever(() => mockRouter.go(any()));
    });

    // Add tests for YaruDateTimeEntry and YaruPopupMenuButton interactions
  });
}
