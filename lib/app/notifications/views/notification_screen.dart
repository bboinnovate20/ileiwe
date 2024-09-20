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




class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<NotificationScreen> {


  @override
  Widget build(BuildContext context) {


    return  AppContainer(
          addHeader: true,
          // singleHeader:
          title: "Notifications",
          children: [
            
            SliverPadding(
              padding:  const EdgeInsets.all(20),
              sliver: SliverList.list(children:   [
        
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(10)
                            
                          ),
                    child:  Column(
                      children: [
                          notificationCard(),
                          notificationCard(),
                          notificationCard(),
                          notificationCard(),
                          notificationCard(),
                      ] 
                    ),
                  )

              ]),
            )
          ]
    );
  }

  Container notificationCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
           child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/images/profile.png"), radius: 26,),
              Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You got first rank in the club"),
                  Text("2 minn ago", style: TextStyle(color: Colors.grey))
                ],
              )
            ],
           ),
       );
  }


}

