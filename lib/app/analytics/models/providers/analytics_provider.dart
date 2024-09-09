import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ileiwe/app/analytics/models/repository/analytics_repository.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/models/repository/quiz_repository.dart';
import 'package:ileiwe/app/quizes/providers/skills_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'analytics_provider.g.dart';

@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);

  return AnalyticsRepository(firestore: firestore);
}
