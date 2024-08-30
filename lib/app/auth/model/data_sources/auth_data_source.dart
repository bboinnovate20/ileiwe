
import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  
  const FirebaseAuthDataSource({required this.instance, required this.db_instance});

  final FirebaseAuth instance;
  final FirebaseFirestore db_instance;

  

  @override
  Future<ReturnedStatus> registerUser(Register userPersonAccountDetail) async {
      try {

            final UserCredential credential = await instance.createUserWithEmailAndPassword(
                email: userPersonAccountDetail.email,
                password: userPersonAccountDetail.password,
            );
            
            
             await instance.currentUser?.updateDisplayName("${userPersonAccountDetail.firstName} ${userPersonAccountDetail.lastName}");
             await instance.currentUser?.reload();

            
            final response = await addUserToDB(userPersonAccountDetail, credential.user?.uid);
            
      

            if(response.success) {
              
              final phoneNumberVerificationId = await verifyPhoneNumber(userPersonAccountDetail.phoneNumber);
              
              print("verified sent");

              print(phoneNumberVerificationId.message);

              return ReturnedStatus(message: "Successfully registerd", success: true, otherData: {
                'user': instance.currentUser,
                'phoneNumber': userPersonAccountDetail.phoneNumber,
                'phoneNumberToken': phoneNumberVerificationId.otherData['phoneNumberToken']
              });
              
            }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            return  ReturnedStatus(
            message: 'Password is weak', success: false);
          } else if (e.code == 'email-already-in-use') {
            return  ReturnedStatus(message: 'The account already exists for that email.', success: false);
          }
        } catch (e) {
            print("unknown error $e");
            return  ReturnedStatus(message: 'Unknown error', success: false);
        }
        print("unknown error no message");
      return  ReturnedStatus(message: 'Unknown error', success: false);
    
  }


  @override
  loginUser(Login loginDetails) {

  }
  
  @override
  uploadImages(File path, String imagePurpose) async {


  }

  Future<ReturnedStatus> authenticatePhoneNumber(verificationId, code) async {

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

      // Sign the user in (or link) with the credential
      await instance.signInWithCredential(credential);

      return ReturnedStatus(message: "successful", success: true);
      
    } catch (e) {
      
      return ReturnedStatus(message: e.toString(), success: false);
    }

  }
  
  
  @override
  Future<ReturnedStatus> registerKid(KidInfo kidInfo, String userId)async {

    final kidInfoJSON = kidInfo.toJson();
    try {
        final data = await db_instance.collection('kid_details').doc(userId.toString()).set(kidInfoJSON);

        return  ReturnedStatus(message: 'successful', success: true);
      
    } catch (e) {
      return  ReturnedStatus(message: "$e", success: false);
    }
    // throw UnimplementedError();
  }
  Future<ReturnedStatus> getKid(String userId)async {

    try {
        final data = await db_instance.collection('kid_details').doc(userId.toString()).get();

        return  ReturnedStatus(message: "", success: data.exists, otherData: {'data': data.data()});
      
    } catch (e) {
      return  ReturnedStatus(message: "$e", success: false);
    }
    // throw UnimplementedError();
  }

  Future<ReturnedStatus> verifyPhoneNumber(String phoneNumber) async {
    
    print('phone number verificaiton');

    final Completer<ReturnedStatus> completer = Completer<ReturnedStatus>();

            
                await instance.verifyPhoneNumber(
                      phoneNumber: phoneNumber,
                      verificationCompleted: (PhoneAuthCredential credentialAuth) async {
                        print("completed");
                        completer.complete(ReturnedStatus(message: "completed", success: true));
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        completer.complete(ReturnedStatus(message: "failed to send code", success: false));
                      },
                      codeSent:  (String verificationId, int? resendToken) async {
                        completer.complete(ReturnedStatus(message: "sent", success: true, otherData: {'phoneNumberToken': verificationId}));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                );
                

            return completer.future;
  }

  Future<ReturnedStatus> addUserToDB(Register userDetail, String? userId) async {
    

    try {
        await db_instance.collection('user_details').doc(userId.toString()).set({'phoneNumber': userDetail.phoneNumber });
        print("successfull");
        return  ReturnedStatus(message: 'successful', success: true);
      
    } catch (e) {
      return  ReturnedStatus(message: "$e", success: false);
    }
    //  final DocumentReference getUserBusinessDoc = database.collection(DatabaseCollection.userBusinessColl).doc(userId.toString());
    //     final getBusinessDetails = await getUserBusinessDoc.get();

    //     final getUserBusinessData = getBusinessDetails.data() as Map<String, dynamic>;
        
    //     if(getUserBusinessData.isEmpty) {
  }
}



