// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoinHistory _$CoinHistoryFromJson(Map<String, dynamic> json) {
  return _CoinHistory.fromJson(json);
}

/// @nodoc
mixin _$CoinHistory {
  String get title => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  int get coinEarned => throw _privateConstructorUsedError;

  /// Serializes this CoinHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinHistoryCopyWith<CoinHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinHistoryCopyWith<$Res> {
  factory $CoinHistoryCopyWith(
          CoinHistory value, $Res Function(CoinHistory) then) =
      _$CoinHistoryCopyWithImpl<$Res, CoinHistory>;
  @useResult
  $Res call({String title, String timestamp, int coinEarned});
}

/// @nodoc
class _$CoinHistoryCopyWithImpl<$Res, $Val extends CoinHistory>
    implements $CoinHistoryCopyWith<$Res> {
  _$CoinHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? timestamp = null,
    Object? coinEarned = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      coinEarned: null == coinEarned
          ? _value.coinEarned
          : coinEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinHistoryImplCopyWith<$Res>
    implements $CoinHistoryCopyWith<$Res> {
  factory _$$CoinHistoryImplCopyWith(
          _$CoinHistoryImpl value, $Res Function(_$CoinHistoryImpl) then) =
      __$$CoinHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String timestamp, int coinEarned});
}

/// @nodoc
class __$$CoinHistoryImplCopyWithImpl<$Res>
    extends _$CoinHistoryCopyWithImpl<$Res, _$CoinHistoryImpl>
    implements _$$CoinHistoryImplCopyWith<$Res> {
  __$$CoinHistoryImplCopyWithImpl(
      _$CoinHistoryImpl _value, $Res Function(_$CoinHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? timestamp = null,
    Object? coinEarned = null,
  }) {
    return _then(_$CoinHistoryImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      coinEarned: null == coinEarned
          ? _value.coinEarned
          : coinEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinHistoryImpl with DiagnosticableTreeMixin implements _CoinHistory {
  const _$CoinHistoryImpl(
      {required this.title, required this.timestamp, required this.coinEarned});

  factory _$CoinHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinHistoryImplFromJson(json);

  @override
  final String title;
  @override
  final String timestamp;
  @override
  final int coinEarned;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinHistory(title: $title, timestamp: $timestamp, coinEarned: $coinEarned)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinHistory'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('coinEarned', coinEarned));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinHistoryImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.coinEarned, coinEarned) ||
                other.coinEarned == coinEarned));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, timestamp, coinEarned);

  /// Create a copy of CoinHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinHistoryImplCopyWith<_$CoinHistoryImpl> get copyWith =>
      __$$CoinHistoryImplCopyWithImpl<_$CoinHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinHistoryImplToJson(
      this,
    );
  }
}

abstract class _CoinHistory implements CoinHistory {
  const factory _CoinHistory(
      {required final String title,
      required final String timestamp,
      required final int coinEarned}) = _$CoinHistoryImpl;

  factory _CoinHistory.fromJson(Map<String, dynamic> json) =
      _$CoinHistoryImpl.fromJson;

  @override
  String get title;
  @override
  String get timestamp;
  @override
  int get coinEarned;

  /// Create a copy of CoinHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinHistoryImplCopyWith<_$CoinHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
