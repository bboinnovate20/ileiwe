
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';

class OnboardingButtonInfo extends StatefulWidget {


  const OnboardingButtonInfo({
    super.key,
    required this.gradient,
    required this.secondColor,
    required this.thirdColor,
    required this.title,
    required this.subTitle,
    required this.action,
    required this.actionLabel,
    this.actionTextColor,
    this.actionbgColor,
  });

  final List<Color> gradient;
  final Color secondColor;
  final Color thirdColor;
  final String title;
  final String subTitle;
  final String actionLabel;
  final void Function() action;
  final Color? actionbgColor;
  final Color? actionTextColor;

  @override
  State<OnboardingButtonInfo> createState() => _OnboardingButtonInfoState();
}

class _OnboardingButtonInfoState extends State<OnboardingButtonInfo> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation positionTween;
  late Animation positionTween2;
  
  @override
  void initState() {
    super.initState();  
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    positionTween = Tween<double>(begin: 20, end: 0).animate(_animationController);
    _animationController.forward();

    _animationController.addListener(() {
      setState(() {});
    });
  
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height /2,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      // color: Colors.purple,
      child: Stack(
        children: [
      
          
            Positioned.fill(
              bottom: positionTween.value,
              
              child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: widget.thirdColor,
              ),
              height: MediaQuery.of(context).size.height /2.5,
              // width: 20,
              width: double.infinity,
              ),
            ),
      
                    Positioned.fill(
                      bottom: 20 - double.parse(positionTween.value.toString()) ,
                      child: Container(
                                  
                                  
                                  margin: const EdgeInsets.symmetric(horizontal: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: widget.secondColor,
                                  ),
                                  height: MediaQuery.of(context).size.height /2.5,
                                  // width: 20,
                                  width: double.infinity),
                    ),
      
      
                    Positioned.fill(
                      // width: 50,
                      // height: 50,
                      bottom: 40,
                      child: Container(
                                
                                
                                padding: const EdgeInsets.all(10),
                                
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient:  LinearGradient(
                                    
                                    end: Alignment.centerLeft,
                                    stops: const [0.2,0.2,  1],
                                    begin: Alignment.centerRight,
                                    colors: widget.gradient),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                height: MediaQuery.of(context).size.height /2.5,
                                // width: 20,
                                width: double.infinity,
                                child:  MainContent(action: widget.action, 
                                actionLabel: widget.actionLabel, title: widget.title,
                                subTitle: widget.subTitle, actionTextColor: widget.actionTextColor, actionbgColor: widget.actionbgColor,)),
                    ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.action,
    required this.title,
    required this.subTitle,
    required this.actionLabel,
    this.actionbgColor,
    this.actionTextColor,
  });

  final void Function() action;
  final String title;
  final String subTitle;
  final String actionLabel;
  final Color? actionbgColor;
  final Color? actionTextColor;

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         
         Text(title, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
            
            textAlign: TextAlign.center,).animate().fadeIn(duration: 800.ms),
      // RichText(text: const TextSpan(children: [])),
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(subTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, height: 1.4), textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: ButtonOne(action: action, 
            paddingGeo: const EdgeInsets.symmetric(vertical: 10),
                width: 220,
                
                // height: 100,
                label: actionLabel, bgColor: actionbgColor, textColor: actionTextColor,),
        ),
      ],
    );
  }
}

