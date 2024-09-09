
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/auth_controller.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';
import 'package:ileiwe/cores/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {


    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmationController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    
    late AuthController authController;

    bool loading = false;
    
    void submit()async { 
      if (formKey.currentState!.validate()) {
        setState(() {
          loading = true;
        });

        final data = {
          'firstName': firstNameController.value.text.split(" ")[0],
          'lastName': lastNameController.value.text.split(" ")[0],
          'email': emailController.value.text,
          'phoneNumber': phoneNumberController.value.text,
          'password': passwordController.value.text,
          'passwordConfirmation': passwordConfirmationController.value.text,
        };

        final result = await authController.register(data);

        if (result.success) {
          
          CustomToast(Navigator.of(context)).showSuccessMessage(result.message);

          Future.delayed(const Duration(seconds: 1), () {
            if (context.mounted) {
              context.push(RoutesName.kidDetails);
              // context.push("${RoutesName.verifyAccount}/${result.otherData['phoneNumberToken']}");
            }
          });
          setState(() {loading = false;});
        } else {
          
          CustomToast(Navigator.of(context)).showErrorMessage(result.message);
          setState(() {loading = false;});
        }
      }

    }


    @override
    void initState() {
      super.initState();
      authController = AuthController(ref: ref);
    }

    @override
    Widget build(BuildContext context) {
      
    return  ContainerCustom(
            
            child:  CustomScrollView(
              
                    slivers: [
                      SliverList.list(children: [
                        const HeaderContentAuth(
                                right: -65,
                                top: -20,
                                imageHeight: 220,
                                imageName: 'sign_up',
                                mainHeader: "Create Account", content: "Register and\ncreate an account\ntoday!"),
                        Form(
                        key: formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "First Name", 
                    validator: (value) => isValidName(value!, field: "First Name"), 
                    controller: firstNameController),
                   InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label: "Last Name", 
                    validator: (value) => isValidName(value!, field: "Last Name"), 
                    controller: lastNameController),
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    keyboardType: TextInputType.emailAddress,
                    textColor: Colors.white,
                    label: "Enter Email", 
                    validator: (value) => isValidEmail(value!), 
                    controller: emailController),
                      
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    keyboardType: TextInputType.phone,
                    label: "Enter Phone Number", 
                    validator: (value) => isValidPhoneNumber(value!), 
                    controller: phoneNumberController),
                  
                  InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    isSecured: true,
                    label: "Create Password",
                    hintText: "Must be at least 8 character long",
                    validator: (value) => isValidPassword(value!), 
                    controller: passwordController),
                
                InputFieldAuth(
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    isSecured: true,
                    label: "Confirm Password",
                    validator: (value) => passwordConfirmationController.value == 
                                        passwordController.value ? null : "Password not match", 
                    controller: passwordConfirmationController),

                      
                ButtonOne(label: "Sign Up", 
                  loading: loading,
                  extend: true, 
                  action: () => submit(),
                   
                  // action: ()=>context.go(RoutesName.verifyAccount), 
                  // action: ()=> context.go("${RoutesName.verifyAccount}/hello"), 
                
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
          
    
    
    
    
    // Scaffold(
     

    //   backgroundColor: Colors.purple,
    //   appBar: AppBar(
    //     leadingWidth: 60,
    //     toolbarHeight: 50,
    //     backgroundColor: Colors.transparent,
    //     leading: GestureDetector(
    //       onTap: () => context.pop(),
    //       child: Container(
            
    //         decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(15)),
            
    //         margin: const EdgeInsets.only(top: 10, left: 20),
    //         child: const Icon(Icons.arrow_back_rounded, size: 30, color: Color.fromARGB(255, 79, 6, 91),)),
    //     ),),
      
    //   body: 
      
       
    
  }
}
