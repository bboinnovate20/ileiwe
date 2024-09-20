import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book.freezed.dart';

part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String name,
    required String id,
    required String author,
    required String imagePath,
    required String categoryId,
    required String libraryCategoryId,
    required String description,
    required bool isPremium,
    required num totalReaders
  }) = _Book;

  factory Book.fromJson(Map<String, Object?> json)
      => _$BookFromJson(json);
}


class DocumentReferenceConverter
    implements JsonConverter<DocumentReference<Map<String, dynamic>>, dynamic> {
  const DocumentReferenceConverter();

  @override
  DocumentReference<Map<String, dynamic>> fromJson(dynamic json) {
    return FirebaseFirestore.instance.doc(json as String);
  }

  @override
  dynamic toJson(DocumentReference<Map<String, dynamic>> docRef) {
    return docRef.path;
  }
}