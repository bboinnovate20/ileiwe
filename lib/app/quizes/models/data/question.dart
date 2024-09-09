import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ileiwe/app/quizes/models/data/question_option.dart';

part 'question.freezed.dart';

part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String id,
    required String text,
    List<QuestionOption>? options,
    required int correctAnswer

  }) = _Question;

  factory Question.fromJson(Map<String, Object?> json)
      => _$QuestionFromJson(json);
}