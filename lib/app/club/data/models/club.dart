import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ileiwe/app/auth/model/data/kid_info.dart';

part 'club.freezed.dart';

part 'club.g.dart';

@unfreezed
class Club with _$Club {
   factory Club({
    required String id,
    required String name,
    required String imagePath,
    required String descriptionsOfClub,

    KidInfo? kidInfo

  }) = _Club;

  factory Club.fromJson(Map<String, Object?> json)
      => _$ClubFromJson(json);
}