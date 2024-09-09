import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/kid_detail_screen.dart';
import 'package:ileiwe/app/profile/profile_controller.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userStateNotifierProvider);
    final controller = ProfileController(ref: ref, context: context);
    
    return  AppContainer(
      canGoBack: false,
      title: "Profile",  
      children: [
          SliverPadding(
              padding:  const EdgeInsets.symmetric(horizontal: 20), 
              sliver: SliverList.list(
                children:  [
                  topDetailHeader(context, userId.firstName, userId.lastName, userId.email),
                  const SizedBox(height: 20,),
                   ProfileInformation(profileController: controller)
                  
                ],
              ),
            ),
    ],);
  }

  Container topDetailHeader(BuildContext context, firstName, lastName, String email) => Container(
      child:  Column(
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                const CircleAvatar(backgroundImage: AssetImage("assets/images/profile.png"), radius: 50,),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset("assets/icons/edit.svg"))
              ],
            )),
            const SizedBox(height: 10,),
             Text("$firstName $lastName", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18)),
             Text(email, style: const TextStyle(fontSize: 12),),
        ],
      ),
  );
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration:  BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(15)
      
      ),

      child: Column(
        children: [
          detailSection(context: context, title: "Edit Profile", 
          imageName: "profile_icon.svg",
            subTitle: "Manage Personal Information", action: () => context.push(RoutesName.editProfile)),
            
          detailSection(context: context, title: "My Subscription", 
          imageName: "subscription.svg",
            subTitle: "Notification about games", action: () => context.push(RoutesName.subscriptionPricing, extra: true) ),
          detailSection(context: context, title: "Messages", 
          imageName: "messages.svg",
            subTitle: "View messages", action: () => context.push(RoutesName.messages, extra: true) ),
          detailSection(context: context, title: "Privacy Settings", 
          imageName: "privacy.svg",
            subTitle: "App terms and conditions", action: () => {} ),
          detailSection(context: context, title: "App Feedback", 
          imageName: "feedback.svg",
            subTitle: "Feedback about app", action: () => {} ),
          detailSection(context: context, title: "Help & Support", 
          imageName: "support.svg",
            subTitle: "Support centre", action: () => {} ),
          detailSection(context: context, title: "Logout", 
          imageName: "logout.svg",
            subTitle: "Account info and logout", action: () => profileController.logout() ),
        ],
      )
    );
  }

  Widget detailSection({required BuildContext context, 
  required String title, required String subTitle,
  required String imageName, 
   required void Function() action}) =>  
  
  InkWell(
    onTap: () => action(),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child:  Row(
        
        children: [
          //image
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(10)
      
            ),
            child: SvgPicture.asset("assets/icons/$imageName", height: 18),
          ),
          const SizedBox(width: 10,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
              Text(subTitle, style: const TextStyle(color: Colors.black54),),
            ],
          )
        ],
      ),
    ),
  );
}