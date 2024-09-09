import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
     final List<Map<String, String>> books = [
          {
            'title': 'Oral Storybook for Kids',
            'image': 'assets/images/sleep_over.png',
          },
          {
            'title': '108 Bedtime Stories',
            'image': 'assets/images/the_jungle.png',
          },
          {
            'title': "Emi's Beach Adventure",
            'image': 'assets/images/green_thumb.png',
          },
        ];

    return  AppContainer(
      canGoBack: true,
      title: "History",
      addHeader: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child:   SizedBox(
                            height: 500,
                            child:GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1 / 2.25,
                              children: List.generate(books.length, (index) {
                                final bk = books[index];
                                return Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.blue, 
                                      ),
                                      
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(bk['image'] as String, fit: BoxFit.cover,))
                                    ),
                                    const Gap(10),
                                    Text(bk['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold),), // Example text with index
                                  ],
                                );
                              }),
                            )

                          )

                        
   
      )
    );
  }
}