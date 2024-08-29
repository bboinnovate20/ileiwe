
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ileiwe/app/auth/model/data/kid_info.dart';
import 'package:ileiwe/app/auth/model/data/login.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/cores/common/returned_status.dart';



class AuthRemoteDataSource {

    

    registerUser(Register registrationDetails) async {
    
    }

    loginUser(Login loginDetails) async{

    }

    registerKid(KidInfo kidInfo, String userId) async {
    
    }

    uploadImages(File path, String imagePurpose) {
      
    }


}


class FirebaseAuthDataSource implements AuthRemoteDataSource {
  
  const FirebaseAuthDataSource({required this.instance});

  final FirebaseAuth instance;

  

  @override
  Future<ReturnedStatus> registerUser(Register userPersonAccountDetail) async {
      try {
          final credential = await instance.createUserWithEmailAndPassword(
            email: userPersonAccountDetail.email,
            password: userPersonAccountDetail.password,
          );
          print(credential);
          final response = addUserToDB(userPersonAccountDetail,credential.user?.uid);
          print(response);
          if(response.success){

            await credential.user?.updateDisplayName("${userPersonAccountDetail.firstName} ${userPersonAccountDetail.lastName}");
            
            return ReturnedStatus(
              message: 'Successfully created user Account', 
              success: true, otherData: {'user': credential.user});
          }



        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            return const ReturnedStatus(
            message: 'Password is weak', success: false);
          } else if (e.code == 'email-already-in-use') {
            return const ReturnedStatus(message: 'The account already exists for that email.', success: false);
          }
        } catch (e) {
            return const ReturnedStatus(message: 'Unknown error', success: false);
        }
      return const ReturnedStatus(message: 'Unknown error', success: false);
    
  }


  @override
  loginUser(Login loginDetails) {

  }
  
  @override
  uploadImages(File path, String imagePurpose) async {


  }
  
  @override
  registerKid(KidInfo kidInfo, String userId) {
    // TODO: implement registerKid
    throw UnimplementedError();
  }

  ReturnedStatus addUserToDB(Register useDetail, String? userId) {
    return const ReturnedStatus(message: 'message', success: true);
  }
}



