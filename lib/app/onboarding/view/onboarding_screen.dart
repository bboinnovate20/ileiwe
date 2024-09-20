import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/onboarding/view/widget/onboarding_screen_one.dart';
import 'package:ileiwe/app/onboarding/view/widget/onboarding_screen_two.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/speak.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {


  double active = 1;

  

  @override
  Widget build(BuildContext context) {
    playMusic("sounds/pop.mp3");
    return  active == 1 ? OnboardingScreenOne( 
                action: () => setState(() => active = 2,),  
                stateAction: () => setState(() => active = 2,), isActive: active == 1) :
                OnboardingScreenTwo(
                  action: () => context.go(RoutesName.login), isActive: active ==2, 
                  stateAction: () => setState(() => active = 1,));
              // Stack(children: [
              //   active == 1 ?  OnboardingScreenOne(action: () => setState(() => active =2),) :
              //        OnboardingScreenTwo(action: () => context.go(RoutesName.login)),
              //   Center(child: Container(
              //     margin: const EdgeInsets.only(bottom: 40),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
                    
              //       children: [
              //         activeBar(active == 1, () => setState(() => active=1)),
              //         const SizedBox.square(dimension: 10,),
              //         activeBar(active == 2, () => setState(() => active=2))
              //       ],
              //     ))
                  
              //     )
              // ]
    
      
  }
}

Widget activeBar (bool isActive, Function action) {
  return GestureDetector(
    onTap: () => action(),
    child: Container(
                          height: 8,
                          width: isActive ? 25 : 15,
                          decoration: 
                          BoxDecoration(color: isActive ? const Color.fromARGB(255, 232, 130, 250) : Colors.white, 
                            borderRadius: BorderRadius.circular(20)), 
                              padding: const EdgeInsets.all(1),),
  );
}