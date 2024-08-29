


import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'user_state_notifier.g.dart';

@Riverpod(keepAlive: true)    
class UserStateNotifier extends _$UserStateNotifier{
  
  @override
  UserInfo build() {
    return  UserInfo(isAuthenticated: false, userId: "", firstName: "", lastName: "", email: "", isEmailVerified: false);
  }

   update(UserInfo newUpdate) {
    state = newUpdate;
  }
}