import 'package:chessmate/domain/models/player/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chessmate/domain/models/player/fide_title.dart';

part 'player.freezed.dart';

typedef PlayerId = int;

@freezed
abstract class Player with _$Player {
  const factory Player({
    /// The unique identifier of the player.
    PlayerId? id,

    /// The first name of the player.
    required String firstName,

    /// The last name of the player.
    required String lastName,

    /// The birthyear of the player.
    required int yearOfBirth,

    /// The gender of the player.
    required Gender gender,

    /// The national rating number of the player.
    int? nationalRating,

    /// The elo rating of the player.
    int? elo,

    /// The club of the player.
    String? club,

    /// The FIDE title of the player.
    required FideTitle title,

    /// States if the player is still participating in the tournament.
    required bool active,

    /// The tournament this player is tied to.
    required int tournamentId,
  }) = _Player;
}
