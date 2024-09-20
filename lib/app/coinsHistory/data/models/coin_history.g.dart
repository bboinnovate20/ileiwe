// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinHistoryImpl _$$CoinHistoryImplFromJson(Map<String, dynamic> json) =>
    _$CoinHistoryImpl(
      title: json['title'] as String,
      timestamp: json['timestamp'] as String,
      coinEarned: (json['coinEarned'] as num).toInt(),
    );

Map<String, dynamic> _$$CoinHistoryImplToJson(_$CoinHistoryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'timestamp': instance.timestamp,
      'coinEarned': instance.coinEarned,
    };
