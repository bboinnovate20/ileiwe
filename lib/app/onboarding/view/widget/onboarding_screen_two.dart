  import 'package:flutter/material.dart';
import 'package:ileiwe/app/onboarding/view/widget/onboarding_bottom_info.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key, required this.action});

  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 152, 13, 176),
      
      bottomSheet: OnboardingButtonInfo(
                title: 'Empowering Young minds to enjoy learning',
                subTitle: 'Empower Young Minds \n Through Playful Learning',
                action: action,
                actionLabel: "Get Started",
                actionTextColor: const Color.fromARGB(255, 255, 119, 0),
                actionbgColor: Colors.white,
                thirdColor:  const Color.fromARGB(255, 247, 206, 96), 
                secondColor:  const Color.fromARGB(255, 240, 161, 108), 
                gradient:  const [Color.fromARGB(255, 245, 118, 34), Color.fromARGB(255, 245, 118, 34), Color.fromARGB(255, 255, 102, 0)]),
      
      body: const SizedBox(
        height: double.infinity,
        child: Center(
          child: Text('')),
      ),
    );
  }
}
