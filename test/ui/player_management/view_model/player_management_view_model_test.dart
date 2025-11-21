import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:safe_change_notifier/safe_change_notifier.dart'; // Removed unused import
import 'package:watch_it/watch_it.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:chessmate/data/repositories/player_repository.dart';
import 'package:chessmate/domain/models/player/player.dart';
import 'package:chessmate/ui/player_management/view_model/player_management_view_model.dart';
import 'package:chessmate/domain/models/player/gender.dart'; // Added for Player model
import 'package:chessmate/domain/models/player/fide_title.dart'; // Added for Player model

import '../../../fakes.dart';

// Mock PlayerRepository
class MockPlayerRepository extends Mock implements PlayerRepository {}

void main() {
  late PlayerManagementViewModel viewModel;
  late MockPlayerRepository mockPlayerRepository;

  setUpAll(() {
    registerFallbackValue(FakePlayer());
  });

  setUp(() {
    mockPlayerRepository = MockPlayerRepository();
    // Register the mock repository with get_it (sl)
    // Ensure sl is cleared and re-registered for each test
    if (sl.isRegistered<PlayerRepository>()) {
      sl.unregister<PlayerRepository>();
    }
    sl.registerSingleton<PlayerRepository>(mockPlayerRepository);

    viewModel = PlayerManagementViewModel();
  });

  tearDown(() {
    viewModel.dispose();
    sl.reset(); // Reset get_it for clean state between tests
  });

  group('PlayerManagementViewModel', () {
    test('fetchPlayers should update players list on success', () async {
      final testPlayers = IList([
        const Player(
          id: 1,
          firstName: 'John',
          lastName: 'Doe',
          yearOfBirth: 1990,
          gender: Gender.male,
          tournamentId: 1,
          title: FideTitle.none, // Added required argument
          active: true, // Added required argument
        ),
        const Player(
          id: 2,
          firstName: 'Jane',
          lastName: 'Smith',
          yearOfBirth: 1992,
          gender: Gender.female,
          tournamentId: 1,
          title: FideTitle.none, // Added required argument
          active: true, // Added required argument
        ),
      ]);

      when(
        () => mockPlayerRepository.getPlayersInTournament(any()),
      ).thenAnswer((_) async => right(testPlayers));

      expect(viewModel.players, isEmpty);

      await viewModel.fetchPlayers(1);

      expect(viewModel.players, testPlayers.toList());
      verify(() => mockPlayerRepository.getPlayersInTournament(1)).called(1);
    });

    test('fetchPlayers should set players list to empty on error', () async {
      when(
        () => mockPlayerRepository.getPlayersInTournament(any()),
      ).thenAnswer((_) async => left('Failed to fetch players'));

      await viewModel.fetchPlayers(1);

      expect(viewModel.players, isEmpty);
      verify(() => mockPlayerRepository.getPlayersInTournament(1)).called(1);
    });

    test('fetchPlayers should re-fetch if tournamentId changes', () async {
      final testPlayers1 = IList([
        const Player(
          id: 1,
          firstName: 'John',
          lastName: 'Doe',
          yearOfBirth: 1990,
          gender: Gender.male,
          tournamentId: 1,
          title: FideTitle.none, // Added required argument
          active: true, // Added required argument
        ),
      ]);
      final testPlayers2 = IList([
        const Player(
          id: 3,
          firstName: 'Alice',
          lastName: 'Brown',
          yearOfBirth: 1988,
          gender: Gender.female,
          tournamentId: 2,
          title: FideTitle.none, // Added required argument
          active: true, // Added required argument
        ),
      ]);

      when(
        () => mockPlayerRepository.getPlayersInTournament(1),
      ).thenAnswer((_) async => right(testPlayers1));
      when(
        () => mockPlayerRepository.getPlayersInTournament(2),
      ).thenAnswer((_) async => right(testPlayers2));

      await viewModel.fetchPlayers(1);
      expect(viewModel.players, testPlayers1.toList());

      await viewModel.fetchPlayers(2);
      expect(viewModel.players, testPlayers2.toList());

      verify(() => mockPlayerRepository.getPlayersInTournament(1)).called(1);
      verify(() => mockPlayerRepository.getPlayersInTournament(2)).called(1);
    });

    test('addPlayer should create player and then fetch players', () async {
      // Arrange
      const tournamentId = 1;
      const newPlayer = Player(
        firstName: 'Test',
        lastName: 'Player',
        yearOfBirth: 2000,
        gender: Gender.male,
        nationalRating: 1200,
        elo: 1300,
        club: 'Test Club',
        title: FideTitle.none,
        active: true,
        tournamentId: tournamentId,
      );

      viewModel.playerCreationFirstName = newPlayer.firstName;
      viewModel.playerCreationLastName = newPlayer.lastName;
      viewModel.playerCreationYearOfBirth = newPlayer.yearOfBirth;
      viewModel.playerCreationGender = newPlayer.gender;
      viewModel.playerCreationNationalRating = newPlayer.nationalRating;
      viewModel.playerCreationElo = newPlayer.elo;
      viewModel.playerCreationClub = newPlayer.club!;
      viewModel.playerCreationFideTitle = newPlayer.title;

      when(
        () => mockPlayerRepository.createPlayer(any()),
      ).thenAnswer((_) async => right(FakePlayer()));
      when(
        () => mockPlayerRepository.getPlayersInTournament(tournamentId),
      ).thenAnswer((_) async => right(IList([newPlayer])));

      // Act
      final result = await viewModel.addPlayer(tournamentId);

      // Assert
      expect(result, isTrue);
      verifyInOrder([
        () => mockPlayerRepository.createPlayer(any()),
        () => mockPlayerRepository.getPlayersInTournament(tournamentId),
      ]);
      expect(viewModel.players.length, 1);
      expect(viewModel.players.first.firstName, 'Test');
    });
  });
}
