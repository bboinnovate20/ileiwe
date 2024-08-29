import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ileiwe/app/auth/model/data/kid_info.dart';

part 'user_info.freezed.dart';

part 'user_info.g.dart';

@unfreezed
class UserInfo with _$UserInfo {
   factory UserInfo({
    required bool isAuthenticated,
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required bool isEmailVerified,
    //  KidInfo? kidInfo

  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, Object?> json)
      => _$UserInfoFromJson(json);
}