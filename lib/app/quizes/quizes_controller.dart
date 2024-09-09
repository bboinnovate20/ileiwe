

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/quizes/models/data/chapter_quiz.dart';
import 'package:ileiwe/app/quizes/models/data/question.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/models/repository/quiz_state_notifier.dart';
import 'package:ileiwe/app/quizes/providers/skills_provider.dart';
import 'package:ileiwe/cores/common/returned_status.dart';

class QuizzesController {

  QuizzesController({required this.refController});

  final WidgetRef refController;

  getAllSkills() {
      // return ref.watch(allSkillsProvider);
  }

  Future<Map<String, dynamic>?> getCurrentKidSkillProgress(SkillsLearning skillId) async {
      
      await Future.microtask(() async {
              refController.watch(quizStateNotifierProvider.notifier).update(skillId);
       });

      final userId = refController.read(userStateNotifierProvider).userId;

      final ReturnedStatus response = await refController.read(quizRepositoryProvider).getKidCurrentProgress(skillId.id, userId);


      final responseChapter = await getChapterInfo(response.otherData['chapter'] , skillId.id);

      if(responseChapter.success){
        return {
          'isCompleted': response.otherData['isCompleted'],
          'chapterInfo': ChapterQuiz.fromJson(responseChapter.otherData)
         };
      }



      return null;
  }




  getChapterInfo(int chapterId, String skillId) async {
    final response = await refController.read(quizRepositoryProvider).getChapterForQuiz(skillId, chapterId);
    return response;
  }

  getListOfQuestions(var skillId, var chapterId) async {
    final response = await refController.read(quizRepositoryProvider).getQuestionsForQuiz(skillId, chapterId);
    final data = response.data as List;
    
    return data.map((question) => Question.fromJson(question)).toList();

  }

  storeKidProgress({required String skillId,required int newCurrentChapter,
                    required int coinEarned,
                    required String whatLearnt, required int currentChapterId, 
                    required String userId}) async {
    
    final response =  refController.read(quizRepositoryProvider);

    final ReturnedStatus submitQuiz = await response.updateKidProgress(skillId: skillId, newCurrentChapter: newCurrentChapter, 
          coinEarned: coinEarned, whatLearnt: whatLearnt, currentChapterId: currentChapterId, userId: userId);
    
    return submitQuiz;
    
  }

  isNextChapterAvailable(skillId) async {
     ReturnedStatus response = await refController.read(quizRepositoryProvider).
              goToNextChapterForSkill(skillId: skillId, userId: refController.read(userStateNotifierProvider).userId);
    
    if(response.success) {
      return response.otherData['chapter'];
    }
    return null;
  }
}