import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/app/library/view/widget/custom_search.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
import 'package:ileiwe/cores/common/widgets/network_image.dart';

class SingleBookIntro extends StatelessWidget {
  const SingleBookIntro({
    super.key,
    required this.bookDetails
  });

  final Book bookDetails;

  @override
  Widget build(BuildContext context) {


    return  AppContainer(
      canGoBack: true,
      title: bookDetails.name,
      addHeader: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, right: 20, left: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 15, color: Colors.white.withOpacity(0.5))
                  ),
                  width: double.infinity,
                  child: Column(
                 
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                         ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: imageNetwork(bookDetails.imagePath,  
                              width: MediaQuery.of(context).size.width/1.5)
                        ),
                        const Gap(10),
                      Text(bookDetails.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      const Gap(5),
                      Text(bookDetails.author)
                    ],
                  ),
                ),
                const Gap(30),
                Text("Description", 
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),),
                const Gap(10),
                Text(bookDetails.description, 
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 14, color: Colors.black87),),
                const Gap(30), 
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  
                  ButtonOne(label: "Preview", 
                  border: Border.all(width: 0),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,),
                  const Gap(10),
                  const ButtonOne(label: "Subscribe Now", 
                  textColor: Colors.black,
                  bgColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,),
                              
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AllBooks extends StatelessWidget {
  const AllBooks({
    super.key,
    required this.book
  });

  final List<Book> book;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
                    height: 500,
                    child:GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1 / 2.25,
                      children: List.generate(book.length, (index) {
                        final bk = book[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: imageNetwork(bk.imagePath))
                            ),
                            const Gap(10),
                            Text(bk.name, style: const TextStyle(fontWeight: FontWeight.bold),), 
                            Text(bk.author, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54),), 
                          ],
                        );
                      }),
                    )
      
                  ),
    );
  }
}

