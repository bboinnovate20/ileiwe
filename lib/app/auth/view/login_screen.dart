
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/auth_controller.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';

import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';
import 'package:ileiwe/cores/validator.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    

    final formKey = GlobalKey<FormState>();
    bool loading = false;
    late AuthController _authController;

    void submitLogin() async {
      
       if(formKey.currentState!.validate()){
        setState(() => loading = true);

        final info = {
          'email': usernameController.value.text,
          'password': passwordController.value.text
        };
        

        final ReturnedStatus response = await _authController.login(info, context);

        if(response.success){
          CustomToast(Navigator.of(context)).showSuccessMessage(response.message);
          Future.delayed(500.ms, () {
            if (context.mounted) {
              context.replace(RoutesName.homeDashboard);
            }
          });
        }
        else {
          CustomToast(Navigator.of(context)).showErrorMessage(response.message);
        }

        setState(() => loading = false);
       }
    }

    @override
  void initState() {
    super.initState();
    _authController = AuthController(ref: ref);
  }


  @override
  Widget build(BuildContext context) {

    return  
    
    ContainerCustom(
      isNotScrollable: true,
      bottomSheet: Container(
        height: 90,
    
        margin: const EdgeInsets.only(bottom: 50),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: ()  => context.push(RoutesName.register),
              child: RichText(text: const TextSpan(
                text: "Don't have an account? ",
                children: [
                  
                  TextSpan(text: "Sign up", style: TextStyle(fontWeight: FontWeight.bold))
              ])),
            ),
            const SizedBox(height: 20),
            ButtonOne(label: "Sign In", 
            width: 250,
            loading: loading,
            action: () => submitLogin(), border: Border.all(width: 0))
          ],
               ),
       ),child: Column(
        children: [
          const HeaderContentAuth(mainHeader: "Let's go Sign In", 
            imageName: 'reading_kid_ladies',
            content: "Welcome back\nGlad to see you\nback"),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(right: 20, left: 20 ),
            child:  Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "Username or email", 
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: usernameController),
                  InputFieldAuth(
                    
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    isSecured: true,
                    label: "Password", 
                    validator: (value) => isValidPassword(value!), 
                    otherSuffix:  const Padding(
                      padding: EdgeInsets.only(right:15.0),
                      child: Text('Forgot?', style: TextStyle(fontWeight: FontWeight.bold, 
                                  fontSize: 15,
                                  color: Colors.white),),
                    ),
                    controller: passwordController),
                   
          
          
                  // alternative logins
          
                  const AlternativeLogin()
                ],
              ),
            ),
          ),
        ],
             ),
);
    // Scaffold(
     

    //   backgroundColor: Colors.purple,
    //   appBar: AppBar(
    //     leadingWidth: 60,
    //     toolbarHeight: 50,
    //     backgroundColor: Colors.transparent,
    //     // leading: Container(
          
    //     //   decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(15)),
          
    //     //   margin: const EdgeInsets.only(top: 10, left: 20),
    //     //   child: const Icon(Icons.arrow_back_rounded, size: 30, color: Color.fromARGB(255, 79, 6, 91),)),
    //       ),
    //   body: 
      
    //    bottomSheet: 
    // );
  }
}

class AlternativeLogin extends StatelessWidget {
  const AlternativeLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Column(   
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,   
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0, top: 10),
            child: Text("Or login With ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 150,
            child: Row (
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            
            
              children: [
                InkWell(
                  child: Image.asset('assets/icons/facebook.png',  height: 35,)
                ),
                InkWell(
                  child: Image.asset('assets/icons/google.png', height: 35,)
                ),
                InkWell(
                  child: Image.asset('assets/icons/apple.png',  height: 35)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}