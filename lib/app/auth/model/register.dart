import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'register.freezed.dart';

part 'register.g.dart';

@freezed
class Register with _$Register {
  const factory Register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) = _Register;

  factory Register.fromJson(Map<String, Object?> json)
      => _$RegisterFromJson(json);
}