
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/app/profile/profile_controller.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/coin_reward.dart';




class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<ChatScreen> {


  @override
  Widget build(BuildContext context) {


    return  AppContainer(
          addHeader: true,
          // singleHeader:
          title: "Admin",
          children: [
            
            SliverPadding(
              padding:  const EdgeInsets.all(15),
              sliver: SliverList.list(children:   [
                  const Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(color: Colors.black54, height: 10,)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Today 1st September, 2024", style: TextStyle(color: Colors.black54),)),
                      Expanded(child: Divider(color: Colors.black54, height: 10,)),
                    ],
                  ),
                  const Gap(20),
                  Column(
                    children: [

                      messageCard(context, message: "How are you doing! Let's play"),
                      messageCard(context, message: "How are you doing! Let's play"),
                      messageCard(context, message: "How are you doing! Let's play"),
                      
                    ],
                  )

              ]),
            )
          ]
    );
  }

  Widget messageCard(BuildContext context, 
   {required String message}) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal:15, vertical: 20),
          width: MediaQuery.of(context).size.width /1.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
            
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
               const Gap(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Friend 1", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)),
                    const Gap(6),
                     Text(message, style: const TextStyle(color: Colors.grey),),
                    const Gap(6),
                     ButtonTwo(label: "Play", 
                      bgColor: Theme.of(context).colorScheme.secondary,
                      paddingGeo: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),)
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ],
    );
  }
}

