import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'e_library_category.freezed.dart';

part 'e_library_category.g.dart';

@freezed
class ELibraryCategory with _$ELibraryCategory {
  const factory ELibraryCategory({
    required String id,
    required String categoryName,
    required String imagePath,
    required int numberOfBooks,
    required String libraryId

  }) = _ELibraryCategory;

  factory ELibraryCategory.fromJson(Map<String, Object?> json)
      => _$ELibraryCategoryFromJson(json);
}


@freezed
class ESkitCategory with _$ESkitCategory {
  const factory ESkitCategory({
    required String id,
    required String name,
    required String imagePath,
    required int numberOfSkit,
    required String libraryId

  }) = _ESkitCategory;

  factory ESkitCategory.fromJson(Map<String, Object?> json)
      => _$ESkitCategoryFromJson(json);
}