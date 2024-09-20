// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClubImpl _$$ClubImplFromJson(Map<String, dynamic> json) => _$ClubImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      descriptionsOfClub: json['descriptionsOfClub'] as String,
      kidInfo: json['kidInfo'] == null
          ? null
          : KidInfo.fromJson(json['kidInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClubImplToJson(_$ClubImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'descriptionsOfClub': instance.descriptionsOfClub,
      'kidInfo': instance.kidInfo,
    };
