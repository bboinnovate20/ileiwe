
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ileiwe/app/auth/model/data/kid_info.dart';
import 'package:ileiwe/app/auth/model/data/login.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/app/auth/model/data/user_info.dart';

import 'package:ileiwe/app/auth/model/data_sources/auth_data_source.dart';
import 'package:ileiwe/cores/common/returned_status.dart';

class AuthRepository {

  register(Register register){}

  registerKid(KidInfo kidInfo, String userId){}

  login(Login userData){}
}


class FirebaseAuthRepository implements AuthRepository {

  const FirebaseAuthRepository({required this.dataSource});

  final FirebaseAuthDataSource dataSource;

  
  

  @override
  login(Login userData)async {
    try {

      final response = await dataSource.loginUser(userData);
  
      if(response.success){
        final user = response.otherData['user'] as User;
        final splitName = user.displayName != null ? user.displayName?.split(" ") : ["", ""];
      
        final userInfo = UserDetailInfo(isAuthenticated: true, 
                      userId: user.uid, 
                      firstName: splitName?[0] ?? "", 
                      lastName: splitName?[1] ?? "", 
                      phoneNumber: user.phoneNumber ?? "",
                      isPhoneNumberVerified: user.phoneNumber != null  && user.phoneNumber!.isNotEmpty ? true : false,
                      email: user.email ?? "", 
                      isEmailVerified: user.emailVerified);


        return ReturnedStatus(message: "success", success: true, otherData: {
          'userInfo': userInfo});

      }
      return ReturnedStatus(message: response.message, success: false);
       
    } catch (e) {
    
      print(e);
      return ReturnedStatus(message: "$e", success: false);
    }
    
  }

  @override
  register(Register register) async {
    
    try {
      final response = await dataSource.registerUser(register);

      final user = response.otherData['user']as User;


      final splitName = user.displayName != null ? user.displayName?.split(" ") : ["", ""];

      final userInfo = UserDetailInfo(isAuthenticated: true, 
                    userId: response.otherData['user']?.uid, 
                    firstName: splitName?[0].trim() ?? "", 
                    lastName: splitName?[1].trim() ?? "", 
                    phoneNumber: response.otherData['phoneNumber'],
                    isPhoneNumberVerified: false,
                    email: response.otherData['user']?.email, 
                    isEmailVerified: false);

      return ReturnedStatus(message: "success", success: true, otherData: {
        'userInfo': userInfo,
        'phoneNumberToken':response.otherData['phoneNumberToken']
      });
      
       


    } catch (e) {
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

  updateInfo(Register registerInfo) async {
    try {
          
          String currentDisplayName = dataSource.instance.currentUser?.displayName ?? "";
          List<String> nameParts = currentDisplayName.split(' ');
          String currentFirstName = nameParts.isNotEmpty ? nameParts[0] : "";
          String currentLastName = nameParts.length > 1 ? nameParts[1] : "";

          
          String firstName = registerInfo.firstName.isEmpty ? currentFirstName : registerInfo.firstName.trim();
          String lastName = registerInfo.lastName.isEmpty ? currentLastName : registerInfo.lastName.trim();

          if (firstName.isNotEmpty || lastName.isNotEmpty) {
              
              String updatedName = "$firstName $lastName".trim();
              await dataSource.instance.currentUser?.updateDisplayName(updatedName);
              await dataSource.instance.currentUser?.reload();
              final userInfo =updateUserState();
              return ReturnedStatus(message: "Successfully changed your name", success: true, otherData: {'user':userInfo});
          }

          
          if (registerInfo.password.isNotEmpty) {
              var currentUser = dataSource.instance.currentUser;
              if (currentUser?.uid != null) {
                  await currentUser?.reload();
                  return resendOTP(currentUser!.uid);
              }
          }

          return ReturnedStatus(message: "No changes made", success: false);
      } catch (e) {
          return ReturnedStatus(message: "Unknown error: $e", success: false);
      }

  }

  UserDetailInfo updateUserState() {

      final user = dataSource.instance.currentUser;
       final splitName = user?.displayName != null ? user?.displayName?.split(" ") : ["", ""];
     
      final userInfo = UserDetailInfo(isAuthenticated: true, 
                    userId: user?.uid ?? "", 
                    firstName: splitName?[0] ?? "", 
                    lastName: splitName?[1] ?? "", 
                    phoneNumber: user?.phoneNumber ?? "",
                    isPhoneNumberVerified: user?.phoneNumber != null  && user!.phoneNumber!.isNotEmpty ? true : false,
                    email: user?.email ?? "", 
                    isEmailVerified: user?.emailVerified ?? false);
      return userInfo;
  }

  logout() async {
    try {
      
        await FirebaseAuth.instance.signOut();
        return ReturnedStatus(message: "Successfully Logout", success: true);
    } catch (e) {
        return ReturnedStatus(message: "Successfully Logout", success: false);
    }
  }
}