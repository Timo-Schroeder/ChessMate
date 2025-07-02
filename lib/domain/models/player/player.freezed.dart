// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Player {
  PlayerId? get id;
  String get firstName;
  String get lastName;
  DateTime get dateOfBirth;
  String get club;
  int? get nationalRating;
  int? get elo;
  FideTitle? get title;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<Player> get copyWith =>
      _$PlayerCopyWithImpl<Player>(this as Player, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Player &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.club, club) || other.club == club) &&
            (identical(other.nationalRating, nationalRating) ||
                other.nationalRating == nationalRating) &&
            (identical(other.elo, elo) || other.elo == elo) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      dateOfBirth, club, nationalRating, elo, title);

  @override
  String toString() {
    return 'Player(id: $id, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, club: $club, nationalRating: $nationalRating, elo: $elo, title: $title)';
  }
}

/// @nodoc
abstract mixin class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) _then) =
      _$PlayerCopyWithImpl;
  @useResult
  $Res call(
      {PlayerId? id,
      String firstName,
      String lastName,
      DateTime dateOfBirth,
      String club,
      int? nationalRating,
      int? elo,
      FideTitle? title});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._self, this._then);

  final Player _self;
  final $Res Function(Player) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? club = null,
    Object? nationalRating = freezed,
    Object? elo = freezed,
    Object? title = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as PlayerId?,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      club: null == club
          ? _self.club
          : club // ignore: cast_nullable_to_non_nullable
              as String,
      nationalRating: freezed == nationalRating
          ? _self.nationalRating
          : nationalRating // ignore: cast_nullable_to_non_nullable
              as int?,
      elo: freezed == elo
          ? _self.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as FideTitle?,
    ));
  }
}

/// @nodoc

class _Player implements Player {
  const _Player(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.club,
      this.nationalRating,
      this.elo,
      this.title});

  @override
  final PlayerId? id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final DateTime dateOfBirth;
  @override
  final String club;
  @override
  final int? nationalRating;
  @override
  final int? elo;
  @override
  final FideTitle? title;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Player &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.club, club) || other.club == club) &&
            (identical(other.nationalRating, nationalRating) ||
                other.nationalRating == nationalRating) &&
            (identical(other.elo, elo) || other.elo == elo) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      dateOfBirth, club, nationalRating, elo, title);

  @override
  String toString() {
    return 'Player(id: $id, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, club: $club, nationalRating: $nationalRating, elo: $elo, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) _then) =
      __$PlayerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PlayerId? id,
      String firstName,
      String lastName,
      DateTime dateOfBirth,
      String club,
      int? nationalRating,
      int? elo,
      FideTitle? title});
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(this._self, this._then);

  final _Player _self;
  final $Res Function(_Player) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? dateOfBirth = null,
    Object? club = null,
    Object? nationalRating = freezed,
    Object? elo = freezed,
    Object? title = freezed,
  }) {
    return _then(_Player(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as PlayerId?,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      club: null == club
          ? _self.club
          : club // ignore: cast_nullable_to_non_nullable
              as String,
      nationalRating: freezed == nationalRating
          ? _self.nationalRating
          : nationalRating // ignore: cast_nullable_to_non_nullable
              as int?,
      elo: freezed == elo
          ? _self.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as FideTitle?,
    ));
  }
}

// dart format on
