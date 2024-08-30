

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ileiwe/app/auth/model/data/kid_info.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:ileiwe/app/auth/provider/repository/auth_repository_provider.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController {
  const AuthController({required this.ref});

  final WidgetRef ref;

  Future<ReturnedStatus> register(Map<String, dynamic> userData)async {

    final registerDetail = Register.fromJson(userData);

    final register = ref.read(firebaseAuthRepositoryProvider);

    final ReturnedStatus responseRegister = await register.register(registerDetail);

    print("get to controller");

    print(responseRegister.otherData);


    if(responseRegister.success){
        final user = responseRegister.otherData['userInfo'] as UserDetailInfo;
        await ref.read(userStateNotifierProvider.notifier).update(user);
        print(ref.read(userStateNotifierProvider).firstName);
        return ReturnedStatus(message: "success", success: true, otherData: {'phoneNumberToken': responseRegister.otherData['phoneNumberToken']});
    }

    return ReturnedStatus(message: "failed", success: false);



    // print("after controller");

    // register.register(register);
    
    // return const ReturnedStatus(message: "dddddd", success: true);
    

  }

   Future<ReturnedStatus> verifyPhoneNumber(tokenId, code)async {
        try {

        final auth = ref.read(firebaseAuthRepositoryProvider);
        await FirebaseAuth.instance.currentUser?.reload();

        final cUser = FirebaseAuth.instance.currentUser;
        final splitName = cUser?.displayName != null ? cUser?.displayName?.split(" ") : ["", ""];

        final user = UserDetailInfo(isAuthenticated: true, userId: cUser!.uid, 
              firstName: splitName![0], lastName: splitName[1], email: cUser.email ?? "", 
              phoneNumber: cUser.phoneNumber ?? "", isPhoneNumberVerified: cUser.phoneNumber != null ? true : false, 
              isEmailVerified: cUser.emailVerified);
        
        // final user = responseRegister.otherData['userInfo'] as UserDetailInfo;
        await ref.read(userStateNotifierProvider.notifier).update(user);

        return auth.authenticatePhoneNumber(tokenId, code);
          
        } catch (e) {
          return ReturnedStatus(message: "Error Verifying Number", success: false);
        }



   }

   Future<ReturnedStatus> resendOTP()async {

        final phoneNumber = ref.read(userStateNotifierProvider).phoneNumber;

        final auth = await ref.read(firebaseAuthRepositoryProvider).resendOTP(phoneNumber);

        return auth;
        
   }

   registerKid(Map<String, dynamic> kid) {
      final kidInfo = KidInfo.fromJson(kid);
      final userId = ref.read(userStateNotifierProvider).userId;
      
      return ref.read(firebaseAuthRepositoryProvider).registerKid(kidInfo, userId);
   }


}