
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ileiwe/app/auth/model/data/kid_info.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/app/auth/model/data/user_info.dart';

import 'package:ileiwe/app/auth/model/data_sources/auth_data_source.dart';
import 'package:ileiwe/cores/common/returned_status.dart';

class AuthRepository {

  register(Register register){}

  registerKid(KidInfo kidInfo, String userId){}

  login(){}
}


class FirebaseAuthRepository implements AuthRepository {

  const FirebaseAuthRepository({required this.dataSource});

  final FirebaseAuthDataSource dataSource;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  register(Register register) async {
    print("back to repository");
    try {
      final response = await dataSource.registerUser(register);
      print('token');
      print(response.otherData['phoneNumberToken']);

      final user = response.otherData['user']as User;


      final splitName = user.displayName != null ? user.displayName?.split(" ") : ["", ""];

      final userInfo = UserDetailInfo(isAuthenticated: true, 
                    userId: response.otherData['user']?.uid, 
                    firstName: splitName?[0] ?? "", 
                    lastName: splitName?[1] ?? "", 
                    phoneNumber: response.otherData['phoneNumber'],
                    isPhoneNumberVerified: false,
                    email: response.otherData['user']?.uid, 
                    isEmailVerified: false);

      return ReturnedStatus(message: "success", success: true, otherData: {
        'userInfo': userInfo,
        'phoneNumberToken':response.otherData['phoneNumberToken']
      });
      
       


    } catch (e) {
        print('error in repository');
        return ReturnedStatus(message: "Unknown Error", success: false);
    }
    
  } 

  @override
  Future<ReturnedStatus> registerKid(KidInfo kidInfo, String userId) {
    
    return dataSource.registerKid(kidInfo, userId);
  }

   Future<ReturnedStatus> getKid(String userId) {
    
    return dataSource.getKid(userId);
  }

  Future<ReturnedStatus> authenticatePhoneNumber(verificationId, code) async  {
    
  try {
    final response = await dataSource.authenticatePhoneNumber(verificationId, code);
    if(response.success) {
      return ReturnedStatus(message: "Success", success: true);
    }
    
    return response;

  } catch (e) {
    return ReturnedStatus(message: e.toString(), success: false);
  }

  }

  resendOTP(String userId) async {
    try {
      return await dataSource.verifyPhoneNumber(userId);

    } catch (e) {
      return ReturnedStatus(message: e.toString(), success: false);
    }
  }

  initiateCurrentUser() {
    
        final auth = FirebaseAuth.instance.currentUser;
        return auth;
    
  }

}