// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoImpl _$$VideoImplFromJson(Map<String, dynamic> json) => _$VideoImpl(
      id: json['id'] as String,
      categoryName: json['categoryName'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      videoId: json['videoId'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$VideoImplToJson(_$VideoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'thumbnailUrl': instance.thumbnailUrl,
      'videoId': instance.videoId,
      'title': instance.title,
    };
