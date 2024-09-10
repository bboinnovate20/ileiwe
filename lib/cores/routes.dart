

import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/kid_detail_screen.dart';
import 'package:ileiwe/app/auth/view/login_screen.dart';
import 'package:ileiwe/app/auth/view/register_screen.dart';
import 'package:ileiwe/app/auth/view/verification_screen.dart';
import 'package:ileiwe/app/dashboard/view/home_screen.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/data/models/video.dart';
import 'package:ileiwe/app/library/view/books_screen.dart';
import 'package:ileiwe/app/library/view/category_screen.dart';
import 'package:ileiwe/app/library/view/e_book_library_screen.dart';
import 'package:ileiwe/app/library/view/single_book_intro.dart';
import 'package:ileiwe/app/library/view/skit_library_screen.dart';
import 'package:ileiwe/app/library/view/video_player_screen.dart';
import 'package:ileiwe/app/messages/view/chat_screen.dart';
import 'package:ileiwe/app/messages/view/message_screen.dart';
import 'package:ileiwe/app/notifications/views/notification_screen.dart';
import 'package:ileiwe/app/onboarding/view/onboarding_screen.dart';
import 'package:ileiwe/app/profile/view/edit_profile.dart';
import 'package:ileiwe/app/quizes/models/data/chapter_quiz.dart';
import 'package:ileiwe/app/quizes/models/data/question.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/view/instruction_screen.dart';
import 'package:ileiwe/app/quizes/view/quiz_screen.dart';
import 'package:ileiwe/app/quizes/view/success_screen.dart';
import 'package:ileiwe/app/subscription/view/subscription_pricing_screen.dart';
import 'package:ileiwe/app/welcome/view/splash_screen.dart';
import 'package:ileiwe/constant/routes.dart';



final router = GoRouter(
  routes: [
     GoRoute(
      path: RoutesName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutesName.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
     GoRoute(
      path: RoutesName.login,
      builder: (context, state) => const LoginScreen(),
    ),
     GoRoute(
      path: RoutesName.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: "${RoutesName.verifyAccount}/:token",
      builder: (context, state) =>  VerificationScreen(verifiedToken: state.pathParameters['token'] as String),
    ),

    GoRoute(
      path: RoutesName.kidDetails,
      builder: (context, state) => const KidDetailScreen(),
    ),

    GoRoute(
      path: RoutesName.subscriptionPricing,
      builder: (context, state) =>  SubscriptionPricingScreen(canGoBack: state.extra != null ? true : false,),
    ),

    GoRoute(
      path: RoutesName.homeDashboard,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: RoutesName.quizInstruction,
      builder: (context, state) {
        final extraData = state.extra as SkillsLearning;

        return InstructionScreen(skill: extraData);
      }
    ),

    GoRoute(
      path: RoutesName.quiz,
      builder: (context, state) {
        final extraData = state.extra as Map<String, dynamic>;

         final chapterInfo = extraData['chapterInfo'] as ChapterQuiz;
        final skillId = extraData['skillId'] as String? ?? "";
        final questions = extraData['questions'] as List<Question>;

        return  QuizScreen(skillId: skillId, chapterInfo: chapterInfo ,questions: questions);
        
      },
    ),

     GoRoute(
      path: RoutesName.quizSuccess,
      builder: (context, state) {
         final extraData = state.extra as Map<String, dynamic>?;
        final rightAnswer = extraData?['rightAnswer'] as int? ?? 0;
        final wrongAnswer = extraData?['wrongAnswer'] as int? ?? 0;
        final coinEarned = extraData?['coinEarned'] as int? ?? 0;

        return SuccessScreen(rightAnswer:rightAnswer , 
                    wrongAnswer: wrongAnswer, coinEarned: coinEarned);
      }
    ),

     GoRoute(
      path: RoutesName.editProfile,
      builder: (context, state) {
        return  const EditProfile();
      }
    ),

    GoRoute(
      path: RoutesName.messages,
      builder: (context, state) => const MessageScreen(),
    ),

    GoRoute(
      path: RoutesName.chat,
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: RoutesName.notification,
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      path: RoutesName.eLibrary,
      builder: (context, state) => const EBookLibraryScreen(),
    ),
    GoRoute(
      path: RoutesName.eLibraryCategories,
      builder: (context, state) => const CategoryScreen(),
    ),

     GoRoute(
      path: RoutesName.eLibraryCategoriesBooks,
      builder: (context, state) {
         final extraData = state.extra as Map<String, dynamic>?;
        final title = extraData?['title'] as String;
        final libraryCategoryId = extraData?['libraryCategoryId'] as String;
        final bookCategoryId = extraData?['bookCategoryId'] as String;

        return BooksScreen(title: title, libraryCategoryId: libraryCategoryId, bookCategoryId: bookCategoryId);
      }
    ),
     GoRoute(
      path: RoutesName.eLibraryBookIntro,
      builder: (context, state) =>  SingleBookIntro(bookDetails: state.extra as Book,),
    ),
    GoRoute(
      path: RoutesName.skitLibrary,
      builder: (context, state) =>  const SkitLibraryScreen(),
    ),
    GoRoute(
      path: RoutesName.videoScreen,
      builder: (context, state) =>   VideoPlayerScreen(video: state.extra as Video),
    ),
   
  ],);