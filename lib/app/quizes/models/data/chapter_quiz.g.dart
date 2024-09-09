// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterQuizImpl _$$ChapterQuizImplFromJson(Map<String, dynamic> json) =>
    _$ChapterQuizImpl(
      id: (json['id'] as num).toInt(),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
      coinEarnedPerQuiz: (json['coinEarnedPerQuiz'] as num).toInt(),
    );

Map<String, dynamic> _$$ChapterQuizImplToJson(_$ChapterQuizImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalQuestions': instance.totalQuestions,
      'coinEarnedPerQuiz': instance.coinEarnedPerQuiz,
    };
