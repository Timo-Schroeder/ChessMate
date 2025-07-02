// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
            (identical(other.format, format) || other.format == format));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, startDate, endDate, format);

  @override
  String toString() {
    return 'Tournament(id: $id, name: $name, startDate: $startDate, endDate: $endDate, format: $format)';
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
      TournamentFormat format});
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
    ));
  }
}

/// @nodoc

class _Tournament implements Tournament {
  const _Tournament(
      {this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.format});

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
            (identical(other.format, format) || other.format == format));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, startDate, endDate, format);

  @override
  String toString() {
    return 'Tournament(id: $id, name: $name, startDate: $startDate, endDate: $endDate, format: $format)';
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
      TournamentFormat format});
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
    ));
  }
}

// dart format on
