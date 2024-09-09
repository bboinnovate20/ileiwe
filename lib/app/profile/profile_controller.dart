

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:ileiwe/app/auth/provider/repository/auth_repository_provider.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/kid_detail_screen.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/returned_status.dart';

class ProfileController {

  ProfileController({required this.ref, required this.context});

  final WidgetRef ref;
  final BuildContext context;

  updateInfo(Register registerInfo) async {
      final ReturnedStatus response = await ref.read(firebaseAuthRepositoryProvider).updateInfo(registerInfo);
      if(context.mounted) {

        if(response.success) {
          CustomToast(Navigator.of( context)).showSuccessMessage(response.message);
          ref.watch(userStateNotifierProvider.notifier).update(response.otherData['user'] as UserDetailInfo);
        }
        else {
          CustomToast(Navigator.of(context)).showErrorMessage(response.message);
        }
      }
  }

  logout() async {
    final response = await ref.read(firebaseAuthRepositoryProvider).logout();
    if(!context.mounted) return;

    if(response.success) {
      
       await ref.watch(userStateNotifierProvider.notifier).update(UserDetailInfo(isAuthenticated: false, 
        userId: "", firstName: "", lastName: "", email: "", phoneNumber: "", isPhoneNumberVerified: false, 
        isEmailVerified: false));
        if(!context.mounted) return;
        
        CustomToast(Navigator.of( context)).showSuccessMessage(response.message);
        context.go(RoutesName.login);
    }else {

        CustomToast(Navigator.of(context)).showErrorMessage(response.message);
    }
  }
}