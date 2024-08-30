


import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'user_state_notifier.g.dart';

@Riverpod(keepAlive: true)    
class UserStateNotifier extends _$UserStateNotifier{
  
  @override
  UserDetailInfo build() {
    return  UserDetailInfo(isAuthenticated: false, phoneNumber: "", isPhoneNumberVerified: false, userId: "", firstName: "", lastName: "", email: "", isEmailVerified: false);
  }

   update(UserDetailInfo newUpdate) {
    state = newUpdate;
  }
}