
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/login_screen.dart';
import 'package:ileiwe/app/auth/view/widget/custom_selection.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/validator.dart';

class KidDetailScreen extends StatelessWidget {
  const KidDetailScreen({super.key});

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
                  const HeaderContentAuth(mainHeader: "Basic Info", 
                      content: "Help us know more\nabout your kid's\npersonality"),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  InputFieldAuth(
                    bottomMargin: 0,
                    labelText: "Enter kid's age",
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "Enter age", 
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                   InputFieldAuth(
                    bottomMargin: 0,
                    labelText:  "Enter kid's hobby", 
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label:"Enter hobby",
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                  CustomSelectionField(
                    bottomMargin: 0,
                    labelText: "Enter Kids' Favourite Subject",
                    onChangedValue: (value) => {}, options: const [
                    {'id': 1, 'name': "Mathematics"},
                    {'id': 2, 'name': "English"}, ], 
                  
                  label: "Select Subject"),

                  CustomSelectionField(
                    bottomMargin: 0,
                    labelText: "Which learning Category Interest you most",
                    onChangedValue: (value) => {}, options: const [
                    {'id': 1, 'name': "Mathematics"},
                    {'id': 2, 'name': "English"}, ], 
                  
                  label: "Select Category"),

                  CustomSelectionField(
                    bottomMargin: 0,
                    labelText: "Which categories are challenging for you",
                    onChangedValue: (value) => {}, options: const [
                    {'id': 1, 'name': "Mathematics"},
                    {'id': 2, 'name': "English"}, ], 
                  
                  label: "Select Category"),
                  InputFieldAuth(
                    bottomMargin: 0,
                    labelText: "What do you hope to gain from this app?",
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "Enter text", 
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                 
                  
                const SizedBox(height: 35),
                ButtonOne(label: "Start Learning", extend: true, action: () =>context.go(RoutesName.subscriptionPricing), 
                
                border: Border.all(width: 0), bgColor: const Color.fromARGB(255, 255, 6, 255),),
              
                
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
