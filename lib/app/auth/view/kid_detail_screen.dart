
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/auth_controller.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/widget/custom_selection.dart';
import 'package:ileiwe/app/auth/view/widget/header_content_auth.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/widgets/customer_container.dart';
import 'package:ileiwe/cores/validator.dart';

class KidDetailScreen extends ConsumerStatefulWidget {
  const KidDetailScreen({super.key});

  @override
  ConsumerState<KidDetailScreen> createState() => _KidDetailScreenState();
}

class _KidDetailScreenState extends ConsumerState<KidDetailScreen> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();
  final TextEditingController favouriteSubjectController = TextEditingController();
  final TextEditingController interestSubjectController = TextEditingController();
  TextEditingController challengingSubjectController = TextEditingController();
  final TextEditingController userBenefitController = TextEditingController();


  final formKey = GlobalKey<FormState>();
  bool loading = false;
  late AuthController authController;


  bool isOtherEmpty () {
    return favouriteSubjectController.value.text.isEmpty || interestSubjectController.value.text.isEmpty
      || challengingSubjectController.value.text.isEmpty;
  }

  submit() async {
      
      if(!formKey.currentState!.validate() || isOtherEmpty()) {
        
        CustomToast(Navigator.of(context)).showErrorMessage("Please fill form appropriately");
        return;
      }
      setState(() {
        loading = true;
      });

      final Map<String, dynamic> data = {
          'userId': ref.read(userStateNotifierProvider).userId,
          'age': ageController.value.text,
          'hobby': hobbyController.value.text,
          'favoriteSubject': favouriteSubjectController.value.text,
          'interestSubject': interestSubjectController.value.text,
          'challengingSubject': challengingSubjectController.value.text,
          'benefit': userBenefitController.value.text
      };

      final result = await authController.registerKid(data);

        if (result.success) {
          
          CustomToast(Navigator.of(context)).showSuccessMessage(result.message);

          Future.delayed(const Duration(seconds: 1), () {
            if (context.mounted) {
              context.push(RoutesName.subscriptionPricing);
            }
          });
          
        } else {
          
          CustomToast(Navigator.of(context)).showErrorMessage(result.message);
          
        }
    setState(() {loading = false;});
  }

  @override
  void initState() {
    super.initState();
    authController = AuthController(ref: ref);
  }
  
  @override
  Widget build(BuildContext context) {


    return  ContainerCustom(
      
      child: CustomScrollView(

        slivers: [
          SliverList.list(children: [
            const SizedBox(height: 50,)  ,
            const HeaderContentAuth(
              right: -60,
              top: -10,
              imageHeight: 200,
                      imageName: 'write_message',
                      mainHeader: "Basic Info", 
                      content: "Help us know more\nabout your kid's\npersonality"),
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
                    bottomMargin: 0,
                    labelText: "Enter kid's age",
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    keyboardType: TextInputType.number,
                    label: "Enter age", 
                    validator: (value) => isValidNumber(value!, field: "Invalid Name"), 
                    controller: ageController),
                   InputFieldAuth(
                    bottomMargin: 0,
                    labelText:  "Enter kid's hobby", 
                    fillColor: Colors.white30,
                    textColor: Colors.white,
                    label:"Enter hobby",
                    validator: (value) => isValidName(value!, field: "Invalid Name"), 
                    controller: hobbyController),
                  CustomSelectionField(
                    bottomMargin: 0,
                    labelText: "Enter Kids' Favourite Subject",
                    onChangedValue: (value) {
                      favouriteSubjectController.value = favouriteSubjectController.value.copyWith(text: value);
                    }, options: const [
                    {'id': 1, 'name': "Mathematics"},
                    {'id': 2, 'name': "English"}, ], 
                  
                  label: "Select Subject"),

                  CustomSelectionField(
                    bottomMargin: 0,
                    labelText: "Which learning Category Interest you most",
                    onChangedValue: (value){
                      interestSubjectController.value = interestSubjectController.value.copyWith(text: value);
                    }, options: const [
                    {'id': 1, 'name': "Mathematics"},
                    {'id': 2, 'name': "English"}, ], 
                  
                  label: "Select Category"),

                  CustomSelectionField(
                    bottomMargin: 0,
                    labelText: "Which categories are challenging for you",
                    onChangedValue: (value) {
                      
                      challengingSubjectController.value = challengingSubjectController.value.copyWith(text: value);
                      
                    }, options: const [
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
                    controller: userBenefitController),
                 
                  
                const SizedBox(height: 35),
                ButtonOne(label: "Start Learning", extend: true, action: () => submit(), 
                loading: loading,
                border: Border.all(width: 0), bgColor: const Color.fromARGB(255, 255, 6, 255),),
                const SizedBox(height: 200,)
              
                
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
