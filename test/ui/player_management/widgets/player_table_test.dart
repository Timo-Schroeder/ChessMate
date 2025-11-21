import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:watch_it/watch_it.dart';
import 'package:chessmate/domain/models/player/player.dart';
import 'package:chessmate/domain/models/player/gender.dart';
import 'package:chessmate/domain/models/player/fide_title.dart';
import 'package:chessmate/ui/player_management/view_model/player_management_view_model.dart';
import 'package:chessmate/ui/player_management/widgets/player_table.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

// Mock PlayerManagementViewModel
class MockPlayerManagementViewModel extends Mock
    implements PlayerManagementViewModel {}

void main() {
  late MockPlayerManagementViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockPlayerManagementViewModel();

    // Register the mock view model with get_it (sl)
    if (sl.isRegistered<PlayerManagementViewModel>()) {
      sl.unregister<PlayerManagementViewModel>();
    }
    sl.registerSingleton<PlayerManagementViewModel>(mockViewModel);
  });

  tearDown(() {
    sl.reset();
  });

  testWidgets('PlayerTable displays players from ViewModel', (
    WidgetTester tester,
  ) async {
    final testPlayers = [
      const Player(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        yearOfBirth: 1990,
        gender: Gender.male,
        tournamentId: 1,
        title: FideTitle.none,
        active: true,
        club: 'Chess Club 1',
        elo: 1500,
        nationalRating: 1400,
      ),
      const Player(
        id: 2,
        firstName: 'Jane',
        lastName: 'Smith',
        yearOfBirth: 1992,
        gender: Gender.female,
        tournamentId: 1,
        title: FideTitle.wgm,
        active: true,
        club: 'Chess Club 2',
        elo: 2200,
        nationalRating: 2100,
      ),
    ];

    when(() => mockViewModel.players).thenReturn(testPlayers.lock);

    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: PlayerTable())),
    );

    // Verify that the player data is displayed
    expect(find.text('John'), findsOneWidget);
    expect(find.text('Doe'), findsOneWidget);
    expect(find.text('Chess Club 1'), findsOneWidget);
    expect(find.text('1990'), findsOneWidget);
    expect(find.text('male'), findsOneWidget);
    expect(find.text('none'), findsOneWidget);
    expect(find.text('1400'), findsOneWidget);
    expect(find.text('1500'), findsOneWidget);

    expect(find.text('Jane'), findsOneWidget);
    expect(find.text('Smith'), findsOneWidget);
    expect(find.text('Chess Club 2'), findsOneWidget);
    expect(find.text('1992'), findsOneWidget);
    expect(find.text('female'), findsOneWidget);
    expect(find.text('wgm'), findsOneWidget);
    expect(find.text('2100'), findsOneWidget);
    expect(find.text('2200'), findsOneWidget);
  });

  testWidgets(
    'PlayerTable displays "No players found" message when list is empty',
    (WidgetTester tester) async {
      when(() => mockViewModel.players).thenReturn(const IList.empty());

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: PlayerTable())),
      );

      expect(
        find.text('No players found for this tournament.'),
        findsOneWidget,
      );
    },
  );
}
