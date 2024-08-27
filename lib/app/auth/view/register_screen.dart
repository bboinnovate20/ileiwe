
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/login_screen.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/validator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController usernameController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return  Scaffold(
     

      backgroundColor: Colors.purple,
      appBar: AppBar(
        leadingWidth: 60,
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        leading: Container(
          
          decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(15)),
          
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: const Icon(Icons.arrow_back_rounded, size: 30, color: Color.fromARGB(255, 79, 6, 91),)),),
      
      body: CustomScrollView(
        slivers: [
          SliverList.list(children: [
            Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeaderContentAuth(mainHeader: "Create Account", content: "Register\nand create account\ntoday!"),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "First Name", 
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                   InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "Last Name", 
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "Enter Email", 
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                      
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "Enter Phone Number", 
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                  
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    isSecured: true,
                    label: "Create Password",
                    hintText: "Must be at least 8 character long",
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                
                InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    isSecured: true,
                    label: "Confirm Password",
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),

                InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "Enter Email", 
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                      
                ButtonOne(label: "Sign Up", extend: true, action: () =>context.go(RoutesName.verifyAccount), 
                
                border: Border.all(width: 0), bgColor: const Color.fromARGB(255, 255, 6, 255),),
                
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: InkWell(
                      // onTap: ()  => context.go(RoutesName.register),
                      child: RichText(text: const TextSpan(
                        text: "By signing up, I agree to ",
                        children: [
                          
                          TextSpan(text: "Terms & Conditions", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                      ])),
                    ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:40.0, bottom: 30),
                  child: InkWell(
                      onTap: ()  => context.go(RoutesName.login),
                      child: RichText(
                        
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16),
                        text: "Already have an account? ",
                        children: [
                          
                          TextSpan(text: "Login In", style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                    ),
                ),
                ],
              ),
            ),
          ),
          ])
        ],
        
      ),

       
    );
  }
}
