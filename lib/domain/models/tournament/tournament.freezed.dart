// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tournament {
  /// The unique identifier of the tournament.
  int? get id;

  /// The name of the tournament.
  String get name;

  /// The start date of the tournament.
  DateTime get startDate;

  /// The end date of the tournament.
  DateTime get endDate;

  /// The format of the tournament, like Swiss or Round Robin (not yet implemented).
  TournamentFormat get format;

  /// Archive status of the tournament
  bool get isArchived;

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TournamentCopyWith<Tournament> get copyWith =>
      _$TournamentCopyWithImpl<Tournament>(this as Tournament, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Tournament &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, startDate, endDate, format, isArchived);

  @override
  String toString() {
    return 'Tournament(id: $id, name: $name, startDate: $startDate, endDate: $endDate, format: $format, isArchived: $isArchived)';
  }
}

/// @nodoc
abstract mixin class $TournamentCopyWith<$Res> {
  factory $TournamentCopyWith(
          Tournament value, $Res Function(Tournament) _then) =
      _$TournamentCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String name,
      DateTime startDate,
      DateTime endDate,
      TournamentFormat format,
      bool isArchived});
}

/// @nodoc
class _$TournamentCopyWithImpl<$Res> implements $TournamentCopyWith<$Res> {
  _$TournamentCopyWithImpl(this._self, this._then);

  final Tournament _self;
  final $Res Function(Tournament) _then;

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? format = null,
    Object? isArchived = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as TournamentFormat,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Tournament].
extension TournamentPatterns on Tournament {
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
    TResult Function(_Tournament value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Tournament() when $default != null:
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
    TResult Function(_Tournament value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tournament():
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
    TResult? Function(_Tournament value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tournament() when $default != null:
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
    TResult Function(int? id, String name, DateTime startDate, DateTime endDate,
            TournamentFormat format, bool isArchived)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Tournament() when $default != null:
        return $default(_that.id, _that.name, _that.startDate, _that.endDate,
            _that.format, _that.isArchived);
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
    TResult Function(int? id, String name, DateTime startDate, DateTime endDate,
            TournamentFormat format, bool isArchived)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tournament():
        return $default(_that.id, _that.name, _that.startDate, _that.endDate,
            _that.format, _that.isArchived);
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
    TResult? Function(int? id, String name, DateTime startDate,
            DateTime endDate, TournamentFormat format, bool isArchived)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Tournament() when $default != null:
        return $default(_that.id, _that.name, _that.startDate, _that.endDate,
            _that.format, _that.isArchived);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Tournament implements Tournament {
  const _Tournament(
      {this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.format,
      required this.isArchived});

  /// The unique identifier of the tournament.
  @override
  final int? id;

  /// The name of the tournament.
  @override
  final String name;

  /// The start date of the tournament.
  @override
  final DateTime startDate;

  /// The end date of the tournament.
  @override
  final DateTime endDate;

  /// The format of the tournament, like Swiss or Round Robin (not yet implemented).
  @override
  final TournamentFormat format;

  /// Archive status of the tournament
  @override
  final bool isArchived;

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TournamentCopyWith<_Tournament> get copyWith =>
      __$TournamentCopyWithImpl<_Tournament>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tournament &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, startDate, endDate, format, isArchived);

  @override
  String toString() {
    return 'Tournament(id: $id, name: $name, startDate: $startDate, endDate: $endDate, format: $format, isArchived: $isArchived)';
  }
}

/// @nodoc
abstract mixin class _$TournamentCopyWith<$Res>
    implements $TournamentCopyWith<$Res> {
  factory _$TournamentCopyWith(
          _Tournament value, $Res Function(_Tournament) _then) =
      __$TournamentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      DateTime startDate,
      DateTime endDate,
      TournamentFormat format,
      bool isArchived});
}

/// @nodoc
class __$TournamentCopyWithImpl<$Res> implements _$TournamentCopyWith<$Res> {
  __$TournamentCopyWithImpl(this._self, this._then);

  final _Tournament _self;
  final $Res Function(_Tournament) _then;

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? format = null,
    Object? isArchived = null,
  }) {
    return _then(_Tournament(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      format: null == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as TournamentFormat,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
