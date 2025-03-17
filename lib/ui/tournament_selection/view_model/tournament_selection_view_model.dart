import 'package:chessmatey/data/repositories/tournament_repository.dart';
import 'package:chessmatey/domain/models/tournament/tournament.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tournament_selection_view_model.g.dart';

@riverpod
class TournamentSelectionViewModel extends _$TournamentSelectionViewModel {
  @override
  Future<IList<Tournament>> build() async {
    getAllTournaments();
  }

  Future<void> getAllTournaments() async {
    state = const AsyncLoading();
    final tournamentRepository = ref.read(tournamentRepositoryProvider);
    final tournaments = await tournamentRepository.getTournaments();
    tournaments.match(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncValue<IList<Tournament>>.data(r),
    );
  }

  void deleteTournament(int id) {
    return;
  }
}
