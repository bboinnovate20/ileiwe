// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDetailInfo _$UserDetailInfoFromJson(Map<String, dynamic> json) {
  return _UserDetailInfo.fromJson(json);
}

/// @nodoc
mixin _$UserDetailInfo {
  bool get isAuthenticated => throw _privateConstructorUsedError;
  set isAuthenticated(bool value) => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  set userId(String value) => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  set firstName(String value) => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  set lastName(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String value) => throw _privateConstructorUsedError;
  bool get isPhoneNumberVerified => throw _privateConstructorUsedError;
  set isPhoneNumberVerified(bool value) => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  set isEmailVerified(bool value) => throw _privateConstructorUsedError;
  KidInfo? get kidInfo => throw _privateConstructorUsedError;
  set kidInfo(KidInfo? value) => throw _privateConstructorUsedError;

  /// Serializes this UserDetailInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailInfoCopyWith<UserDetailInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailInfoCopyWith<$Res> {
  factory $UserDetailInfoCopyWith(
          UserDetailInfo value, $Res Function(UserDetailInfo) then) =
      _$UserDetailInfoCopyWithImpl<$Res, UserDetailInfo>;
  @useResult
  $Res call(
      {bool isAuthenticated,
      String userId,
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      bool isPhoneNumberVerified,
      bool isEmailVerified,
      KidInfo? kidInfo});

  $KidInfoCopyWith<$Res>? get kidInfo;
}

/// @nodoc
class _$UserDetailInfoCopyWithImpl<$Res, $Val extends UserDetailInfo>
    implements $UserDetailInfoCopyWith<$Res> {
  _$UserDetailInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticated = null,
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? isPhoneNumberVerified = null,
    Object? isEmailVerified = null,
    Object? kidInfo = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isPhoneNumberVerified: null == isPhoneNumberVerified
          ? _value.isPhoneNumberVerified
          : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      kidInfo: freezed == kidInfo
          ? _value.kidInfo
          : kidInfo // ignore: cast_nullable_to_non_nullable
              as KidInfo?,
    ) as $Val);
  }

  /// Create a copy of UserDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KidInfoCopyWith<$Res>? get kidInfo {
    if (_value.kidInfo == null) {
      return null;
    }

    return $KidInfoCopyWith<$Res>(_value.kidInfo!, (value) {
      return _then(_value.copyWith(kidInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDetailInfoImplCopyWith<$Res>
    implements $UserDetailInfoCopyWith<$Res> {
  factory _$$UserDetailInfoImplCopyWith(_$UserDetailInfoImpl value,
          $Res Function(_$UserDetailInfoImpl) then) =
      __$$UserDetailInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAuthenticated,
      String userId,
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      bool isPhoneNumberVerified,
      bool isEmailVerified,
      KidInfo? kidInfo});

  @override
  $KidInfoCopyWith<$Res>? get kidInfo;
}

/// @nodoc
class __$$UserDetailInfoImplCopyWithImpl<$Res>
    extends _$UserDetailInfoCopyWithImpl<$Res, _$UserDetailInfoImpl>
    implements _$$UserDetailInfoImplCopyWith<$Res> {
  __$$UserDetailInfoImplCopyWithImpl(
      _$UserDetailInfoImpl _value, $Res Function(_$UserDetailInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticated = null,
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? isPhoneNumberVerified = null,
    Object? isEmailVerified = null,
    Object? kidInfo = freezed,
  }) {
    return _then(_$UserDetailInfoImpl(
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isPhoneNumberVerified: null == isPhoneNumberVerified
          ? _value.isPhoneNumberVerified
          : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      kidInfo: freezed == kidInfo
          ? _value.kidInfo
          : kidInfo // ignore: cast_nullable_to_non_nullable
              as KidInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailInfoImpl
    with DiagnosticableTreeMixin
    implements _UserDetailInfo {
  _$UserDetailInfoImpl(
      {required this.isAuthenticated,
      required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.isPhoneNumberVerified,
      required this.isEmailVerified,
      this.kidInfo});

  factory _$UserDetailInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailInfoImplFromJson(json);

  @override
  bool isAuthenticated;
  @override
  String userId;
  @override
  String firstName;
  @override
  String lastName;
  @override
  String email;
  @override
  String phoneNumber;
  @override
  bool isPhoneNumberVerified;
  @override
  bool isEmailVerified;
  @override
  KidInfo? kidInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDetailInfo(isAuthenticated: $isAuthenticated, userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, isPhoneNumberVerified: $isPhoneNumberVerified, isEmailVerified: $isEmailVerified, kidInfo: $kidInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDetailInfo'))
      ..add(DiagnosticsProperty('isAuthenticated', isAuthenticated))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('isPhoneNumberVerified', isPhoneNumberVerified))
      ..add(DiagnosticsProperty('isEmailVerified', isEmailVerified))
      ..add(DiagnosticsProperty('kidInfo', kidInfo));
  }

  /// Create a copy of UserDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailInfoImplCopyWith<_$UserDetailInfoImpl> get copyWith =>
      __$$UserDetailInfoImplCopyWithImpl<_$UserDetailInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailInfoImplToJson(
      this,
    );
  }
}

abstract class _UserDetailInfo implements UserDetailInfo {
  factory _UserDetailInfo(
      {required bool isAuthenticated,
      required String userId,
      required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required bool isPhoneNumberVerified,
      required bool isEmailVerified,
      KidInfo? kidInfo}) = _$UserDetailInfoImpl;

  factory _UserDetailInfo.fromJson(Map<String, dynamic> json) =
      _$UserDetailInfoImpl.fromJson;

  @override
  bool get isAuthenticated;
  set isAuthenticated(bool value);
  @override
  String get userId;
  set userId(String value);
  @override
  String get firstName;
  set firstName(String value);
  @override
  String get lastName;
  set lastName(String value);
  @override
  String get email;
  set email(String value);
  @override
  String get phoneNumber;
  set phoneNumber(String value);
  @override
  bool get isPhoneNumberVerified;
  set isPhoneNumberVerified(bool value);
  @override
  bool get isEmailVerified;
  set isEmailVerified(bool value);
  @override
  KidInfo? get kidInfo;
  set kidInfo(KidInfo? value);

  /// Create a copy of UserDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailInfoImplCopyWith<_$UserDetailInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
