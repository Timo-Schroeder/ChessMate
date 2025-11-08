import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart'; // New import for VoidCallback and ChangeNotifier

import 'package:chessmate/data/repositories/tournament_repository.dart';
import 'package:chessmate/data/services/database_service.dart'; // Import the abstract DatabaseService
import 'package:chessmate/domain/models/tournament/tournament.dart'; // Needed for IList<Tournament>
import 'package:chessmate/ui/tournament_selection/view_model/tournament_selection_view_model.dart';
import 'package:chessmate/ui/tournament_creation/view_model/tournament_creation_view_model.dart';

class MockTournamentRepository extends Mock implements TournamentRepository {}

class MockDatabaseService extends Mock implements DatabaseService {
  @override
  Future<void> init() => super.noSuchMethod(Invocation.method(#init, []));

  @override
  Future<Either<String, IList<Tournament>>> getAllTournaments() =>
      super.noSuchMethod(Invocation.method(#getAllTournaments, []));

  @override
  Future<Either<String, Tournament>> getTournamentById(int id) =>
      super.noSuchMethod(Invocation.method(#getTournamentById, [id]));

  @override
  Future<Either<String, Tournament>> createTournament(Tournament tournament) =>
      super.noSuchMethod(Invocation.method(#createTournament, [tournament]));

  @override
  Future<Either<String, void>> updateTournament(
    int id,
    Tournament tournament,
  ) =>
      super
          .noSuchMethod(Invocation.method(#updateTournament, [id, tournament]));

  @override
  Future<Either<String, void>> deleteTournament(int id) =>
      super.noSuchMethod(Invocation.method(#deleteTournament, [id]));
}

class MockTournamentSelectionViewModel extends Mock
    implements TournamentSelectionViewModel {}

class MockTournamentCreationViewModel extends Mock
    implements TournamentCreationViewModel {
  final _changeNotifier = ChangeNotifier();

  @override
  void addListener(VoidCallback listener) {
    _changeNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _changeNotifier.removeListener(listener);
  }

  @override
  void dispose() {
    _changeNotifier.dispose();
    // super.dispose(); // Removed
  }

  // Expose notifyListeners
  @override
  void notifyListeners() {
    _changeNotifier.notifyListeners();
  }
}

class MockGoRouter extends Mock implements GoRouter {}
