import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'skills.freezed.dart';

part 'skills.g.dart';

@freezed
class SkillsLearning with _$SkillsLearning {
  const factory SkillsLearning({
    required String id,
    required int totalChapters,
    required String name,


  }) = _SkillsLearning;

  factory SkillsLearning.fromJson(Map<String, Object?> json)
      => _$SkillsLearningFromJson(json);
}