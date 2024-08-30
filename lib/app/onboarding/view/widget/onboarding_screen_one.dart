import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ileiwe/app/onboarding/view/onboarding_screen.dart';
import 'package:ileiwe/app/onboarding/view/widget/onboarding_bottom_info.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key, required this.action, required this.isActive, required this.stateAction});

  final Function action;
  final bool isActive;
  final Function() stateAction;

  // final void Function() action;

  @override
  Widget build(BuildContext context) {
    return  ContainerCustom(
              bottomSheet: OnboardingButtonInfo(
                title: 'Experience the joy\nof learning,\nAnywhere',
                subTitle: 'Empower Young Minds \n Through Playful Learning',
                action: () => action(),
                actionLabel: "Next",
                thirdColor:  const Color.fromARGB(255, 138, 190, 232), 
                secondColor:  const Color.fromARGB(255, 32, 151, 249), 
                gradient:  const [Color.fromARGB(255, 2, 129, 233), Color.fromARGB(255, 2, 129, 233), Color.fromARGB(255, 104, 181, 244)]),
           
              child: 
              
              Column(
                children: [
                  
                  
                  SafeArea(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/learning_kid.png', fit: BoxFit.cover, height: 320,)
                        .animate().shimmer(duration: 700.ms).scale(duration: 1000.ms, begin: const Offset(0.8, 0.8), end: const Offset(1, 1))),
                    ),
                  ),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      activeBar(isActive, () => {}),
                      const SizedBox(width: 10),
                      activeBar(!isActive,stateAction),
                    ],
                  )
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Transform.translate(
                  //     offset: const Offset(0, -20),
                  //     child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                          
                  //         activeBar(isActive, () => print('ddd')),
                  //         const SizedBox.square(dimension: 10,),
                  //         activeBar(false, () => print('22')),
                  //       ],
                  //     ),
                  //   )),
                ],
              )
              );  
    
    
   
  }
}
