// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get libraryCategoryId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;
  num get totalReaders => throw _privateConstructorUsedError;

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String name,
      String id,
      String author,
      String imagePath,
      String categoryId,
      String libraryCategoryId,
      String description,
      bool isPremium,
      num totalReaders});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? author = null,
    Object? imagePath = null,
    Object? categoryId = null,
    Object? libraryCategoryId = null,
    Object? description = null,
    Object? isPremium = null,
    Object? totalReaders = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      libraryCategoryId: null == libraryCategoryId
          ? _value.libraryCategoryId
          : libraryCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      totalReaders: null == totalReaders
          ? _value.totalReaders
          : totalReaders // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String id,
      String author,
      String imagePath,
      String categoryId,
      String libraryCategoryId,
      String description,
      bool isPremium,
      num totalReaders});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? author = null,
    Object? imagePath = null,
    Object? categoryId = null,
    Object? libraryCategoryId = null,
    Object? description = null,
    Object? isPremium = null,
    Object? totalReaders = null,
  }) {
    return _then(_$BookImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      libraryCategoryId: null == libraryCategoryId
          ? _value.libraryCategoryId
          : libraryCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
      totalReaders: null == totalReaders
          ? _value.totalReaders
          : totalReaders // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl with DiagnosticableTreeMixin implements _Book {
  const _$BookImpl(
      {required this.name,
      required this.id,
      required this.author,
      required this.imagePath,
      required this.categoryId,
      required this.libraryCategoryId,
      required this.description,
      required this.isPremium,
      required this.totalReaders});

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String author;
  @override
  final String imagePath;
  @override
  final String categoryId;
  @override
  final String libraryCategoryId;
  @override
  final String description;
  @override
  final bool isPremium;
  @override
  final num totalReaders;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(name: $name, id: $id, author: $author, imagePath: $imagePath, categoryId: $categoryId, libraryCategoryId: $libraryCategoryId, description: $description, isPremium: $isPremium, totalReaders: $totalReaders)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('libraryCategoryId', libraryCategoryId))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('isPremium', isPremium))
      ..add(DiagnosticsProperty('totalReaders', totalReaders));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.libraryCategoryId, libraryCategoryId) ||
                other.libraryCategoryId == libraryCategoryId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.totalReaders, totalReaders) ||
                other.totalReaders == totalReaders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, author, imagePath,
      categoryId, libraryCategoryId, description, isPremium, totalReaders);

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final String name,
      required final String id,
      required final String author,
      required final String imagePath,
      required final String categoryId,
      required final String libraryCategoryId,
      required final String description,
      required final bool isPremium,
      required final num totalReaders}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get author;
  @override
  String get imagePath;
  @override
  String get categoryId;
  @override
  String get libraryCategoryId;
  @override
  String get description;
  @override
  bool get isPremium;
  @override
  num get totalReaders;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
