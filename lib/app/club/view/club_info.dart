import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/club/data/models/club.dart';
import 'package:ileiwe/app/dashboard/view/dashboard_screen.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/app/library/view/widget/custom_search.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
import 'package:ileiwe/cores/common/widgets/network_image.dart';
import 'package:ileiwe/cores/validator.dart';

class ClubInfo extends StatelessWidget {
  const ClubInfo({
    super.key,
    required this.clubDetails
  });

  final Club clubDetails;

  @override
  Widget build(BuildContext context) {
    TextEditingController reasonController = TextEditingController();
    bool hasAccepted = true;

    return  AppContainer(
      canGoBack: true,
      title: clubDetails.name,
      addHeader: true,
      child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                      Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(width: 15, color: Colors.white.withOpacity(0.5))
                  ),
                  width: double.infinity,
                  child:  Column(
                 
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                         ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: imageNetwork(clubDetails.imagePath,  
                              width: MediaQuery.of(context).size.width)
                        ),
                        const Gap(10),
                      Text(clubDetails.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      const Gap(5),
                      // Text(clubDetails.author)
                    ],
                  ),
                ),
              
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("About Club", 
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),),
                  const Gap(10),
                  Text(clubDetails.descriptionsOfClub, 
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),),
                  const Gap(30), 
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    // child: bookDetails.isPremium ?  nonPremiumButton(context) : premiumButton(context),
                  ),
                  const Gap(10),
                  const Text("What is briging you to this Club", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Gap(10),
                  InputFieldAuth(
           
                  fillColor: Colors.white30,
                  textColor: Colors.white,
                  label: "Write Reason", 
                  validator: (value) => isValidName(value!, field: "Reason is required"), 
                  controller: reasonController),
                                    
                   SizedBox(
                    width: MediaQuery.of(context).size.width,
                     child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox.adaptive(value: true, onChanged: (value) => hasAccepted = value ?? false),
                        const Expanded(child: Text("By signing up, I agree to club Terms & Conditions")),
                      ],
                                             ),
                   ),
                   const Gap(40),
                    Align(
                    alignment: Alignment.center,
                    child:
                     ButtonOne(
                      bgColor: Theme.of(context).colorScheme.secondary,
                      paddingGeo: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                      label: "Send Request")),
                  
                    const Gap(30),
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

