import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/model/data/kid_info.dart';
import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:ileiwe/app/auth/provider/repository/auth_repository_provider.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/constant/routes.dart';


class SplashScreenController {
  const SplashScreenController({required this.ref});


  final WidgetRef ref;


  decideNextScreen(BuildContext context) async {
    
    final User? userFDetail = ref.read(firebaseAuthRepositoryProvider).initiateCurrentUser();

    if(userFDetail != null) {
        final  firstSplitName = userFDetail.displayName != null ? userFDetail.displayName?.toString().split(" ") : ["No name", "No name"];
        final splitName = firstSplitName!.length == 1 ? [firstSplitName[0], ""] : firstSplitName.length == 2 ? firstSplitName : [" ", " "];
        
        final userInfo = UserDetailInfo(isAuthenticated: true, 
        userId: userFDetail.uid, firstName: splitName[0], 
        lastName: splitName[1], 
        email: userFDetail.email?? "", 
        phoneNumber: userFDetail.phoneNumber ?? "", 
        isPhoneNumberVerified: userFDetail.phoneNumber != null ? true : false, 
        isEmailVerified: userFDetail.emailVerified);

        final isKidExist = await ref.read(firebaseAuthRepositoryProvider).getKid(userInfo.userId);

        if(isKidExist.success) {
          print(isKidExist.otherData);
          final kidInfo = KidInfo.fromJson(isKidExist.otherData['data']);
          userInfo.kidInfo = kidInfo;
        }
        

         await Future.microtask(() async {
                 await ref.read(userStateNotifierProvider.notifier).update(userInfo);
          });
        
        if(!context.mounted) return;
        if(isKidExist.success) {context.replace(RoutesName.homeDashboard);}
        else {context.replace(RoutesName.kidDetails);}
        // else {context.replace(RoutesName.login);}
         
        
    }else {
      context.replace(RoutesName.onboarding);
    }
    
  }


}
