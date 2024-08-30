import 'package:flutter/material.dart';
import 'package:ileiwe/app/analytics/views/widget/assessment_card.dart';
import 'package:ileiwe/app/analytics/views/widget/performance_card.dart';
import 'package:ileiwe/app/dashboard/view/dashboard_screen.dart';
import 'package:ileiwe/app/dashboard/view/widgets/persistent_header.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/top_nav.dart';

class AnalyticsScreen extends StatelessWidget {
   const AnalyticsScreen({super.key,});


  @override
  Widget build(BuildContext context) {

   final List<Map<String, dynamic>> assessments = [
          {
            'title': "Reading",
            'imageName': "reading_little_boy",
            'color': [const Color(0xFF95D1FC), const Color(0xFF3F44D8)],
            'progress': 20,
            
          },
          {
            'title': "Writing",
            'imageName': "girl_writing",
            'color': [const Color(0xFFFD5A20), const Color(0xFFE2772F)],
            'progress': 70,
            'pColor': Colors.red
          },
          {
            'title': "Literacy",
            'imageName': "little_boy_reading_smile",
            'color': [const Color(0xFFFDD667), const Color(0xFFD6B835)],
            'progress': 50,
            'pColor': const Color.fromARGB(255, 136, 123, 5)
          }

    ];


    return  AppContainer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
                  slivers: [
                     SliverPersistentHeader(
                      pinned: true,
                      delegate: StickyHeaderDelegate(
                        child: const TopNav(title: "Progress Report", canGoBack: false),
                        maxHeight: 80, // Adjust this value based on your TopHeader height
                        minHeight: 60,  // Minimum height when fully collapsed
                      ),
                    ),
                    const SliverToBoxAdapter(child: PerformanceCard(performance: 50, imagePath: "assets/images/happy_boy.png")),
                    
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: 240,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: assessments.length,
                            itemBuilder: (context, index) {
                              final assess = assessments[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: AssessmentAnalyticsSectionCard(
                                  title: assess['title'],
                                  color: assess['pColor'],
                                  progress: double.parse(assess['progress'].toString()),
                                  imageName: assess['imageName'],
                                  gradientColor: assess['color'],
                                ),
                        
                                
                              );
                            },
                          ),
                      ),
                    
                    )
                    
                    ]
          ),
        )));
  }
}