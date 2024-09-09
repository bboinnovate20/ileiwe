


import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'quiz_state_notifier.g.dart';

@Riverpod(keepAlive: true)    
class QuizStateNotifier extends _$QuizStateNotifier{
  
  @override
  SkillsLearning build() {
    return  const SkillsLearning(id: "", totalChapters: 0, name: "name");
  }

   update(SkillsLearning newUpdate) {
    state = newUpdate;
  }
}