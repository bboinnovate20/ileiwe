import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/extension.dart';

class PremiumPricingCard extends StatelessWidget {
  const PremiumPricingCard({super.key, required this.featuresList, required this.packageName, required this.pricing, required this.purchaseTitle});

  final List<String> featuresList;
  final String pricing;
  final String purchaseTitle;
  final String packageName;
  @override
  Widget build(BuildContext context) {

    

    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration:  BoxDecoration(
      color: const Color.fromARGB(255, 241, 245, 192),
      borderRadius: BorderRadius.circular(20),
      

      ),

      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              
              children: [
                const CircleAvatar(backgroundColor: Colors.purple,child: Text("T", style: TextStyle(color: Colors.white),),),
                 Text("$packageName \$$pricing", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),).padding(left: 10)
              ],
            ),
             ButtonOne(label: purchaseTitle, fontSize: 14, padding: const EdgeInsets.all(10), action: () => context.go(RoutesName.homeDashboard),)
          ],
        ),
        const SizedBox(height: 15),
        ...featuresList.map((features) => Text("${featuresList.indexOf(features)+1}. $features", style: const TextStyle(height: 1.8),),)
        
      ],),
    );
  }
}