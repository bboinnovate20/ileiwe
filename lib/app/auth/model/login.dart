import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login.freezed.dart';

part 'login.g.dart';

@freezed
class Login with _$Login {
  const factory Login({
    required String email,
    required String password,

  }) = _Login;

  factory Login.fromJson(Map<String, Object?> json)
      => _$LoginFromJson(json);
}