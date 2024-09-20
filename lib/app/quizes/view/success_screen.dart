import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/app/quizes/models/data/question.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/models/repository/quiz_state_notifier.dart';
import 'package:ileiwe/app/quizes/quizes_controller.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';

class SuccessScreen extends ConsumerStatefulWidget {
  const SuccessScreen({super.key, required this.rightAnswer, required this.wrongAnswer, required this.coinEarned});

  final int rightAnswer;
  final int wrongAnswer;
  final int coinEarned;

  @override
  ConsumerState<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends ConsumerState<SuccessScreen> {

  bool loading = false;

  playAgain(BuildContext context, SkillsLearning skill) {
      context.go(RoutesName.quizInstruction, extra: skill);
  }

  nextChapter(dynamic context) async {
      setState(() {
        loading = true;
      });

      final skillId = ref.watch(quizStateNotifierProvider);

      final controller = QuizzesController(refController: ref);
      

      final response = await controller.isNextChapterAvailable(skillId.id);

      if(response != null && context.mounted) {

          final List<Question> questions = await controller.getListOfQuestions(skillId.id, response);
          
          context.go(RoutesName.quiz, extra: {
                'skillId': skillId.id,
                'chapterInfo': response,
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
  Widget build(BuildContext context) {
    final isFailed = widget.wrongAnswer > 0;

    return   AppContainer(
      addHeader: true,
      title: "Instruction",
      canGoBack: true,

      bottomSheet: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           if(!isFailed) GestureDetector(
              onTap: () => context.push(RoutesName.quiz),
              child: Container(margin: const EdgeInsets.only(bottom: 10, right: 30, left: 30),
                          child:  ButtonOne(label: "Next Chapter", loading: loading,
                          width: double.infinity,
                          bgColor: Theme.of(context).colorScheme.primary,
                          border: Border.all(width: 0, color: Colors.transparent),
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),)),
            ),
            GestureDetector(
              onTap: () => playAgain(context, ref.watch(quizStateNotifierProvider)),
              child: Container(margin: const EdgeInsets.only(bottom: 50, right: 30, left: 30),
                          child:  ButtonOne(label: "Retry", loading: loading,
                          width: double.infinity,
                          bgColor: Theme.of(context).colorScheme.secondary,
                          border: Border.all(width: 0),
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),)),
            ),
          ],
        ),
      ),

      child:  Container(
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
                        isFailed ? 
                        Text("Don't be sad", style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 32, 
                          color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center, ).animate().fadeIn(duration: 500.ms):
                        const Text("You Won! Now unlock your access to the Holo Card game and start playing with other achievers!", 
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center, ).animate().fadeIn(duration: 500.ms),
                        
                        const SizedBox(height: 15,),
                        const Text("Try Again Now", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center, ),
                        
                        const SizedBox(height: 15,),
                        scoreBoard(context, wrongAnswer: widget.wrongAnswer, rightAnswer: widget.rightAnswer),
                        const SizedBox(height: 20,),

                        if(!isFailed) Column(
                          children: [
                               const Text("You Earned"),
                        const SizedBox(height: 5),
                         Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            width: 130,
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
                                  
                                 Text("${widget.coinEarned} Coin", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)
                              ],
                            ),).animate().scale(begin: const Offset(2,2), end: const Offset(1,1)).fadeIn(duration: 500.ms),
                          ],
                        ),
                       
                            const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -100,
                    right: 0,
                    left: 0,

                    child: isFailed ? Image.asset("assets/images/nice_try.png", height: 280).animate().shimmer(duration: 1000.ms) : 
                    Image.asset("assets/images/win_awesome.png", height: 170).animate().shimmer(duration: 1000.ms),
                  )
              ],
            ),
          ),
        ),
      )
      // child: C
    );
  }

  Container scoreBoard(BuildContext context, {required int rightAnswer, required int wrongAnswer}) => Container(
    height: 100,
    decoration:  BoxDecoration(
      color: const Color(0xFFCC9EDF),
      borderRadius: BorderRadius.circular(10)
    ),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Right Answer", style: TextStyle(color: Colors.white, fontSize: 14),),
              Text("$rightAnswer", style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 35, color: Colors.white)).animate().color(begin: Colors.pink, end: Colors.transparent)
              .scale(begin: const Offset(3,3), end: const Offset(1,1)).fadeIn(duration: 500.ms),
            ],
          ),
        ),

        Container(width: 5,
        padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Colors.white
            
          ),
        ),
  
         Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Wrong Answer", style: TextStyle(color: Colors.white, fontSize: 14),),
              Text("$wrongAnswer", style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 35, color: Colors.white)).animate()
              .color(begin: Colors.pink, end: Colors.transparent)
              .scale(begin: const Offset(3,3), end: const Offset(1,1)).fadeIn(duration: 500.ms),
            ],
          ),
        ),
      
      
      ],
    ),
  );
}