
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';

class AssessmentAnalyticsSectionCard extends StatelessWidget {
   const AssessmentAnalyticsSectionCard({
    super.key,
    required this.title,
    required this.imageName,
    required this.gradientColor,
    required this.progress,
    this.color
  });

  final String title;
  final String imageName;
  final List<Color> gradientColor;
  final double progress;
  final Color? color;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
         
          Container(
            
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient:   LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColor)
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  Text(title, textAlign: TextAlign.center, 
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18, color: Colors.white)),
                  
                  Container(padding: const EdgeInsets.all(0.5), color: Colors.white, width: 120, margin: const EdgeInsets.symmetric(vertical: 8),),
                  
                   Text("$progress%", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: 110,
                    child: LinearProgressIndicator(
                                        minHeight: 10,
                                        borderRadius: BorderRadius.circular(5),
                                        value: 1 - ((100 - progress) / 100) ,
                                        backgroundColor: Colors.grey[200],
                                        valueColor:  AlwaysStoppedAnimation<Color>(color ?? gradientColor[1].withOpacity(0.6)),
                    ),
                  )
              ],
            ),
          ),
           Positioned(
            top: -40,
            right: 0,
            left: 0,
            child: Image.asset("assets/images/$imageName.png", height: 140).animate().scale(duration: 300.ms)),


          
          
        ],
      ),
    );
  }
}

class MainCardDashboard extends StatelessWidget {
  const MainCardDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(offset: Offset(5, 5), blurRadius: 15, color: Colors.black38)],
            gradient:   const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFFECB3B),Color(0xFFC3AC16)]),
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Read\nStories\nTo your Kid", style: 
                  Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 28, color: Colors.white),).
                          animate().fadeIn(duration: 300.ms).moveY(duration: 300.ms).blurY(duration: 400.ms, begin: 40, end: 0),
          
               Padding(
                 padding: const EdgeInsets.only(top:15.0),
                 child: ButtonOne(label: "Read Now", border: Border.all(color: Colors.transparent), 
                      bgColor: const Color(0xFFAE3ACA),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), radius:  BorderRadius.circular(20)),
               )
            ],
          )
        ),

        Positioned(
          right: 0,
          top: 40,
          child: Image.asset("assets/images/library.png", height: 200).animate().fadeIn(duration: 500.ms).shake(duration: 400.ms))
      ],
    );
  }
}

class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello,", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize:20)),
              
              Text("Ile Iwe,", style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/coin_reward.png", height: 25,),
                    const SizedBox(width: 5,),
                    const Text("350", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13)
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset("assets/icons/email.svg", height: 15,),
                    Positioned(
                      right: -2,
                      top: -3,
                      child: Container(decoration:  BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)), 
                                padding: const EdgeInsets.all(5),),
                    )
                  ],
                ),
              ),
             Container(
                
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 11),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13)
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset("assets/icons/notification.svg", height: 19,),
                    Positioned(
                      right: -2,
                      top: -3,
                      child: Container(decoration:  BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)), 
                                padding: const EdgeInsets.all(5),),
                    )
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
