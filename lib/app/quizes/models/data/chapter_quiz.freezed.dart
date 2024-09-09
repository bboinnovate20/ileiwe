// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChapterQuiz _$ChapterQuizFromJson(Map<String, dynamic> json) {
  return _ChapterQuiz.fromJson(json);
}

/// @nodoc
mixin _$ChapterQuiz {
  int get id => throw _privateConstructorUsedError;
  int get totalQuestions => throw _privateConstructorUsedError;
  int get coinEarnedPerQuiz => throw _privateConstructorUsedError;

  /// Serializes this ChapterQuiz to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapterQuiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterQuizCopyWith<ChapterQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterQuizCopyWith<$Res> {
  factory $ChapterQuizCopyWith(
          ChapterQuiz value, $Res Function(ChapterQuiz) then) =
      _$ChapterQuizCopyWithImpl<$Res, ChapterQuiz>;
  @useResult
  $Res call({int id, int totalQuestions, int coinEarnedPerQuiz});
}

/// @nodoc
class _$ChapterQuizCopyWithImpl<$Res, $Val extends ChapterQuiz>
    implements $ChapterQuizCopyWith<$Res> {
  _$ChapterQuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterQuiz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalQuestions = null,
    Object? coinEarnedPerQuiz = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      coinEarnedPerQuiz: null == coinEarnedPerQuiz
          ? _value.coinEarnedPerQuiz
          : coinEarnedPerQuiz // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterQuizImplCopyWith<$Res>
    implements $ChapterQuizCopyWith<$Res> {
  factory _$$ChapterQuizImplCopyWith(
          _$ChapterQuizImpl value, $Res Function(_$ChapterQuizImpl) then) =
      __$$ChapterQuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int totalQuestions, int coinEarnedPerQuiz});
}

/// @nodoc
class __$$ChapterQuizImplCopyWithImpl<$Res>
    extends _$ChapterQuizCopyWithImpl<$Res, _$ChapterQuizImpl>
    implements _$$ChapterQuizImplCopyWith<$Res> {
  __$$ChapterQuizImplCopyWithImpl(
      _$ChapterQuizImpl _value, $Res Function(_$ChapterQuizImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChapterQuiz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalQuestions = null,
    Object? coinEarnedPerQuiz = null,
  }) {
    return _then(_$ChapterQuizImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      coinEarnedPerQuiz: null == coinEarnedPerQuiz
          ? _value.coinEarnedPerQuiz
          : coinEarnedPerQuiz // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterQuizImpl with DiagnosticableTreeMixin implements _ChapterQuiz {
  const _$ChapterQuizImpl(
      {required this.id,
      required this.totalQuestions,
      required this.coinEarnedPerQuiz});

  factory _$ChapterQuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterQuizImplFromJson(json);

  @override
  final int id;
  @override
  final int totalQuestions;
  @override
  final int coinEarnedPerQuiz;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChapterQuiz(id: $id, totalQuestions: $totalQuestions, coinEarnedPerQuiz: $coinEarnedPerQuiz)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChapterQuiz'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('totalQuestions', totalQuestions))
      ..add(DiagnosticsProperty('coinEarnedPerQuiz', coinEarnedPerQuiz));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterQuizImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.coinEarnedPerQuiz, coinEarnedPerQuiz) ||
                other.coinEarnedPerQuiz == coinEarnedPerQuiz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, totalQuestions, coinEarnedPerQuiz);

  /// Create a copy of ChapterQuiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterQuizImplCopyWith<_$ChapterQuizImpl> get copyWith =>
      __$$ChapterQuizImplCopyWithImpl<_$ChapterQuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterQuizImplToJson(
      this,
    );
  }
}

abstract class _ChapterQuiz implements ChapterQuiz {
  const factory _ChapterQuiz(
      {required final int id,
      required final int totalQuestions,
      required final int coinEarnedPerQuiz}) = _$ChapterQuizImpl;

  factory _ChapterQuiz.fromJson(Map<String, dynamic> json) =
      _$ChapterQuizImpl.fromJson;

  @override
  int get id;
  @override
  int get totalQuestions;
  @override
  int get coinEarnedPerQuiz;

  /// Create a copy of ChapterQuiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterQuizImplCopyWith<_$ChapterQuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
