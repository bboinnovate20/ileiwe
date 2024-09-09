import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/app/quizes/models/data/chapter_quiz.dart';
import 'package:ileiwe/app/quizes/models/data/question.dart';
import 'package:ileiwe/app/quizes/models/data/question_option.dart';
import 'package:ileiwe/app/quizes/quizes_controller.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key, required this.skillId, 
  required this.chapterInfo, 
  required this.questions});

  final String skillId;
  final List<Question> questions;
  final ChapterQuiz chapterInfo;

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}



class _QuizScreenState extends ConsumerState<QuizScreen> {

   bool isAnswerSelected = false;
    bool isQuizCompleted = false;
    int currentQuestion = 0;
    int? currentAnswerSelect;
    String? currentAnswerText;
    List<Question> questions  = [];
    bool loading = false;

    final lastQuestion =
      const Question(correctAnswer: -1, id: "000", text: "What do you learn from this quiz" );
    


    processQuiz(List<Map<String, dynamic>> answerQuestion) async {
        setState(() => loading = true);
        
        int answerGotRight = 0;
        int answerGotWrong = 0;
        String whatLearned = answerQuestion.last['answerSelected'];
        
        for (var answer in answerQuestion) {
          if (answer['isCorrect'] == true) {
            answerGotRight = answerGotRight+1;
          } else {
            answerGotWrong = answerGotWrong+1;
          }
      }

      // final data = {
      //   ''
      // }

      await submit(whatLearned, answerGotWrong);

        context.go(RoutesName.quizSuccess, extra: {
                      'rightAnswer': answerGotRight,
                      'wrongAnswer': answerGotWrong,
                      'coinEarned': widget.chapterInfo.coinEarnedPerQuiz
        });

      setState(() => loading = false);

    }

    submit(String whatLearnt, int answerGotWrong) async {
      
        final controller = QuizzesController(refController: ref);

        if(answerGotWrong > 0) return;

        final response = controller.storeKidProgress(skillId: widget.skillId, 
                              newCurrentChapter: widget.chapterInfo.id + 1, 
                              coinEarned: widget.chapterInfo.coinEarnedPerQuiz,
                              whatLearnt: whatLearnt, currentChapterId: widget.chapterInfo.id, 
                              userId: ref.read(userStateNotifierProvider).userId);
        return response;
    }
  

    List<Map<String, dynamic>> quizAnswersSelected = [

    ];


     checkSideEffect(question) {

       if(isQuizCompleted) {
      
        return processQuiz(quizAnswersSelected);
      }
      
      setState(() {
        currentAnswerSelect = null;
        currentAnswerText = null;
      });
      
      if(question == questions.length) {
        setState(() {
          isQuizCompleted = true;
        });
        
      }
      setState(() {
        currentQuestion = currentQuestion+1;
      });

    }

    processAnswerOption(int question, int answer, int optionSelected) {
    
      
      final userResponse = {
        "question": question,
        "answerSelected": optionSelected,
        "isCorrect": optionSelected == answer
      };
 

      quizAnswersSelected.add(userResponse);  

      checkSideEffect(question+2);
     
    }

      processAnswerText(int question, int answer, String optionSelected) {
      final userResponse = {
        "question": question,
        "answerSelected": optionSelected,
        "isCorrect": true
      };

      quizAnswersSelected.add(userResponse);  

      if(isQuizCompleted) {
        return processQuiz(quizAnswersSelected);
      }
      
      checkSideEffect(question+2);
    }


  
  @override
  void initState() {
    super.initState();
    setState(() {
      questions =[...widget.questions, lastQuestion];
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return   AppContainer(
      addHeader: true,
      title: "Chapter ${widget.chapterInfo.id}",
      canGoBack: true,

      bottomSheet: Container(margin: const EdgeInsets.only(bottom: 50, right: 30, left: 30),
                  child:  ButtonOne(label: isQuizCompleted ? "Submit" : "Next", loading: loading,
                  isDisabled: currentAnswerSelect == null && currentAnswerText == null,
                  action: (){
                  
                    if(currentAnswerSelect != null){
                    
                         processAnswerOption(currentQuestion,  
                                questions[currentQuestion].correctAnswer, currentAnswerSelect!);

                    }else {
                     
                     processAnswerText(currentQuestion,  
                                questions[currentQuestion].correctAnswer, currentAnswerText!);

                    }
                 },
                  width: double.infinity,
                  
                  bgColor: currentAnswerSelect != null || currentAnswerText != null ? Theme.of(context).colorScheme.secondary : 
                        Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  border: Border.all(width: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),)),

      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const SizedBox(height: 30,),
              progressBar(context, questions.length.toDouble(), currentQuestion.toDouble() +1),
              const SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width /1.2,
      
                height: MediaQuery.of(context).size.height /1.7,
                padding: const EdgeInsets.all(10),
                decoration:  BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("Question ${currentQuestion+1} / ${questions.length}", style:Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.purple), textAlign: TextAlign.center, ),
                    const SizedBox(height: 30,), 
                     QuestionOptions(question: questions[currentQuestion],
                                selectedOption: currentAnswerSelect ?? -1,
                                onAnswered: (answer) {
                                  setState(() => currentAnswerText = answer);
                                },
                                onSelected: (option) => setState(() => currentAnswerSelect = option)
                                )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
      // child: C
    );
  }

  Widget progressBar(BuildContext context, double total, double currentValue) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.4,
      child: LinearProgressIndicator(
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(5),
                              value:currentValue > 0 && currentValue <= total ?  (currentValue / total) : 0,
                              backgroundColor: const Color(0xFF0079D4).withOpacity(0.3),
                              
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0079D4),),
                            ),
    );
  }
}

class QuestionOptions extends StatelessWidget {
   QuestionOptions({
    super.key,
    required this.question,
    required this.selectedOption,
    required this.onSelected,
    required this.onAnswered
  });

  final Question question;
  final void Function(int) onSelected;
  final int selectedOption;
  final void Function(String)  onAnswered;

  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
         Text(question.text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center, ),
        const SizedBox(height: 20,),
         question.options != null ? Column(
            children: [
                ...question.options!.map((option) => optionWidget(context, 
                  selected: selectedOption == option.id,
                  action: (){ 
                    // setState(() => isSelected = option.id);
                    return onSelected(option.id);
                  } ,
                  option: option.text))
                
          ],
        
        ) : SizedBox(
             height: 300,
            child:  InputFieldCustom(label: "label", validator: (value)=> "ddd", 
            expands: true,
            onChange: (value) => onAnswered(value))),
      ],
    ); 
  }

  Widget optionWidget(BuildContext context, {required String option, required Function() action,  bool selected = false}) => 
  InkWell(
    onTap: () => action(),
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration:  BoxDecoration(color: selected ? Theme.of(context).colorScheme.secondary : Colors.white, 
            
          borderRadius: BorderRadius.circular(25)),
      child: selected ?  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 210,
            child: Text(option, textAlign: TextAlign.center, style: TextStyle(color: selected ? Colors.white : null),)),
          const Icon(Icons.check_circle_rounded, color: Colors.white,).animate().slideX(begin: 0.5, end: 0, duration: 200.ms).fadeIn(duration: 500.ms)
        ],
      ): Text(option, textAlign: TextAlign.center, style: TextStyle(color: selected ? Colors.white : null),)),
  );
}