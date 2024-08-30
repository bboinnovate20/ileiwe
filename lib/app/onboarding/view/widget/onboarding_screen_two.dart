  import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ileiwe/app/onboarding/view/onboarding_screen.dart';
import 'package:ileiwe/app/onboarding/view/widget/onboarding_bottom_info.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key, required this.action, required this.isActive, required this.stateAction});

  final void Function() action;
  final bool isActive;
  final void Function() stateAction;


  @override
  Widget build(BuildContext context) {
    return    
    
    
    ContainerCustom(
                bottomSheet: OnboardingButtonInfo(
                title: 'Empowering Young minds to enjoy learning',
                subTitle: 'Empower Young Minds \n Through Playful Learning',
                action: action,
                actionLabel: "Get Started",
                actionTextColor: const Color.fromARGB(255, 255, 119, 0),
                actionbgColor: Colors.white,
                thirdColor:  const Color.fromARGB(255, 247, 206, 96), 
                secondColor:  const Color.fromARGB(255, 240, 161, 108), 
                gradient:  const [Color(0xFFF95B20), Color(0xFFF95B20), Color(0xFFE17628)]),
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/kid_brick_book.png', fit: BoxFit.cover, height: 320,)
                        .animate().shimmer(duration: 700.ms).scale(duration: 1000.ms, begin: const Offset(0.8, 0.8), end: const Offset(1, 1))),
                    ),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      activeBar(!isActive, stateAction),
                      const SizedBox(width: 10),
                      activeBar(isActive, () {}),
                    ],
                  )
                ],
              ));  
    
  }
}
