import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:watch_it/watch_it.dart';

import 'package:chessmate/domain/models/tournament/tournament.dart';
import 'package:chessmate/domain/use_cases/tournament/tournament_use_case.dart';
import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/domain/models/tournament/tournament_format.dart';
import '../../../mocks.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(
      Tournament(
        name: 'Fallback Tournament',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)),
        format: TournamentFormat.swiss,
        isArchived: false,
      ),
    );
  });

  group('TournamentUseCase', () {
    late TournamentUseCase tournamentUseCase;
    late MockTournamentRepository mockTournamentRepository;

    setUp(() {
      mockTournamentRepository = MockTournamentRepository();
      // Register the mock for GetIt
      if (sl.isRegistered<TournamentRepository>()) {
        sl.unregister<TournamentRepository>();
      }
      sl.registerSingleton<TournamentRepository>(mockTournamentRepository);
      tournamentUseCase = TournamentUseCase();
    });

    tearDown(() {
      sl.unregister<TournamentRepository>();
      tournamentUseCase.dispose();
    });

    final tTournament = Tournament(
      id: 1,
      name: 'Test Tournament',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 1)),
      format: TournamentFormat.swiss,
      isArchived: false,
    );

    final tTournament2 = Tournament(
      id: 2,
      name: 'Test Tournament 2',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 1)),
      format: TournamentFormat.swiss, // Changed to swiss
      isArchived: false,
    );

    test('initial state should have empty tournaments and isLoading true', () {
      expect(tournamentUseCase.tournaments, isEmpty);
      expect(tournamentUseCase.isLoading, isTrue);
    });

    group('loadInitialData', () {
      test(
          'should set isLoading to true then false and update tournaments on success',
          () async {
        when(() => mockTournamentRepository.getTournaments())
            .thenAnswer((_) async => Right(IList([tTournament])));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          if (tournamentUseCase.isLoading) {
            callOrder.add('isLoading true');
          } else {
            callOrder.add('isLoading false');
          }
          if (tournamentUseCase.tournaments.isNotEmpty) {
            callOrder.add('tournaments updated');
          }
        });

        await tournamentUseCase.loadInitialData();

        verify(() => mockTournamentRepository.getTournaments()).called(1);
        expect(tournamentUseCase.tournaments, IList([tTournament]));
        expect(tournamentUseCase.isLoading, isFalse);
        expect(callOrder, [
          'isLoading true',
          'isLoading false',
          'tournaments updated',
        ]); // Order might vary slightly based on internal notifyListeners calls
      });

      test(
          'should set isLoading to true then false and not update tournaments on failure',
          () async {
        when(() => mockTournamentRepository.getTournaments())
            .thenAnswer((_) async => const Left('Failed to load'));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          if (tournamentUseCase.isLoading) {
            callOrder.add('isLoading true');
          } else {
            callOrder.add('isLoading false');
          }
        });

        await tournamentUseCase.loadInitialData();

        verify(() => mockTournamentRepository.getTournaments()).called(1);
        expect(tournamentUseCase.tournaments, isEmpty);
        expect(tournamentUseCase.isLoading, isFalse);
        expect(callOrder, ['isLoading true', 'isLoading false']);
      });
    });

    group('createTournament', () {
      test('should add tournament to list and notify listeners on success',
          () async {
        when(() => mockTournamentRepository.createTournament(tTournament))
            .thenAnswer((_) async => Right(tTournament));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          callOrder.add('listener notified');
        });

        await tournamentUseCase.createTournament(tTournament);

        verify(() => mockTournamentRepository.createTournament(tTournament))
            .called(1);
        expect(tournamentUseCase.tournaments, IList([tTournament]));
        expect(callOrder, ['listener notified']);
      });

      test(
          'should not add tournament to list and not notify listeners on failure',
          () async {
        when(() => mockTournamentRepository.createTournament(tTournament))
            .thenAnswer((_) async => const Left('Failed to create'));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          callOrder.add('listener notified');
        });

        await tournamentUseCase.createTournament(tTournament);

        verify(() => mockTournamentRepository.createTournament(tTournament))
            .called(1);
        expect(tournamentUseCase.tournaments, isEmpty);
        expect(callOrder, isEmpty);
      });
    });

    group('deleteTournament', () {
      setUp(() {
        // Initialize with some data for deletion tests
        when(() => mockTournamentRepository.getTournaments())
            .thenAnswer((_) async => Right(IList([tTournament, tTournament2])));
        tournamentUseCase.loadInitialData();
        clearInteractions(mockTournamentRepository); // Clear initial load
      });

      test('should remove tournament from list and notify listeners on success',
          () async {
        when(() => mockTournamentRepository.deleteTournament(tTournament.id!))
            .thenAnswer((_) async => const Right(unit));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          callOrder.add('listener notified');
        });

        await tournamentUseCase.deleteTournament(tTournament.id!);

        verify(() => mockTournamentRepository.deleteTournament(tTournament.id!))
            .called(1);
        expect(tournamentUseCase.tournaments, IList([tTournament2]));
        expect(callOrder, ['listener notified']);
      });

      test(
          'should not remove tournament from list and not notify listeners on failure',
          () async {
        when(() => mockTournamentRepository.deleteTournament(tTournament.id!))
            .thenAnswer((_) async => const Left('Failed to delete'));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          callOrder.add('listener notified');
        });

        await tournamentUseCase.deleteTournament(tTournament.id!);

        verify(() => mockTournamentRepository.deleteTournament(tTournament.id!))
            .called(1);
        expect(
          tournamentUseCase.tournaments,
          IList([tTournament, tTournament2]),
        );
        expect(callOrder, isEmpty);
      });
    });

    group('flipArchiveStatusOfTournament', () {
      setUp(() {
        // Initialize with some data for archive tests
        when(() => mockTournamentRepository.getTournaments())
            .thenAnswer((_) async => Right(IList([tTournament])));
        tournamentUseCase.loadInitialData();
        clearInteractions(mockTournamentRepository); // Clear initial load
      });

      test('should update archive status and notify listeners on success',
          () async {
        final updatedTournament = tTournament.copyWith(isArchived: true);
        when(() => mockTournamentRepository.getTournamentById(tTournament.id!))
            .thenAnswer((_) async => Right(tTournament));
        when(
          () => mockTournamentRepository.updateTournament(
            tTournament.id!,
            updatedTournament,
          ),
        ).thenAnswer((_) async => const Right(unit));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          callOrder.add('listener notified');
        });

        await tournamentUseCase.flipArchiveStatusOfTournament(tTournament.id!);

        verify(
          () => mockTournamentRepository.getTournamentById(tTournament.id!),
        ).called(1);
        verify(
          () => mockTournamentRepository.updateTournament(
            tTournament.id!,
            updatedTournament,
          ),
        ).called(1);
        expect(tournamentUseCase.tournaments, IList([updatedTournament]));
        expect(callOrder, ['listener notified']);
      });

      test('should not update if getTournamentById fails', () async {
        when(() => mockTournamentRepository.getTournamentById(tTournament.id!))
            .thenAnswer((_) async => const Left('Not found'));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          callOrder.add('listener notified');
        });

        await tournamentUseCase.flipArchiveStatusOfTournament(tTournament.id!);

        verify(
          () => mockTournamentRepository.getTournamentById(tTournament.id!),
        ).called(1);
        verifyNever(
          () => mockTournamentRepository.updateTournament(
            any(that: isA<int>()),
            any(that: isA<Tournament>()),
          ),
        );
        expect(tournamentUseCase.tournaments, IList([tTournament]));
        expect(callOrder, isEmpty);
      });

      test('should not update if updateTournament fails', () async {
        final updatedTournament = tTournament.copyWith(isArchived: true);
        when(() => mockTournamentRepository.getTournamentById(tTournament.id!))
            .thenAnswer((_) async => Right(tTournament));
        when(
          () => mockTournamentRepository.updateTournament(
            tTournament.id!,
            updatedTournament,
          ),
        ).thenAnswer((_) async => const Left('Failed to update'));

        final callOrder = <String>[];
        tournamentUseCase.addListener(() {
          callOrder.add('listener notified');
        });

        await tournamentUseCase.flipArchiveStatusOfTournament(tTournament.id!);

        verify(
          () => mockTournamentRepository.getTournamentById(tTournament.id!),
        ).called(1);
        verify(
          () => mockTournamentRepository.updateTournament(
            tTournament.id!,
            updatedTournament,
          ),
        ).called(1);
        expect(tournamentUseCase.tournaments, IList([tTournament]));
        expect(callOrder, isEmpty);
      });
    });
  });
}
