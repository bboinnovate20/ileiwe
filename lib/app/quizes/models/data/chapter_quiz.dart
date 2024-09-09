import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chapter_quiz.freezed.dart';

part 'chapter_quiz.g.dart';

@freezed
class ChapterQuiz with _$ChapterQuiz {
  const factory ChapterQuiz({
    required int id,
    required int totalQuestions,
    required int coinEarnedPerQuiz,
  }) = _ChapterQuiz;

  factory ChapterQuiz.fromJson(Map<String, Object?> json)
      => _$ChapterQuizFromJson(json);
}