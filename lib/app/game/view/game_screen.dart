import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/dashboard/view/home_screen.dart';
import 'package:ileiwe/app/dashboard/view/widgets/badges_section.dart';
import 'package:ileiwe/app/dashboard/view/widgets/persistent_header.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';



class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> assessments = [
          {
            'title': "Reading",
            'imageName': "reading_little_boy",
            'color': [const Color(0xFF95D1FC), const Color(0xFF3F44D8)]
          },
          {
            'title': "Writing",
            'imageName': "girl_writing",
            'color': [const Color(0xFFFD5A20), const Color(0xFFE2772F)]
          },
          {
            'title': "Literacy",
            'imageName': "little_boy_reading_smile",
            'color': [const Color(0xFFFDD667), const Color(0xFFD6B835)]
          }

    ];

    final List<Map<String, dynamic>> explore = [
          {
            'title': "E-book Library",
            'imageName': "book",
            
          },
          {
            'title': "Skit Library",
            'imageName': "mask",
            
          },
          {
            'title': "Stories Library",
            'imageName': "note_flower",
            
          },
          {
            'title': "Exclusive Club",
            'imageName': "note",
            
          }

    ];

    return AppContainer(
            
            child: SafeArea(
              child: CustomScrollView(
                slivers: [
                   SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyHeaderDelegate(
                      child: const TopHeader(),
                      maxHeight: 60, // Adjust this value based on your TopHeader height
                      minHeight: 60,  // Minimum height when fully collapsed
                    ),
                  ),
              SliverToBoxAdapter(
                child:SizedBox(
                  height: MediaQuery.of(context).size.height * 1.2,
                  child: Column(
                    children: [
                      Padding(
                              padding: const EdgeInsets.all(16.0), 
                              child: _gameIntroCard(context),
                            ),
                            const SizedBox(height: 20),
                            const Expanded(child: Badges())
                        
                    ],
                  ),
                )
              )
      ],
    ),
  ),
);
  }

  Container _gameIntroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          

        ),

        child: Column(
          children: [
            //header
            ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                child: Image.asset(
                  "assets/images/holo_game.png",

                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Holocard Game", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20)),
                       ButtonTwo(label: "200+ Players Online", 
                       style: const TextStyle(fontSize: 10, color: Colors.green),
                        bgColor: Colors.green.shade50,
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10), fontSize: 10,)
                    ],
                  ),
                  const ButtonTwo(label: "Play", 
                  bgColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),)
                ],
                
              ),
            ),
            const Divider(),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("To play this game you need"),
             
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/coin_reward.png", height: 25,).animate(autoPlay: true, 
                    // onPlay: (controller) => controller.repeat(),
                    
                    ).shimmer(duration: 1000.ms),
                    const SizedBox(width: 5,),
                    const Text("350", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                  ],
                )
                ],
                
              ),
            ),
          ],
        ),
                
      );
  }
}

class ContinueReadingCard extends StatelessWidget {
  final String title;
  final String author;
  final String coverImagePath;
  final double progress;

  const ContinueReadingCard({
    super.key,
    required this.title,
    required this.author,
    required this.coverImagePath,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 100),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Continue reading',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18)
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  coverImagePath,
                  width: 95,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'By $author',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                      color: const Color(0xFF7A00AA),
                      borderRadius: BorderRadius.circular(10)

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Reading Progress',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text("${(progress * 100).toInt()}%", 
                                      style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),)
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(5),
                              value: progress,
                              backgroundColor: Colors.grey[200],
                              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD3FE)),
                            ),
                        ],
                      ),
                    )
                    
                    
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ExploreFeatures extends StatelessWidget {
  const ExploreFeatures({
    super.key,
    required this.assessments,
  });

  final List<Map<String, dynamic>> assessments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("Explore", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18),),
          SizedBox(
                    height: 150, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: assessments.length,
            itemBuilder: (context, index) {
              final assess = assessments[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ExploreLibraryCard(assess: assess),
          
                
              );
            },
          ),
                        ),
        ],
      ),
    );
  }
}

class ExploreLibraryCard extends StatelessWidget {
  const ExploreLibraryCard({
    super.key,
    required this.assess,
  });

  final Map<String, dynamic> assess;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child:  Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical:10, horizontal: 10),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Image.asset("assets/images/${assess['imageName']}.png", height: 80,),),
           Text(assess['title'], style: const TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

class AssessmentSectionCard extends StatelessWidget {
  const AssessmentSectionCard({
    super.key,
    required this.title,
    required this.imageName,
    required this.gradientColor
  });

  final String title;
  final String imageName;
  final List<Color> gradientColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          Container(
            height: 180,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
                  
                  const Text("Start Practicing", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),

          Positioned(
            top: -40,
            right: 0,
            left: 0,
            child: Image.asset("assets/images/$imageName.png", height: 140).animate().scale(duration: 300.ms))
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
