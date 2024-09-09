// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_library_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ELibraryCategoryImpl _$$ELibraryCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ELibraryCategoryImpl(
      id: json['id'] as String,
      categoryName: json['categoryName'] as String,
      imagePath: json['imagePath'] as String,
      numberOfBooks: (json['numberOfBooks'] as num).toInt(),
      libraryId: json['libraryId'] as String,
    );

Map<String, dynamic> _$$ELibraryCategoryImplToJson(
        _$ELibraryCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'imagePath': instance.imagePath,
      'numberOfBooks': instance.numberOfBooks,
      'libraryId': instance.libraryId,
    };

_$ESkitCategoryImpl _$$ESkitCategoryImplFromJson(Map<String, dynamic> json) =>
    _$ESkitCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      numberOfSkit: (json['numberOfSkit'] as num).toInt(),
      libraryId: json['libraryId'] as String,
    );

Map<String, dynamic> _$$ESkitCategoryImplToJson(_$ESkitCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'numberOfSkit': instance.numberOfSkit,
      'libraryId': instance.libraryId,
    };
