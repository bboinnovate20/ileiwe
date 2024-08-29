// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kid_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KidInfo _$KidInfoFromJson(Map<String, dynamic> json) {
  return _KidInfo.fromJson(json);
}

/// @nodoc
mixin _$KidInfo {
  String get userId => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get hobby => throw _privateConstructorUsedError;
  String? get favoriteSubject => throw _privateConstructorUsedError;
  String? get interestSubject => throw _privateConstructorUsedError;
  String? get challengingSubject => throw _privateConstructorUsedError;
  String? get benefit => throw _privateConstructorUsedError;

  /// Serializes this KidInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KidInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KidInfoCopyWith<KidInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KidInfoCopyWith<$Res> {
  factory $KidInfoCopyWith(KidInfo value, $Res Function(KidInfo) then) =
      _$KidInfoCopyWithImpl<$Res, KidInfo>;
  @useResult
  $Res call(
      {String userId,
      String age,
      String hobby,
      String? favoriteSubject,
      String? interestSubject,
      String? challengingSubject,
      String? benefit});
}

/// @nodoc
class _$KidInfoCopyWithImpl<$Res, $Val extends KidInfo>
    implements $KidInfoCopyWith<$Res> {
  _$KidInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KidInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? age = null,
    Object? hobby = null,
    Object? favoriteSubject = freezed,
    Object? interestSubject = freezed,
    Object? challengingSubject = freezed,
    Object? benefit = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      hobby: null == hobby
          ? _value.hobby
          : hobby // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteSubject: freezed == favoriteSubject
          ? _value.favoriteSubject
          : favoriteSubject // ignore: cast_nullable_to_non_nullable
              as String?,
      interestSubject: freezed == interestSubject
          ? _value.interestSubject
          : interestSubject // ignore: cast_nullable_to_non_nullable
              as String?,
      challengingSubject: freezed == challengingSubject
          ? _value.challengingSubject
          : challengingSubject // ignore: cast_nullable_to_non_nullable
              as String?,
      benefit: freezed == benefit
          ? _value.benefit
          : benefit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KidInfoImplCopyWith<$Res> implements $KidInfoCopyWith<$Res> {
  factory _$$KidInfoImplCopyWith(
          _$KidInfoImpl value, $Res Function(_$KidInfoImpl) then) =
      __$$KidInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String age,
      String hobby,
      String? favoriteSubject,
      String? interestSubject,
      String? challengingSubject,
      String? benefit});
}

/// @nodoc
class __$$KidInfoImplCopyWithImpl<$Res>
    extends _$KidInfoCopyWithImpl<$Res, _$KidInfoImpl>
    implements _$$KidInfoImplCopyWith<$Res> {
  __$$KidInfoImplCopyWithImpl(
      _$KidInfoImpl _value, $Res Function(_$KidInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of KidInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? age = null,
    Object? hobby = null,
    Object? favoriteSubject = freezed,
    Object? interestSubject = freezed,
    Object? challengingSubject = freezed,
    Object? benefit = freezed,
  }) {
    return _then(_$KidInfoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      hobby: null == hobby
          ? _value.hobby
          : hobby // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteSubject: freezed == favoriteSubject
          ? _value.favoriteSubject
          : favoriteSubject // ignore: cast_nullable_to_non_nullable
              as String?,
      interestSubject: freezed == interestSubject
          ? _value.interestSubject
          : interestSubject // ignore: cast_nullable_to_non_nullable
              as String?,
      challengingSubject: freezed == challengingSubject
          ? _value.challengingSubject
          : challengingSubject // ignore: cast_nullable_to_non_nullable
              as String?,
      benefit: freezed == benefit
          ? _value.benefit
          : benefit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KidInfoImpl with DiagnosticableTreeMixin implements _KidInfo {
  const _$KidInfoImpl(
      {required this.userId,
      required this.age,
      required this.hobby,
      required this.favoriteSubject,
      required this.interestSubject,
      required this.challengingSubject,
      required this.benefit});

  factory _$KidInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$KidInfoImplFromJson(json);

  @override
  final String userId;
  @override
  final String age;
  @override
  final String hobby;
  @override
  final String? favoriteSubject;
  @override
  final String? interestSubject;
  @override
  final String? challengingSubject;
  @override
  final String? benefit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KidInfo(userId: $userId, age: $age, hobby: $hobby, favoriteSubject: $favoriteSubject, interestSubject: $interestSubject, challengingSubject: $challengingSubject, benefit: $benefit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KidInfo'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('hobby', hobby))
      ..add(DiagnosticsProperty('favoriteSubject', favoriteSubject))
      ..add(DiagnosticsProperty('interestSubject', interestSubject))
      ..add(DiagnosticsProperty('challengingSubject', challengingSubject))
      ..add(DiagnosticsProperty('benefit', benefit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KidInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.hobby, hobby) || other.hobby == hobby) &&
            (identical(other.favoriteSubject, favoriteSubject) ||
                other.favoriteSubject == favoriteSubject) &&
            (identical(other.interestSubject, interestSubject) ||
                other.interestSubject == interestSubject) &&
            (identical(other.challengingSubject, challengingSubject) ||
                other.challengingSubject == challengingSubject) &&
            (identical(other.benefit, benefit) || other.benefit == benefit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, age, hobby,
      favoriteSubject, interestSubject, challengingSubject, benefit);

  /// Create a copy of KidInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KidInfoImplCopyWith<_$KidInfoImpl> get copyWith =>
      __$$KidInfoImplCopyWithImpl<_$KidInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KidInfoImplToJson(
      this,
    );
  }
}

abstract class _KidInfo implements KidInfo {
  const factory _KidInfo(
      {required final String userId,
      required final String age,
      required final String hobby,
      required final String? favoriteSubject,
      required final String? interestSubject,
      required final String? challengingSubject,
      required final String? benefit}) = _$KidInfoImpl;

  factory _KidInfo.fromJson(Map<String, dynamic> json) = _$KidInfoImpl.fromJson;

  @override
  String get userId;
  @override
  String get age;
  @override
  String get hobby;
  @override
  String? get favoriteSubject;
  @override
  String? get interestSubject;
  @override
  String? get challengingSubject;
  @override
  String? get benefit;

  /// Create a copy of KidInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KidInfoImplCopyWith<_$KidInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
