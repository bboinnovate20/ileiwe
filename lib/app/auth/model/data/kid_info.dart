import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kid_info.freezed.dart';

part 'kid_info.g.dart';

@freezed
class KidInfo with _$KidInfo {
  const factory KidInfo({
    required String userId,
    required String age,
    required String hobby,
    required String? favoriteSubject,
    required String? interestSubject,
    required String? challengingSubject,
    required String? benefit,
    required int coinEarned

  }) = _KidInfo;

  factory KidInfo.fromJson(Map<String, Object?> json)
      => _$KidInfoFromJson(json);
}