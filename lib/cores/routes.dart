

import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/kid_detail_screen.dart';
import 'package:ileiwe/app/auth/view/login_screen.dart';
import 'package:ileiwe/app/auth/view/register_screen.dart';
import 'package:ileiwe/app/auth/view/verification_screen.dart';
import 'package:ileiwe/app/dashboard/view/home_screen.dart';
import 'package:ileiwe/app/onboarding/view/onboarding_screen.dart';
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
      builder: (context, state) => const SubscriptionPricingScreen(),
    ),

    GoRoute(
      path: RoutesName.homeDashboard,
      builder: (context, state) => const HomeScreen(),
    ),
   
  ],);