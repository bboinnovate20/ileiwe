// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kid_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KidInfoImpl _$$KidInfoImplFromJson(Map<String, dynamic> json) =>
    _$KidInfoImpl(
      userId: json['userId'] as String,
      age: json['age'] as String,
      hobby: json['hobby'] as String,
      favoriteSubject: json['favoriteSubject'] as String?,
      interestSubject: json['interestSubject'] as String?,
      challengingSubject: json['challengingSubject'] as String?,
      benefit: json['benefit'] as String?,
      coinEarned: (json['coinEarned'] as num).toInt(),
    );

Map<String, dynamic> _$$KidInfoImplToJson(_$KidInfoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'age': instance.age,
      'hobby': instance.hobby,
      'favoriteSubject': instance.favoriteSubject,
      'interestSubject': instance.interestSubject,
      'challengingSubject': instance.challengingSubject,
      'benefit': instance.benefit,
      'coinEarned': instance.coinEarned,
    };
