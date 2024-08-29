
import 'package:flutter/material.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/subscription/view/widgets/premium_card.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';

class SubscriptionPricingScreen extends StatelessWidget {
  const SubscriptionPricingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController usernameController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    const starterPack = [
      "Access to Course Library",
      "Access to Collaboration Desk",  
      "Access to Game Library Desk",  
      "No Access to Skit Library",  
      "No Access to Short Story Library",  
      "No Access to Reading and Writing Club",  
    ];
    const valuePack = [
      "Access to Course Library",
      "Access to Collaboration Desk",  
      "Access to Game Library Desk",  
      "Access to Skit Library",  
      "No Access to Short Story Library",  
      "No Access to Reading and Writing Club",  
    ];

    const premiumPack = [
      "Access to Course Library",
      "Access to Collaboration Desk",  
      "Access to Game Library Desk",  
      "Access to Skit Library",  
      "Access to Short Story Library",  
      "Access to Reading and Writing Club",  
      "30 days book rentals",  
      "Access to Exclusive Content days book rentals",  
    ];

    return  ContainerCustom(
      
      child:       CustomScrollView(
        slivers: [
          SliverList.list(children: [
                        const SizedBox(height: 50,) ,                    
            const HeaderContentAuth(
                    imageName: 'award',
                    mainHeader: "Subscription", content: "Unlock endless fun\nby learning with\npremium"),

            Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.only(bottom: 30),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  SizedBox(height: 20),
                  SizedBox(height: 20),

                 Text("You Got 7 DAYS FREE Trial of \n Premium Pack", textAlign: TextAlign.center, 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                    ),

                 PremiumPricingCard(featuresList: starterPack, packageName: "Starter Pack", pricing: "5.99", purchaseTitle: "Purchase",),
                 
                 PremiumPricingCard(featuresList: starterPack, packageName: "Value Pack", pricing: "14.99", purchaseTitle: "Active Pack",),

                 PremiumPricingCard(featuresList: starterPack, packageName: "Premium Pack", pricing: "19.99", purchaseTitle: "Active Pack",)
                ],
              ),
            ),
          ),
          ])
        ],
        
      ),);
    
    
    
  }
}
