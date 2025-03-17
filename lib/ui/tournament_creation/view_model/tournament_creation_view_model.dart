import 'package:chessmatey/domain/models/tournament/tournament.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tournament_creation_view_model.g.dart';

@riverpod
class TournamentCreationViewModel extends _$TournamentCreationViewModel {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> createTournament(Tournament tournament) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => Future.value());
  }
}
