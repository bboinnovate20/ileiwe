// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_library_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ELibraryCategory _$ELibraryCategoryFromJson(Map<String, dynamic> json) {
  return _ELibraryCategory.fromJson(json);
}

/// @nodoc
mixin _$ELibraryCategory {
  String get id => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  int get numberOfBooks => throw _privateConstructorUsedError;
  String get libraryId => throw _privateConstructorUsedError;

  /// Serializes this ELibraryCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ELibraryCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ELibraryCategoryCopyWith<ELibraryCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ELibraryCategoryCopyWith<$Res> {
  factory $ELibraryCategoryCopyWith(
          ELibraryCategory value, $Res Function(ELibraryCategory) then) =
      _$ELibraryCategoryCopyWithImpl<$Res, ELibraryCategory>;
  @useResult
  $Res call(
      {String id,
      String categoryName,
      String imagePath,
      int numberOfBooks,
      String libraryId});
}

/// @nodoc
class _$ELibraryCategoryCopyWithImpl<$Res, $Val extends ELibraryCategory>
    implements $ELibraryCategoryCopyWith<$Res> {
  _$ELibraryCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ELibraryCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
    Object? imagePath = null,
    Object? numberOfBooks = null,
    Object? libraryId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfBooks: null == numberOfBooks
          ? _value.numberOfBooks
          : numberOfBooks // ignore: cast_nullable_to_non_nullable
              as int,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ELibraryCategoryImplCopyWith<$Res>
    implements $ELibraryCategoryCopyWith<$Res> {
  factory _$$ELibraryCategoryImplCopyWith(_$ELibraryCategoryImpl value,
          $Res Function(_$ELibraryCategoryImpl) then) =
      __$$ELibraryCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String categoryName,
      String imagePath,
      int numberOfBooks,
      String libraryId});
}

/// @nodoc
class __$$ELibraryCategoryImplCopyWithImpl<$Res>
    extends _$ELibraryCategoryCopyWithImpl<$Res, _$ELibraryCategoryImpl>
    implements _$$ELibraryCategoryImplCopyWith<$Res> {
  __$$ELibraryCategoryImplCopyWithImpl(_$ELibraryCategoryImpl _value,
      $Res Function(_$ELibraryCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ELibraryCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
    Object? imagePath = null,
    Object? numberOfBooks = null,
    Object? libraryId = null,
  }) {
    return _then(_$ELibraryCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfBooks: null == numberOfBooks
          ? _value.numberOfBooks
          : numberOfBooks // ignore: cast_nullable_to_non_nullable
              as int,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ELibraryCategoryImpl
    with DiagnosticableTreeMixin
    implements _ELibraryCategory {
  const _$ELibraryCategoryImpl(
      {required this.id,
      required this.categoryName,
      required this.imagePath,
      required this.numberOfBooks,
      required this.libraryId});

  factory _$ELibraryCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ELibraryCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String categoryName;
  @override
  final String imagePath;
  @override
  final int numberOfBooks;
  @override
  final String libraryId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ELibraryCategory(id: $id, categoryName: $categoryName, imagePath: $imagePath, numberOfBooks: $numberOfBooks, libraryId: $libraryId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ELibraryCategory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('categoryName', categoryName))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('numberOfBooks', numberOfBooks))
      ..add(DiagnosticsProperty('libraryId', libraryId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ELibraryCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.numberOfBooks, numberOfBooks) ||
                other.numberOfBooks == numberOfBooks) &&
            (identical(other.libraryId, libraryId) ||
                other.libraryId == libraryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, categoryName, imagePath, numberOfBooks, libraryId);

  /// Create a copy of ELibraryCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ELibraryCategoryImplCopyWith<_$ELibraryCategoryImpl> get copyWith =>
      __$$ELibraryCategoryImplCopyWithImpl<_$ELibraryCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ELibraryCategoryImplToJson(
      this,
    );
  }
}

abstract class _ELibraryCategory implements ELibraryCategory {
  const factory _ELibraryCategory(
      {required final String id,
      required final String categoryName,
      required final String imagePath,
      required final int numberOfBooks,
      required final String libraryId}) = _$ELibraryCategoryImpl;

  factory _ELibraryCategory.fromJson(Map<String, dynamic> json) =
      _$ELibraryCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get categoryName;
  @override
  String get imagePath;
  @override
  int get numberOfBooks;
  @override
  String get libraryId;

  /// Create a copy of ELibraryCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ELibraryCategoryImplCopyWith<_$ELibraryCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ESkitCategory _$ESkitCategoryFromJson(Map<String, dynamic> json) {
  return _ESkitCategory.fromJson(json);
}

/// @nodoc
mixin _$ESkitCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  int get numberOfSkit => throw _privateConstructorUsedError;
  String get libraryId => throw _privateConstructorUsedError;

  /// Serializes this ESkitCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ESkitCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ESkitCategoryCopyWith<ESkitCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ESkitCategoryCopyWith<$Res> {
  factory $ESkitCategoryCopyWith(
          ESkitCategory value, $Res Function(ESkitCategory) then) =
      _$ESkitCategoryCopyWithImpl<$Res, ESkitCategory>;
  @useResult
  $Res call(
      {String id,
      String name,
      String imagePath,
      int numberOfSkit,
      String libraryId});
}

/// @nodoc
class _$ESkitCategoryCopyWithImpl<$Res, $Val extends ESkitCategory>
    implements $ESkitCategoryCopyWith<$Res> {
  _$ESkitCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ESkitCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? numberOfSkit = null,
    Object? libraryId = null,
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
      numberOfSkit: null == numberOfSkit
          ? _value.numberOfSkit
          : numberOfSkit // ignore: cast_nullable_to_non_nullable
              as int,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ESkitCategoryImplCopyWith<$Res>
    implements $ESkitCategoryCopyWith<$Res> {
  factory _$$ESkitCategoryImplCopyWith(
          _$ESkitCategoryImpl value, $Res Function(_$ESkitCategoryImpl) then) =
      __$$ESkitCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String imagePath,
      int numberOfSkit,
      String libraryId});
}

/// @nodoc
class __$$ESkitCategoryImplCopyWithImpl<$Res>
    extends _$ESkitCategoryCopyWithImpl<$Res, _$ESkitCategoryImpl>
    implements _$$ESkitCategoryImplCopyWith<$Res> {
  __$$ESkitCategoryImplCopyWithImpl(
      _$ESkitCategoryImpl _value, $Res Function(_$ESkitCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ESkitCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? numberOfSkit = null,
    Object? libraryId = null,
  }) {
    return _then(_$ESkitCategoryImpl(
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
      numberOfSkit: null == numberOfSkit
          ? _value.numberOfSkit
          : numberOfSkit // ignore: cast_nullable_to_non_nullable
              as int,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ESkitCategoryImpl
    with DiagnosticableTreeMixin
    implements _ESkitCategory {
  const _$ESkitCategoryImpl(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.numberOfSkit,
      required this.libraryId});

  factory _$ESkitCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ESkitCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imagePath;
  @override
  final int numberOfSkit;
  @override
  final String libraryId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ESkitCategory(id: $id, name: $name, imagePath: $imagePath, numberOfSkit: $numberOfSkit, libraryId: $libraryId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ESkitCategory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('numberOfSkit', numberOfSkit))
      ..add(DiagnosticsProperty('libraryId', libraryId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ESkitCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.numberOfSkit, numberOfSkit) ||
                other.numberOfSkit == numberOfSkit) &&
            (identical(other.libraryId, libraryId) ||
                other.libraryId == libraryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imagePath, numberOfSkit, libraryId);

  /// Create a copy of ESkitCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ESkitCategoryImplCopyWith<_$ESkitCategoryImpl> get copyWith =>
      __$$ESkitCategoryImplCopyWithImpl<_$ESkitCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ESkitCategoryImplToJson(
      this,
    );
  }
}

abstract class _ESkitCategory implements ESkitCategory {
  const factory _ESkitCategory(
      {required final String id,
      required final String name,
      required final String imagePath,
      required final int numberOfSkit,
      required final String libraryId}) = _$ESkitCategoryImpl;

  factory _ESkitCategory.fromJson(Map<String, dynamic> json) =
      _$ESkitCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imagePath;
  @override
  int get numberOfSkit;
  @override
  String get libraryId;

  /// Create a copy of ESkitCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ESkitCategoryImplCopyWith<_$ESkitCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
