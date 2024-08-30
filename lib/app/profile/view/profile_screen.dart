import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppContainer(
      canGoBack: false,
      title: "Profile",  
      children: [
          SliverPadding(
              padding:  const EdgeInsets.symmetric(horizontal: 20), 
              sliver: SliverList.list(
                children:  [
                  topDetailHeader(context),
                  const SizedBox(height: 20,),
                  const ProfileInformation()
                  
                ],
              ),
            ),
    ],);
  }

  Container topDetailHeader(BuildContext context) => Container(
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
             Text("Ibrahim Ibrahim", style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18)),
            const Text("ibrahim@gmail.com", style: TextStyle(fontSize: 12),),
        ],
      ),
  );
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
  });

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
            subTitle: "Manage Personal Information", action: () => {} ),
            
          detailSection(context: context, title: "My Subscription", 
          imageName: "subscription.svg",
            subTitle: "Notification about games", action: () => {} ),
          detailSection(context: context, title: "Messages", 
          imageName: "messages.svg",
            subTitle: "View messages", action: () => {} ),
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
            subTitle: "Account info and logout", action: () => {} ),
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