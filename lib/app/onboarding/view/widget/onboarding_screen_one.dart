import 'package:flutter/material.dart';
import 'package:ileiwe/app/onboarding/view/widget/onboarding_bottom_info.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key, required this.action});

  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 152, 13, 176),
      
      bottomSheet: OnboardingButtonInfo(
                title: 'Experience the joy of learning, Anywhere',
                subTitle: 'Empower Young Minds \n Through Playful Learning',
                action: () => action(),
                actionLabel: "Next",
                thirdColor:  const Color.fromARGB(255, 138, 190, 232), 
                secondColor:  const Color.fromARGB(255, 32, 151, 249), 
                gradient:  const [Color.fromARGB(255, 2, 129, 233), Color.fromARGB(255, 2, 129, 233), Color.fromARGB(255, 104, 181, 244)]),
                
      body: const SizedBox(
        height: double.infinity,
        child: Center(
          child: Text('')),
      ),
    );
  }
}
