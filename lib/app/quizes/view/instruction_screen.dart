import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/app/quizes/models/data/chapter_quiz.dart';
import 'package:ileiwe/app/quizes/models/data/question.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/quizes_controller.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';

class InstructionScreen extends ConsumerStatefulWidget {
  const InstructionScreen({super.key, required this.skill});

  final SkillsLearning skill;

  @override
  ConsumerState<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends ConsumerState<InstructionScreen> {
    ChapterQuiz? chapterNumber;
    bool readyForNextChapter = false;
    bool loading = false;

    getCurrentKidStage(SkillsLearning skillId) async {
      
      final controller = QuizzesController(refController: ref);
      final chapterNum = await controller.getCurrentKidSkillProgress(skillId);
    
      setState(() {
        chapterNumber = chapterNum?['chapterInfo'] as ChapterQuiz?;
        readyForNextChapter = chapterNum?['isCompleted'] ;
      });
    }

    onStartQuiz() async {
      final controller = QuizzesController(refController: ref);
      final skillLearningId = widget.skill.id;
      final List<Question> questions = await controller.getListOfQuestions(skillLearningId, chapterNumber?.id);
      // final chapterNum = await controller.getCurrentKidSkillProgress(skillId);
      if(!context.mounted && chapterNumber == null) return;
      
      context.push(RoutesName.quiz, extra: {
        'skillId': widget.skill.id,
        'chapterInfo': chapterNumber,
        'questions': questions
      });

    }

nextChapter() async {
  setState(() {
    loading = true;

  });
  final controller = QuizzesController(refController: ref);
  

  final response = await controller.isNextChapterAvailable(widget.skill.id);

  if(response != null && context.mounted) {

      final List<Question> questions = await controller.getListOfQuestions(widget.skill.id, chapterNumber?.id);
      final chapterNum = await controller.getCurrentKidSkillProgress(widget.skill);

      context.push(RoutesName.quiz, extra: {
            'skillId': widget.skill.id,
            'chapterInfo': chapterNum?['chapterInfo'] as ChapterQuiz?,
            'questions': questions
          });
  }
  else {
    CustomToast(Navigator.of(context)).showErrorMessage("No other quiz at this moment :)");

  }
  setState(() {
    loading = false;

  });
}
  

@override
  void initState() {
    super.initState();
    getCurrentKidStage(widget.skill);
  }


  @override
  Widget build(BuildContext context) {

    return   AppContainer(
      addHeader: true,
      title: "Instruction",
      canGoBack: true,

      bottomSheet: !readyForNextChapter ?
         GestureDetector(
          onTap: () => onStartQuiz(),
           child: Container(margin: const EdgeInsets.only(bottom: 30, right: 30, left: 30),
                          child:  ButtonOne(label: "Start", 
                          width: double.infinity,
                          bgColor: Theme.of(context).colorScheme.secondary,
                          border: Border.all(width: 0),
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),)),
         ):
        SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          
          children: [
            GestureDetector(
              onTap: () => nextChapter(),
              child: Container(margin: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
                          child:  ButtonOne(label: "Next Chapter", 
                          width: double.infinity,
                          loading: loading,
                          bgColor: Theme.of(context).colorScheme.primary,
                          border: Border.all(width: 0),
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),)),
            ),
          GestureDetector(
            onTap: () => onStartQuiz(),
            child: Container(margin: const EdgeInsets.only(bottom: 50, right: 30, left: 30),
                          child:  ButtonOne(label: "Play Again", 
                          width: double.infinity,
                          loading: loading,
                          bgColor: Theme.of(context).colorScheme.secondary,
                          border: Border.all(width: 0),
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),)),
          ),
          ],
        ),
      ),

      child: chapterNumber != null ? Container(
        margin: const EdgeInsets.only(top: 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                  Container(
                    width: MediaQuery.of(context).size.width /1.2,
                    height: 410,
                    padding: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.skill.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center, ),
                        const SizedBox(height: 15,),
                        Text("Chapter ${chapterNumber?.id ?? ""}", style: Theme.of(context).textTheme.titleLarge?.
                                  copyWith(height: 2, color: Theme.of(context).colorScheme.tertiary)),
                        const SizedBox(height: 15,),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Quiz will be accompanied by pictures to make it easier to understand", textAlign: TextAlign.center,)),
                          const SizedBox(height: 20,),
                        const Text("Complete the chapter and earn", textAlign: TextAlign.center,),
                        const SizedBox(height: 20,),
                         Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            width: 140,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/images/coin_reward.png", height: 25,),
                                const SizedBox(width: 5,),
                                 Text("${chapterNumber?.coinEarnedPerQuiz} Coins", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)
                              ],
                            ),),
                            const SizedBox(height: 15),
                      ],
                    ),
                  ),

                  Positioned(
                    top: -100,
                    right: 0,
                    left: 0,

                    child: Image.asset("assets/images/reading_little_boy.png", height: 200),
                  )
              ],
            ),
          ),
        ),
      ): Container()
      // child: C
    );
  }
}