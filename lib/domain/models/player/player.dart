import 'package:freezed_annotation/freezed_annotation.dart';

import 'fide_title.dart';

part 'player.freezed.dart';

typedef PlayerId = int;

@freezed
class Player with _$Player {
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
