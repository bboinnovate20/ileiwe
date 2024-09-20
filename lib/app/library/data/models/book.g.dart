// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      author: json['author'] as String,
      imagePath: json['imagePath'] as String,
      categoryId: json['categoryId'] as String,
      libraryCategoryId: json['libraryCategoryId'] as String,
      description: json['description'] as String,
      isPremium: json['isPremium'] as bool,
      totalReaders: json['totalReaders'] as num,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'author': instance.author,
      'imagePath': instance.imagePath,
      'categoryId': instance.categoryId,
      'libraryCategoryId': instance.libraryCategoryId,
      'description': instance.description,
      'isPremium': instance.isPremium,
      'totalReaders': instance.totalReaders,
    };
