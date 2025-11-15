import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:watch_it/watch_it.dart';

import 'package:chessmate/domain/models/tournament/tournament.dart';
import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/data/services/database_service.dart';
import 'package:chessmate/domain/models/tournament/tournament_format.dart';
import '../../fakes.dart'; // New import for FakeDatabaseService

void main() {
  group('TournamentRepository', () {
    late TournamentRepository tournamentRepository;
    late FakeDatabaseService
        fakeDatabaseService; // Changed to FakeDatabaseService

    setUp(() {
      fakeDatabaseService =
          FakeDatabaseService(); // Changed to FakeDatabaseService
      // Register the fake for GetIt
      if (sl.isRegistered<DatabaseService>()) {
        sl.unregister<DatabaseService>();
      }
      sl.registerSingleton<DatabaseService>(
        fakeDatabaseService,
      ); // Register the fake
      tournamentRepository = TournamentRepository(fakeDatabaseService);
    });

    tearDown(() {
      sl.unregister<DatabaseService>();
    });

    final tTournament = Tournament(
      id: 1,
      name: 'Test Tournament',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 1)),
      format: TournamentFormat.swiss,
      hasStarted: false,
      hasFinished: false,
      isArchived: false,
    );

    group('getTournaments', () {
      test(
          'should return IList<Tournament> when the call to database is successful',
          () async {
        fakeDatabaseService.getAllTournamentsStub =
            () async => Right(IList([tTournament])); // Stubbing

        final result = await tournamentRepository.getTournaments();

        expect(result, Right(IList([tTournament])));
      });

      test('should return a failure when the call to database is unsuccessful',
          () async {
        fakeDatabaseService.getAllTournamentsStub =
            () async => const Left('Database failure'); // Stubbing

        final result = await tournamentRepository.getTournaments();

        expect(result, const Left('Database failure'));
      });
    });

    group('createTournament', () {
      test('should return Tournament when the call to database is successful',
          () async {
        fakeDatabaseService.createTournamentStub =
            (tournament) async => Right(tTournament); // Stubbing

        final result = await tournamentRepository.createTournament(tTournament);

        expect(result, Right(tTournament));
      });

      test('should return a failure when the call to database is unsuccessful',
          () async {
        fakeDatabaseService.createTournamentStub =
            (tournament) async => const Left('Database failure'); // Stubbing

        final result = await tournamentRepository.createTournament(tTournament);

        expect(result, const Left('Database failure'));
      });
    });

    group('deleteTournament', () {
      test('should return void when the call to database is successful',
          () async {
        // ignore: void_checks
        fakeDatabaseService.deleteTournamentStub =
            (id) async => const Right(unit); // Stubbing

        await tournamentRepository.deleteTournament(tTournament.id!);

        expect(
          await tournamentRepository.deleteTournament(tTournament.id!),
          const Right(unit),
        );
      });

      test('should return a failure when the call to database is unsuccessful',
          () async {
        fakeDatabaseService.deleteTournamentStub =
            (id) async => const Left('Database failure'); // Stubbing

        final result =
            await tournamentRepository.deleteTournament(tTournament.id!);

        expect(result, const Left('Database failure'));
      });
    });

    group('getTournamentById', () {
      test('should return Tournament when the call to database is successful',
          () async {
        fakeDatabaseService.getTournamentByIdStub =
            (id) async => Right(tTournament); // Stubbing

        final result =
            await tournamentRepository.getTournamentById(tTournament.id!);

        expect(result, Right(tTournament));
      });

      test('should return a failure when the call to database is unsuccessful',
          () async {
        fakeDatabaseService.getTournamentByIdStub =
            (id) async => const Left('Database failure'); // Stubbing

        final result =
            await tournamentRepository.getTournamentById(tTournament.id!);

        expect(result, const Left('Database failure'));
      });
    });

    group('updateTournament', () {
      test('should return void when the call to database is successful',
          () async {
        fakeDatabaseService.updateTournamentStub =
            (id, tournament) async => const Right(unit); // Stubbing

        await tournamentRepository.updateTournament(
          tTournament.id!,
          tTournament,
        );

        expect(
          await tournamentRepository.updateTournament(
            tTournament.id!,
            tTournament,
          ),
          const Right(unit),
        );
      });

      test('should return a failure when the call to database is unsuccessful',
          () async {
        // ignore: void_checks
        fakeDatabaseService.updateTournamentStub = (id, tournament) async =>
            const Left('Database failure'); // Stubbing

        final result = await tournamentRepository.updateTournament(
          tTournament.id!,
          tTournament,
        );

        expect(result, const Left('Database failure'));
      });
    });
  });
}
