import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'video.freezed.dart';

part 'video.g.dart';

@freezed
class Video with _$Video {
  const factory Video({
    required String id,
    required String categoryName,
    required String thumbnailUrl,
    required String videoId,
    required String title,
  }) = _Video;

  factory Video.fromJson(Map<String, Object?> json)
      => _$VideoFromJson(json);
}

