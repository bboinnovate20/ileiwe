import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ileiwe/app/auth/model/data/kid_info.dart';

part 'user_info.freezed.dart';

part 'user_info.g.dart';

@unfreezed
class UserDetailInfo with _$UserDetailInfo {
   factory UserDetailInfo({
    required bool isAuthenticated,
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required bool isPhoneNumberVerified,
    required bool isEmailVerified,
     
    KidInfo? kidInfo

  }) = _UserDetailInfo;

  factory UserDetailInfo.fromJson(Map<String, Object?> json)
      => _$UserDetailInfoFromJson(json);
}