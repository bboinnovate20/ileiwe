
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';
import 'package:ileiwe/cores/extension.dart';
import 'package:ileiwe/cores/validator.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController usernameController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return  ContainerCustom(
      appBar:Container(
          
          decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: const Icon(Icons.arrow_back_rounded, size: 30, color: Color.fromARGB(255, 79, 6, 91),)),

      bottomSheet: Container(
        margin: const EdgeInsets.only(bottom: 50),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            ButtonOne(label: "Verify Account", action: () => context.go(RoutesName.kidDetails), 
            extend: true, border: Border.all(width: 0), bgColor: const Color.fromARGB(255, 255, 6, 255),)
          ],
               ),
       ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderContentAuth(
            right: 10,
            imageName: 'lock',
            mainHeader: "Verify Account", content: "Enter the code\nthat has been\nsent"),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(height: 1.5),
                    text: "Code has been sent to ",
                    children: [
                      TextSpan(text: "ileiwe@gmail.com", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "\nEnter the code to verify your account" )
                  ])),
      
      
            InputFieldAuth(
              fillColor: Colors.white30,
              textColor: Colors.white,
              label: "Enter the code", 
              validator: (value) => isValidName(value!, field: "Invalid Name"), 
              controller: usernameController).padding(top: 40, bottom: 10),
      
              RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(height: 1.5),
                    text: "Haven't received the code? ",
                    children: [
                      TextSpan(text: "Resend", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                  ])),
            
                    
              ],)
              
            ,),
          )
        ],
      ),

      
      
      );

    
    
    
    // Scaffold(
     

    //   backgroundColor: Colors.purple,
    //   appBar: AppBar(
    //     leadingWidth: 60,
    //     toolbarHeight: 50,
    //     backgroundColor: Colors.transparent,
    //     leading: Container(
          
    //       decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(15)),
          
    //       margin: const EdgeInsets.only(top: 10, left: 20),
    //       child: const Icon(Icons.arrow_back_rounded, size: 30, color: Color.fromARGB(255, 79, 6, 91),)),),
      
    //   body: 
      

    //    bottomSheet: 
    // );
  }
}

