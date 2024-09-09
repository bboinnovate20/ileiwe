
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/auth_controller.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';
import 'package:ileiwe/cores/extension.dart';
import 'package:ileiwe/cores/validator.dart';

class VerificationScreen extends ConsumerStatefulWidget {
   VerificationScreen({super.key, required this.verifiedToken}): stateToken = verifiedToken; 

  final String verifiedToken;

  String stateToken = "";
  @override
  ConsumerState<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {


    final TextEditingController tokenController = TextEditingController();
    bool loading = false;

    final formKey = GlobalKey<FormState>();

    late  AuthController authController;

    void submit() async {
      if(formKey.currentState!.validate()) {
        setState(() {
          loading = true;
        });

        final response = await authController.verifyPhoneNumber(widget.stateToken, tokenController.value.text);

        if(response.success && context.mounted) {
          CustomToast(Navigator.of(context)).showSuccessMessage(response.message);
          Future.delayed(const Duration(seconds: 1), () {
            if(context.mounted){
                context.go(RoutesName.kidDetails);
            }
          });
        }
        else {
          CustomToast(Navigator.of(context)).showErrorMessage(response.message);
        }
        
      }
        setState(() {
          loading = false;
        });
    }

    resendOTP() async {
      final response = await authController.resendOTP();
      if(!context.mounted) return;

      if(response.success) {
          setState(() {
              widget.stateToken = response.otherData['phoneNumberToken'];
            
            });
            print('token sent');
            print(response.otherData['phoneNumberToken']);
            print(widget.stateToken);


        CustomToast(Navigator.of(context)).showSuccessMessage(response.message);
      }
      else {CustomToast(Navigator.of(context)).showErrorMessage(response.message);}
    }


  
    @override
  void initState() {
    super.initState();
    authController = AuthController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    

    return  ContainerCustom(
      isNotScrollable:true,
       appBar:Container(
          
          decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: const Icon(Icons.arrow_back_rounded, size: 30, color: Color.fromARGB(255, 79, 6, 91),)),

      bottomSheet: Container(
        
        height: 80,
        margin: const EdgeInsets.only(bottom: 50),
         child:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            // ButtonOne(label: "Verify Account", action: () => context.go(RoutesName.kidDetails), 
            ButtonOne(label: "Verify Account", action: () => submit(), 
            loading: loading,
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
            height: 500,
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 100,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text:  TextSpan(
                        style: const TextStyle(height: 1.5),
                      text: "Code has been sent to ",
                      children: [
                        TextSpan(text: ref.read(userStateNotifierProvider).phoneNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: "\nEnter the code to verify your account" )
                    ])),
                  
                  
              InputFieldAuth(
                fillColor: Colors.white30,
                textColor: Colors.white,
                label: "Enter the code", 
                validator: (value) => isValidName(value!, field: "Invalid Token"), 
                controller: tokenController).padding(top: 40, bottom: 10),
                  
                GestureDetector(
                  onTap: () => resendOTP(),
                  child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(height: 1.5),
                        text: "Haven't received the code? ",
                        children: [
                          TextSpan(text: "Resend", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                      ])),
                ),
              
                      
                ],)
                
              ,),
            ),
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

