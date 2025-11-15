// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  /// The unique identifier of the player.
  PlayerId? get id;

  /// The first name of the player.
  String get firstName;

  /// The last name of the player.
  String get lastName;

  /// The birthyear of the player.
  int get yearOfBirth;

  /// The gender of the player.
  Gender get gender;

  /// The national rating number of the player.
  int? get nationalRating;

  /// The elo rating of the player.
  int? get elo;

  /// The club of the player.
  String? get club;

  /// The FIDE title of the player.
  FideTitle? get title;

  /// States if the player is still participating in the tournament.
  bool get active;

  /// The tournament this player is tied to.
  int get tournamentId;

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
            (identical(other.yearOfBirth, yearOfBirth) ||
                other.yearOfBirth == yearOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nationalRating, nationalRating) ||
                other.nationalRating == nationalRating) &&
            (identical(other.elo, elo) || other.elo == elo) &&
            (identical(other.club, club) || other.club == club) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.tournamentId, tournamentId) ||
                other.tournamentId == tournamentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      yearOfBirth,
      gender,
      nationalRating,
      elo,
      club,
      title,
      active,
      tournamentId);

  @override
  String toString() {
    return 'Player(id: $id, firstName: $firstName, lastName: $lastName, yearOfBirth: $yearOfBirth, gender: $gender, nationalRating: $nationalRating, elo: $elo, club: $club, title: $title, active: $active, tournamentId: $tournamentId)';
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
      int yearOfBirth,
      Gender gender,
      int? nationalRating,
      int? elo,
      String? club,
      FideTitle? title,
      bool active,
      int tournamentId});
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
    Object? yearOfBirth = null,
    Object? gender = null,
    Object? nationalRating = freezed,
    Object? elo = freezed,
    Object? club = freezed,
    Object? title = freezed,
    Object? active = null,
    Object? tournamentId = null,
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
      yearOfBirth: null == yearOfBirth
          ? _self.yearOfBirth
          : yearOfBirth // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      nationalRating: freezed == nationalRating
          ? _self.nationalRating
          : nationalRating // ignore: cast_nullable_to_non_nullable
              as int?,
      elo: freezed == elo
          ? _self.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int?,
      club: freezed == club
          ? _self.club
          : club // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as FideTitle?,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      tournamentId: null == tournamentId
          ? _self.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Player].
extension PlayerPatterns on Player {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Player value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Player() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Player value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Player():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Player value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Player() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            PlayerId? id,
            String firstName,
            String lastName,
            int yearOfBirth,
            Gender gender,
            int? nationalRating,
            int? elo,
            String? club,
            FideTitle? title,
            bool active,
            int tournamentId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Player() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.yearOfBirth,
            _that.gender,
            _that.nationalRating,
            _that.elo,
            _that.club,
            _that.title,
            _that.active,
            _that.tournamentId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            PlayerId? id,
            String firstName,
            String lastName,
            int yearOfBirth,
            Gender gender,
            int? nationalRating,
            int? elo,
            String? club,
            FideTitle? title,
            bool active,
            int tournamentId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Player():
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.yearOfBirth,
            _that.gender,
            _that.nationalRating,
            _that.elo,
            _that.club,
            _that.title,
            _that.active,
            _that.tournamentId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            PlayerId? id,
            String firstName,
            String lastName,
            int yearOfBirth,
            Gender gender,
            int? nationalRating,
            int? elo,
            String? club,
            FideTitle? title,
            bool active,
            int tournamentId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Player() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.yearOfBirth,
            _that.gender,
            _that.nationalRating,
            _that.elo,
            _that.club,
            _that.title,
            _that.active,
            _that.tournamentId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Player implements Player {
  const _Player(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.yearOfBirth,
      required this.gender,
      this.nationalRating,
      this.elo,
      this.club,
      this.title,
      required this.active,
      required this.tournamentId});

  /// The unique identifier of the player.
  @override
  final PlayerId? id;

  /// The first name of the player.
  @override
  final String firstName;

  /// The last name of the player.
  @override
  final String lastName;

  /// The birthyear of the player.
  @override
  final int yearOfBirth;

  /// The gender of the player.
  @override
  final Gender gender;

  /// The national rating number of the player.
  @override
  final int? nationalRating;

  /// The elo rating of the player.
  @override
  final int? elo;

  /// The club of the player.
  @override
  final String? club;

  /// The FIDE title of the player.
  @override
  final FideTitle? title;

  /// States if the player is still participating in the tournament.
  @override
  final bool active;

  /// The tournament this player is tied to.
  @override
  final int tournamentId;

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
            (identical(other.yearOfBirth, yearOfBirth) ||
                other.yearOfBirth == yearOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nationalRating, nationalRating) ||
                other.nationalRating == nationalRating) &&
            (identical(other.elo, elo) || other.elo == elo) &&
            (identical(other.club, club) || other.club == club) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.tournamentId, tournamentId) ||
                other.tournamentId == tournamentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      yearOfBirth,
      gender,
      nationalRating,
      elo,
      club,
      title,
      active,
      tournamentId);

  @override
  String toString() {
    return 'Player(id: $id, firstName: $firstName, lastName: $lastName, yearOfBirth: $yearOfBirth, gender: $gender, nationalRating: $nationalRating, elo: $elo, club: $club, title: $title, active: $active, tournamentId: $tournamentId)';
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
      int yearOfBirth,
      Gender gender,
      int? nationalRating,
      int? elo,
      String? club,
      FideTitle? title,
      bool active,
      int tournamentId});
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
    Object? yearOfBirth = null,
    Object? gender = null,
    Object? nationalRating = freezed,
    Object? elo = freezed,
    Object? club = freezed,
    Object? title = freezed,
    Object? active = null,
    Object? tournamentId = null,
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
      yearOfBirth: null == yearOfBirth
          ? _self.yearOfBirth
          : yearOfBirth // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      nationalRating: freezed == nationalRating
          ? _self.nationalRating
          : nationalRating // ignore: cast_nullable_to_non_nullable
              as int?,
      elo: freezed == elo
          ? _self.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int?,
      club: freezed == club
          ? _self.club
          : club // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as FideTitle?,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      tournamentId: null == tournamentId
          ? _self.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
