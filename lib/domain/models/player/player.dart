import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chessmate/domain/models/player/fide_title.dart';

part 'player.freezed.dart';

typedef PlayerId = int;

@freezed
abstract class Player with _$Player {
  const factory Player({
    PlayerId? id,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String club,
    int? nationalRating,
    int? elo,
    FideTitle? title,
  }) = _Player;
}
