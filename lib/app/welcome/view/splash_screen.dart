import 'package:flutter/material.dart';
import 'package:ileiwe/app/welcome/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}



class _SplashScreenState extends State<SplashScreen> {

  final SplashScreenController _splashScreenController = const SplashScreenController();

  double opacity = 0;


  initializeAnimation()  {
    // if(!context.mounted) return;
    Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            opacity = 1;
          });

        },); 
        
      Future.delayed(const Duration(seconds: 5), () {
        _splashScreenController.decideNextScreen(context);   
      });
  }

  @override
  void initState() {
    super.initState();
    initializeAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('ddispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(opacity: opacity,  duration: const Duration(seconds: 4), child: Text("Ile Iwe", style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 100, color: Colors.white))),
            const Text("LEARNING MEETS CREATIVITY", style: TextStyle(letterSpacing: 3, fontSize: 10, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}