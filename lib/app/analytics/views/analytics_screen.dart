import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ileiwe/app/analytics/analytics_controller.dart';
import 'package:ileiwe/app/analytics/views/widget/assessment_card.dart';
import 'package:ileiwe/app/analytics/views/widget/performance_card.dart';
import 'package:ileiwe/app/dashboard/view/dashboard_screen.dart';
import 'package:ileiwe/app/dashboard/view/widgets/persistent_header.dart';
import 'package:ileiwe/app/quizes/models/data/skills.dart';
import 'package:ileiwe/app/quizes/providers/skills_provider.dart';
import 'package:ileiwe/cores/common/assessment.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/top_nav.dart';
import 'package:ileiwe/cores/utils/get_percentage.dart';

class AnalyticsScreen extends ConsumerWidget {
   const AnalyticsScreen({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final controller = AnalyticsController(controller: ref);

  //  controller.getSkillsAnalytics();
    

    return  AppContainer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:   controller.getAllSkills().when(data: (skill) {
            final allSkill = skill['skill'] as List;
            return CustomScrollView(
                  slivers: [
                     
                       SliverPersistentHeader(
                          pinned: true,
                          delegate: StickyHeaderDelegate(
                            child: const TopNav(title: "Progress Report", canGoBack: false),
                            maxHeight: 80, // Adjust this value based on your TopHeader height
                            minHeight: 60,  // Minimum height when fully collapsed
                          ),
                        ),
                    
                        SliverToBoxAdapter(child: PerformanceCard(performance: (skill['overallPerformance'] ?? 0.0) * 100.0, imagePath: "assets/images/happy_boy.png")),

                     
                    
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: 240,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: allSkill.length,
                            itemBuilder: (context, index) {
                              final assess = allSkill[index] as SkillsLearning;
                              final nSkill = skill['analytics'] != null ? (skill['analytics']as List).where((sk) => sk['quizId'] == assess.id): null;
                              print("nSkill");
                              print(nSkill?.length);
                              return Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: AssessmentAnalyticsSectionCard(
                                  title: assess.name,
                                  color: assessments[index]['pColor'],
                                  progress: nSkill == null || nSkill.isEmpty ? 0 : getPercentage(nSkill.first['currentChapter'] ?? 0, nSkill.first['totalQuiz'] ?? 100),
                                  imageName: assessments[index]['imageName'],
                                  gradientColor: assessments[index]['color'],
                                ),        
                              );
                            },
                          )  
                      ),
                    
                    )
                    
                    ]
          );
          }, error: (_,n) => const Text("Loading"), loading: () => const Text("loading"))
        )));
  }
}