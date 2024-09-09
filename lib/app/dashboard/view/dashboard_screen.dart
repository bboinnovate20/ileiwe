import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/kid_detail_screen.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/dashboard/view/home_screen.dart';
import 'package:ileiwe/app/dashboard/view/widgets/persistent_header.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/providers/skills_provider.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/assessment.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';



class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   

    final List<Map<String, dynamic>> explore = [
          {
            'id': "5oTOqxw7sPxlBwmFrg8n",
            'title': "E-book Library",
            'imageName': "book",
            'action': () => context.push(RoutesName.eLibrary)
          },
          {
            "id": "CWvEczgUa4CLvkjkOipx",
            'title': "Skit Library",
            'imageName': "mask",
            'action': () => context.push(RoutesName.skitLibrary)
            
          },
          {
            "id": "BrTsCPjOp312bQNxHpu0",
            'title': "Stories Library",
            'imageName': "note_flower",
            
          },
          {
            'title': "Exclusive Club",
            'imageName': "note",
            
          }

    ];

     final allSkills = ref.watch(skillsLearningProvider);

    return AppContainer(
           

            child: SafeArea(
              child: CustomScrollView(
                slivers: [
                   SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyHeaderDelegate(
                      child: TopHeader(name: ref.watch(userStateNotifierProvider).firstName, 
                                coinEarned: ref.watch(userStateNotifierProvider).kidInfo?.coinEarned ?? 0 ,),
                      maxHeight: 60, // Adjust this value based on your TopHeader height
                      minHeight: 60,  // Minimum height when fully collapsed
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const MainCardDashboard(),
                        
                        SizedBox(
                          height: 220, 
                child: allSkills.when(data: (skill) {
                  return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (skill['skill'] as List).length,
                  itemBuilder: (context, index) {
                    final allSkills = skill['skill'];

                    final assess = allSkills[index] as SkillsLearning;
                    return Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: AssessmentSectionCard(
                        title: assess.name,
                        imageName: assessments[index]['imageName'],
                        gradientColor: assessments[index]['color'],
                        action: () => context.push(RoutesName.quizInstruction, extra: assess),
                      ),

                      
                    );
                  },
                );
                }, error: (err, _) {
                  print(err);
                  print(_);
                  return SizedBox(height: 20, width: 20, child: Text("$err"),);
                }, 
                      loading: () => const SizedBox(height: 20, width: 20,))
              ),
                const SizedBox(height: 25),
                ExploreFeatures(assessments: explore),
                const SizedBox(height: 15),
                const ContinueReadingCard(
                    title: 'Disney/Pixar Elemental Middle Grade Novel',
                    author: 'Meredith Rusu',
                    coverImagePath: 'assets/images/reading_book.png',
                    progress: 0.73,
                  )
            ],
          ),
        ),
      ],
    ),
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
      child:  GestureDetector(
        onTap: assess['action'],
        child: Column(
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
      ),
    );
  }
}

class AssessmentSectionCard extends StatelessWidget {
  const AssessmentSectionCard({
    super.key,
    required this.title,
    required this.imageName,
    required this.gradientColor,
    required this.action
  });

  final String title;
  final String imageName;
  final List<Color> gradientColor;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: GestureDetector(
        onTap: () => action(),
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
    required this.name,
    required this.coinEarned
  });

  final String name;
  final int coinEarned;

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
              
              Text("$name,", style: Theme.of(context).textTheme.titleLarge),
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
                    Text("$coinEarned", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
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
                child:  GestureDetector(
                  onTap: () => context.push(RoutesName.notification),
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
