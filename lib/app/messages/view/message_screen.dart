import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/app/profile/profile_controller.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/coin_reward.dart';




class MessageScreen extends ConsumerStatefulWidget {
  const MessageScreen({super.key});

  @override
  ConsumerState<MessageScreen> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<MessageScreen> {


  @override
  Widget build(BuildContext context) {


    return  AppContainer(
          addHeader: true,
          // singleHeader:
          title: "Messages",
          children: [
            
            SliverPadding(
              padding:  const EdgeInsets.all(15),
              sliver: SliverList.list(children:   [
        
                  messageCard(context)

              ]),
            )
          ]
    );
  }

  Widget messageCard(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RoutesName.chat),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:15, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
          
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             const CircleAvatar(backgroundImage: AssetImage("assets/images/profile.png"), radius: 26,),
             const Gap(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Friend 1", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)),
                  const Gap(6),
                  const Text("Hi hope you are good", style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
            const Column(
              children: [
            Text("2:30pm", style: TextStyle(fontSize: 12),),
            Gap(10),
            CircleAvatar(backgroundColor: Colors.blue, radius: 13, child: Text("1", style: TextStyle(color: Colors.white),),)
      
              ],
            )
          ],
        ),
      ),
    );
  }
}

