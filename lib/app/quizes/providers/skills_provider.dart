import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ileiwe/app/analytics/models/providers/analytics_provider.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/models/repository/quiz_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'skills_provider.g.dart';

@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}


@riverpod
QuizRepository quizRepository(QuizRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);

  return QuizRepository(firestore: firestore);
}

@riverpod
Future<SkillsLearning> skillDataProvider(SkillDataProviderRef ref, String skillId) async {
  final quiz = ref.watch(quizRepositoryProvider);

  // Fetch the skill data from the repository
  final response = await quiz.getSkill(skillId);
  final data = response.otherData;

  // Map the data to SkillsLearning model
  return SkillsLearning.fromJson(data);
  
}


@riverpod
Future<Map<String, dynamic>> skillsLearning(SkillsLearningRef ref) async {
  final quiz = ref.watch(quizRepositoryProvider);
  final analytics = ref.watch(analyticsRepositoryProvider);

  // Fetch all skills from the repository
  final response = await quiz.getAllSkills();
  final getAnalytics = await analytics.getAllSkillsPerformance(ref.watch(userStateNotifierProvider).userId);

  if (!response.success && !getAnalytics.success) {
    
    throw Exception(response.message);
  }

  final skillsList = response.otherData['skills'] as List<dynamic>;
  print(response.otherData['performance']);
  print(response.otherData['overall']);

  return {
    'skill': skillsList.map((skillData) => SkillsLearning.fromJson(skillData)).toList(),
    'analytics': getAnalytics.data?['performance'] as List?,
    'overallPerformance': getAnalytics.data?['overall'] as double?,
  };
}


// final allSkillsProvider = FutureProvider<List<SkillsLearning>>((ref) async {
//   final firestore = ref.watch(firestoreProvider);
//   final quiz = QuizRepository(firestore: firestore);
  
//   final response = await quiz.getAllSkills();
//   if (!response.success) {
//     throw Exception(response.message);
//   }
  
//   final skillsList = response.otherData['skills'] as List<dynamic>;
//   return skillsList.map((skillData) => SkillsLearning(
//     id: skillData['id'] ?? '',
//     name: skillData['name'] ?? '',
//     chapter: skillData['totalChapters'] ?? 0,
//   )).toList();
// });