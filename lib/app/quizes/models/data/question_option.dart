import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'question_option.freezed.dart';

part 'question_option.g.dart';

@freezed
class QuestionOption with _$QuestionOption {
  const factory QuestionOption({
    required int id,
    required String text,

  }) = _QuestionOption;

  factory QuestionOption.fromJson(Map<String, Object?> json)
      => _$QuestionOptionFromJson(json);
}