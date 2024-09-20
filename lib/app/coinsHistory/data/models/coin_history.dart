import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'coin_history.freezed.dart';

part 'coin_history.g.dart';

@freezed
class CoinHistory with _$CoinHistory {
  const factory CoinHistory({
    required String title,
    required String timestamp,
    required int coinEarned,

  }) = _CoinHistory;

  factory CoinHistory.fromJson(Map<String, Object?> json)
      => _$CoinHistoryFromJson(json);
}