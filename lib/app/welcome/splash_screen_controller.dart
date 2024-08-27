import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/constant/routes.dart';


class SplashScreenController {
  const SplashScreenController();


  decideNextScreen(BuildContext context) {
    
    context.replace(RoutesName.onboarding);
  }


}
