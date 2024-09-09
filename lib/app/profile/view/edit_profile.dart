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




class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {


    bool loading = false;
    bool fieldDirty = false;
    late ProfileController controller;

    Map<String, dynamic> updatedForm = const 
      Register(firstName: "", lastName: "", email: "", phoneNumber: "", password: "").toJson();
    
    onChange(String fieldName,  String value) {
        setState(() {
          fieldDirty = true;
          updatedForm[fieldName] = value;
        });
    }

    isFieldEmpty() {
      Register data = Register.fromJson(updatedForm);

      return data.email.isEmpty && data.firstName.isEmpty && data.lastName.isEmpty 
            && data.phoneNumber.isEmpty && data.password.isEmpty;
          
    }

    onSubmit() async {
      setState(() {
        loading =true;
      });
      await controller.updateInfo(Register.fromJson(updatedForm));

      setState(() {
        loading =false;
      });
      
    }

    @override
  void initState() {

    super.initState();
    controller = ProfileController(ref: ref, context: context);
  }


  @override
  Widget build(BuildContext context) {

    final coin = ref.watch(userStateNotifierProvider).kidInfo?.coinEarned ?? 0;
    final getUser = ref.watch(userStateNotifierProvider);
    

    return  AppContainer(
          addHeader: true,
          // singleHeader:
          title: "Edit Profile",
          children: [
            
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: SliverList.list(children:   [
                  topDetailHeader(context, coin),
                  InputFieldAuth(
                    onChange: (value) => onChange("firstName", value),
                    bottomMargin: 0,
                    hintText: "First Name",
                    labelText: "First Name",
                    initialValue: getUser.firstName,
                    textStyle: const TextStyle(color: Colors.black),
                    labelTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
                    textColor: Colors.black,
                    fillColor: const Color(0xFFFAE5F2),
                    labelStyle: const TextStyle(color: Colors.black),
                    otherSuffix: SvgPicture.asset(
                                    alignment: Alignment.centerLeft,
                                    "assets/icons/edit_icon.svg",
                                    fit: BoxFit.scaleDown,
                                    // colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                                    semanticsLabel: 'Edit Close'),
                    
                    label: "", validator: (value) => null),
                
                InputFieldAuth(
                  onChange: (value) => onChange("lastName", value),
                  bottomMargin: 0,
                  labelText: "Last Name",
                  initialValue: getUser.lastName,
                  labelTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  textColor: Colors.black,
                  textStyle: const TextStyle(color: Colors.black),
                  fillColor: const Color(0xFFFAE5F2),
                  labelStyle: const TextStyle(color: Colors.black),
                  otherSuffix: SvgPicture.asset(
                                  alignment: Alignment.centerLeft,
                                  "assets/icons/edit_icon.svg",
                                  fit: BoxFit.scaleDown,
                                  // colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                                  semanticsLabel: 'Edit Close',  height: 20, width: 20,),
                  
                  label: "", validator: (value) => null),

                InputFieldAuth(
                  onChange: (value) => onChange("email", value),
                  bottomMargin: 0,
                  initialValue: getUser.email,
                  labelText: "Email ID",
                  textStyle: const TextStyle(color: Colors.black),
                  labelTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  textColor: Colors.black,
                  fillColor: const Color(0xFFFAE5F2),
                  labelStyle: const TextStyle(color: Colors.black),
                  // otherSuffix: SvgPicture.asset(
                  //                 alignment: Alignment.centerLeft,
                  //                 "assets/icons/edit_icon.svg",
                  //                 fit: BoxFit.scaleDown,
                  //                 // colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  //                 semanticsLabel: 'Edit Close',  height: 20, width: 20,),
                  
                  label: "", validator: (value) => null),
                
                InputFieldAuth(
                  onChange: (value) => onChange("phoneNumber", value),
                  bottomMargin: 0,
                  labelText: "Phone Number",
                  initialValue: getUser.phoneNumber,
                  textStyle: const TextStyle(color: Colors.black),
                  labelTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  textColor: Colors.black,
                  fillColor: const Color(0xFFFAE5F2),
                  labelStyle: const TextStyle(color: Colors.black),
                  otherSuffix: SvgPicture.asset(
                                  alignment: Alignment.centerLeft,
                                  "assets/icons/edit_icon.svg",
                                  fit: BoxFit.scaleDown,
                                  // colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                                  semanticsLabel: 'Edit Close',  height: 20, width: 20,),
                  
                  label: "", validator: (value) => null),
                
                InputFieldAuth(
                  onChange: (value) => onChange("password", value),
                  // bottomMargin: 10,
                  labelText: "Password",
                  initialValue: "*******",
                  textStyle: const TextStyle(color: Colors.black),
                  labelTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  textColor: Colors.black,
                  fillColor: const Color(0xFFFAE5F2),
                  labelStyle: const TextStyle(color: Colors.black),
                  otherSuffix: SvgPicture.asset(
                                  alignment: Alignment.centerLeft,
                                  "assets/icons/edit_icon.svg",
                                  fit: BoxFit.scaleDown,
                                  // colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                                  semanticsLabel: 'Edit Close',  height: 20, width: 20,),
                  
                  label: "********", validator: (value) => null),

                   ButtonOne(
                    label: "Save Changes",
                    // height: 100,
                    isDisabled: !fieldDirty,
                    loading: loading,
                    action: () => onSubmit(),
                    extend: true,
                    paddingGeo: const EdgeInsets.symmetric(vertical: 25),
                    bgColor: Theme.of(context).colorScheme.secondary,
                    border: Border.all(color: Colors.transparent),
                  
                  )

              ]),
            )
          ]
    );
  }
}


  Container topDetailHeader(BuildContext context, int coin) => Container(
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
            const Gap(10),
            rewardWidget(context, coin)
        ],
      ),
  );
