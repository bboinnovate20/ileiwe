// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Club _$ClubFromJson(Map<String, dynamic> json) {
  return _Club.fromJson(json);
}

/// @nodoc
mixin _$Club {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  set imagePath(String value) => throw _privateConstructorUsedError;
  String get descriptionsOfClub => throw _privateConstructorUsedError;
  set descriptionsOfClub(String value) => throw _privateConstructorUsedError;
  KidInfo? get kidInfo => throw _privateConstructorUsedError;
  set kidInfo(KidInfo? value) => throw _privateConstructorUsedError;

  /// Serializes this Club to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubCopyWith<Club> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubCopyWith<$Res> {
  factory $ClubCopyWith(Club value, $Res Function(Club) then) =
      _$ClubCopyWithImpl<$Res, Club>;
  @useResult
  $Res call(
      {String id,
      String name,
      String imagePath,
      String descriptionsOfClub,
      KidInfo? kidInfo});

  $KidInfoCopyWith<$Res>? get kidInfo;
}

/// @nodoc
class _$ClubCopyWithImpl<$Res, $Val extends Club>
    implements $ClubCopyWith<$Res> {
  _$ClubCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? descriptionsOfClub = null,
    Object? kidInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionsOfClub: null == descriptionsOfClub
          ? _value.descriptionsOfClub
          : descriptionsOfClub // ignore: cast_nullable_to_non_nullable
              as String,
      kidInfo: freezed == kidInfo
          ? _value.kidInfo
          : kidInfo // ignore: cast_nullable_to_non_nullable
              as KidInfo?,
    ) as $Val);
  }

  /// Create a copy of Club
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
abstract class _$$ClubImplCopyWith<$Res> implements $ClubCopyWith<$Res> {
  factory _$$ClubImplCopyWith(
          _$ClubImpl value, $Res Function(_$ClubImpl) then) =
      __$$ClubImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String imagePath,
      String descriptionsOfClub,
      KidInfo? kidInfo});

  @override
  $KidInfoCopyWith<$Res>? get kidInfo;
}

/// @nodoc
class __$$ClubImplCopyWithImpl<$Res>
    extends _$ClubCopyWithImpl<$Res, _$ClubImpl>
    implements _$$ClubImplCopyWith<$Res> {
  __$$ClubImplCopyWithImpl(_$ClubImpl _value, $Res Function(_$ClubImpl) _then)
      : super(_value, _then);

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? descriptionsOfClub = null,
    Object? kidInfo = freezed,
  }) {
    return _then(_$ClubImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionsOfClub: null == descriptionsOfClub
          ? _value.descriptionsOfClub
          : descriptionsOfClub // ignore: cast_nullable_to_non_nullable
              as String,
      kidInfo: freezed == kidInfo
          ? _value.kidInfo
          : kidInfo // ignore: cast_nullable_to_non_nullable
              as KidInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubImpl with DiagnosticableTreeMixin implements _Club {
  _$ClubImpl(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.descriptionsOfClub,
      this.kidInfo});

  factory _$ClubImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubImplFromJson(json);

  @override
  String id;
  @override
  String name;
  @override
  String imagePath;
  @override
  String descriptionsOfClub;
  @override
  KidInfo? kidInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Club(id: $id, name: $name, imagePath: $imagePath, descriptionsOfClub: $descriptionsOfClub, kidInfo: $kidInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Club'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('descriptionsOfClub', descriptionsOfClub))
      ..add(DiagnosticsProperty('kidInfo', kidInfo));
  }

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubImplCopyWith<_$ClubImpl> get copyWith =>
      __$$ClubImplCopyWithImpl<_$ClubImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubImplToJson(
      this,
    );
  }
}

abstract class _Club implements Club {
  factory _Club(
      {required String id,
      required String name,
      required String imagePath,
      required String descriptionsOfClub,
      KidInfo? kidInfo}) = _$ClubImpl;

  factory _Club.fromJson(Map<String, dynamic> json) = _$ClubImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  String get imagePath;
  set imagePath(String value);
  @override
  String get descriptionsOfClub;
  set descriptionsOfClub(String value);
  @override
  KidInfo? get kidInfo;
  set kidInfo(KidInfo? value);

  /// Create a copy of Club
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubImplCopyWith<_$ClubImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
