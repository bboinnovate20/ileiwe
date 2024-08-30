// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailInfoImpl _$$UserDetailInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailInfoImpl(
      isAuthenticated: json['isAuthenticated'] as bool,
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      isPhoneNumberVerified: json['isPhoneNumberVerified'] as bool,
      isEmailVerified: json['isEmailVerified'] as bool,
      kidInfo: json['kidInfo'] == null
          ? null
          : KidInfo.fromJson(json['kidInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDetailInfoImplToJson(
        _$UserDetailInfoImpl instance) =>
    <String, dynamic>{
      'isAuthenticated': instance.isAuthenticated,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'isPhoneNumberVerified': instance.isPhoneNumberVerified,
      'isEmailVerified': instance.isEmailVerified,
      'kidInfo': instance.kidInfo,
    };
