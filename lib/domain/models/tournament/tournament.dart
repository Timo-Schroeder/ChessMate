import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chessmate/domain/models/tournament/tournament_format.dart';

part 'tournament.freezed.dart';

@freezed
abstract class Tournament with _$Tournament {
  const factory Tournament({
    /// The unique identifier of the tournament.
    int? id,

    /// The name of the tournament.
    required String name,

    /// The start date of the tournament.
    required DateTime startDate,

    /// The end date of the tournament.
    required DateTime endDate,

    /// The format of the tournament, like Swiss or Round Robin (not yet implemented).
    required TournamentFormat format,

    /// Archive status of the tournament
    required bool isArchived,
  }) = _Tournament;
}
