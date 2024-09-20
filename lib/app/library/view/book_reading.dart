import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';

class BookReading extends StatelessWidget {
  const BookReading({super.key,
  required this.bookDetail,
  });

  final Book bookDetail;

  @override
  Widget build(BuildContext context) {
    return  AppContainer(
      canGoBack: true,
      title: bookDetail.name,
      addHeader: true,
      child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Picture
              const Gap(30),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("assets/images/sleep_over.png", fit: BoxFit.cover,)),
              ),
          
              //chapters
              const Gap(20),
               Text("Chapter 1", style: Theme.of(context).textTheme.titleLarge,),
              const Gap(10),
               const Text(
              '''Sarah had always felt there was something different about her family, but she could never quite put her finger on it. The hushed conversations that stopped when she entered a room, the meaningful glances exchanged between her parents, and the way her older brother would sometimes stare off into the distance with a haunted look in his eyes - all of it hinted at an unspoken truth lurking beneath the surface of their seemingly normal lives.

              It wasn't until her 18th birthday that Sarah finally learned the truth. As she sat at the kitchen table, her parents revealed that their family was part of an ancient secret society, tasked with protecting powerful artifacts from those who would misuse them. The weight of this revelation settled on Sarah's shoulders, and she realized that her life would never be the same. She now had to decide whether to embrace this legacy or forge her own path, all while grappling with the knowledge that the world was far more mysterious and dangerous than she had ever imagined.''',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
              ),
              const Gap(40),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const ButtonTwo(label: "Previous Page", 
                    textColor: Colors.black, bgColor: Colors.grey, 
                    paddingGeo: EdgeInsets.symmetric(vertical: 8, horizontal: 10),),
                    ButtonTwo(label: "Next Page",  
                    bgColor: Theme.of(context).colorScheme.secondary,
                    paddingGeo: const EdgeInsets.symmetric(vertical: 8, horizontal: 10))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}