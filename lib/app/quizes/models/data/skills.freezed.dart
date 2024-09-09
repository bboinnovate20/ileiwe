// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SkillsLearning _$SkillsLearningFromJson(Map<String, dynamic> json) {
  return _SkillsLearning.fromJson(json);
}

/// @nodoc
mixin _$SkillsLearning {
  String get id => throw _privateConstructorUsedError;
  int get totalChapters => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this SkillsLearning to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillsLearning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillsLearningCopyWith<SkillsLearning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillsLearningCopyWith<$Res> {
  factory $SkillsLearningCopyWith(
          SkillsLearning value, $Res Function(SkillsLearning) then) =
      _$SkillsLearningCopyWithImpl<$Res, SkillsLearning>;
  @useResult
  $Res call({String id, int totalChapters, String name});
}

/// @nodoc
class _$SkillsLearningCopyWithImpl<$Res, $Val extends SkillsLearning>
    implements $SkillsLearningCopyWith<$Res> {
  _$SkillsLearningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillsLearning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalChapters = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalChapters: null == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillsLearningImplCopyWith<$Res>
    implements $SkillsLearningCopyWith<$Res> {
  factory _$$SkillsLearningImplCopyWith(_$SkillsLearningImpl value,
          $Res Function(_$SkillsLearningImpl) then) =
      __$$SkillsLearningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int totalChapters, String name});
}

/// @nodoc
class __$$SkillsLearningImplCopyWithImpl<$Res>
    extends _$SkillsLearningCopyWithImpl<$Res, _$SkillsLearningImpl>
    implements _$$SkillsLearningImplCopyWith<$Res> {
  __$$SkillsLearningImplCopyWithImpl(
      _$SkillsLearningImpl _value, $Res Function(_$SkillsLearningImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillsLearning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalChapters = null,
    Object? name = null,
  }) {
    return _then(_$SkillsLearningImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalChapters: null == totalChapters
          ? _value.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillsLearningImpl
    with DiagnosticableTreeMixin
    implements _SkillsLearning {
  const _$SkillsLearningImpl(
      {required this.id, required this.totalChapters, required this.name});

  factory _$SkillsLearningImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillsLearningImplFromJson(json);

  @override
  final String id;
  @override
  final int totalChapters;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillsLearning(id: $id, totalChapters: $totalChapters, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SkillsLearning'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('totalChapters', totalChapters))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillsLearningImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalChapters, totalChapters) ||
                other.totalChapters == totalChapters) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, totalChapters, name);

  /// Create a copy of SkillsLearning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillsLearningImplCopyWith<_$SkillsLearningImpl> get copyWith =>
      __$$SkillsLearningImplCopyWithImpl<_$SkillsLearningImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillsLearningImplToJson(
      this,
    );
  }
}

abstract class _SkillsLearning implements SkillsLearning {
  const factory _SkillsLearning(
      {required final String id,
      required final int totalChapters,
      required final String name}) = _$SkillsLearningImpl;

  factory _SkillsLearning.fromJson(Map<String, dynamic> json) =
      _$SkillsLearningImpl.fromJson;

  @override
  String get id;
  @override
  int get totalChapters;
  @override
  String get name;

  /// Create a copy of SkillsLearning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillsLearningImplCopyWith<_$SkillsLearningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
