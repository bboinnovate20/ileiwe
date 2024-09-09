// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillsLearningImpl _$$SkillsLearningImplFromJson(Map<String, dynamic> json) =>
    _$SkillsLearningImpl(
      id: json['id'] as String,
      totalChapters: (json['totalChapters'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SkillsLearningImplToJson(
        _$SkillsLearningImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalChapters': instance.totalChapters,
      'name': instance.name,
    };
