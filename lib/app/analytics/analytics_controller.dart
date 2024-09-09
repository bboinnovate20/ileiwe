

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ileiwe/app/analytics/models/providers/analytics_provider.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/providers/skills_provider.dart';
import 'package:ileiwe/cores/common/returned_status.dart';

class AnalyticsController {

  AnalyticsController({required this.controller});

  final WidgetRef controller;

  Future<List> getSkillsAnalytics() async {
    final userId = controller.read(userStateNotifierProvider).userId;
    
    final ReturnedStatus response = await controller.read(analyticsRepositoryProvider).getAllSkillsPerformance(userId);
    return response.data;
  }

   AsyncValue<Map<String, dynamic>> getAllSkills () {
    final skill = controller.watch(skillsLearningProvider);
    return skill;
  }
}