import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ileiwe/app/welcome/splash_screen_controller.dart';
import 'package:ileiwe/cores/common/speak.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';
import 'package:rive/rive.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
  
}



class _SplashScreenState extends ConsumerState<SplashScreen> {

  late SplashScreenController _splashScreenController;

  double opacity = 1;


  initializeAnimation() async {

    
    _splashScreenController.playAudio();
      Future.delayed(const Duration(seconds: 3), () {
        _splashScreenController.decideNextScreen(context);   
      });
  }

  @override
  void initState() {
    super.initState();
    _splashScreenController = SplashScreenController(ref: ref);
    initializeAnimation();

  }

  @override
  Widget build(BuildContext context) {

    return  ContainerCustom(
      canGoBack: false,
      child: Center(
            child: Transform.translate(
              offset: const Offset(0, -40),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: RiveAnimation.asset(
                        'assets/animations/logo.riv',
                        // fit: BoxFit.contain,
                        fit: BoxFit.scaleDown,
                      ),
                  ),
                  // AnimatedOpacity(opacity: opacity,  duration: const Duration(seconds: 4), child: Image.asset("assets/images/logo_full.png", height: 230)).animate().fadeIn(duration: 600.ms),
                  // const 
                  // Text("LEARNING MEETS CREATIVITY", style: TextStyle(letterSpacing: 3, height: 3.5, fontSize: 10, color: Colors.white),).animate().blurX(duration: 600.ms, begin: 10, end: 0, delay: 400.ms),
                ],
              ),
            ),
          ),
    );
  }
}

