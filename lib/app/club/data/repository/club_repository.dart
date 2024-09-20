


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';




class ClubRepository {


  ClubRepository({required this.firestore, required this.firebaseStorage});

  final FirebaseFirestore firestore;
  final FirebaseStorage firebaseStorage;

  
  final data = [
    "5oTOqxw7sPxlBwmFrg8n", //ebook
    "CWvEczgUa4CLvkjkOipx", //skit
  ];

Future<ReturnedStatus> getCategoryBook(libraryId, categoryId, {limit = false}) async {
    try {
        QuerySnapshot reference;
      //  if(limit) {
       reference = await firestore.collection("books")  
                      .where("categoryId", isEqualTo: categoryId)
                      .where("libraryCategoryId", isEqualTo: libraryId).get();
      
       List books = [];

        for (var book in reference.docs) {
            final imagePath = await firebaseStorage.ref().child("books/${book.id}.png").getDownloadURL();
            books.add({"id": book.id, ...book.data() as Map<String,dynamic>, "imagePath": imagePath });
        }
        
      return ReturnedStatus(message: "", success: true, data: books);

    } catch (e) {
      return ReturnedStatus(message: "error $e", success: false);
    }
  }




  Future<ReturnedStatus> getAllClubs() async {
    try {
      
      final reference = await firestore.collection("club").get();

       List clubs = [];

        for (var club in reference.docs) {
            final imagePath = await firebaseStorage.ref().child("clubs/${club.id}.png").getDownloadURL();
            clubs.add({"id": club.id, ...club.data(), "imagePath": imagePath });
        }

      return ReturnedStatus(message: "", success: true, data: clubs);
    } catch (e) {

      return ReturnedStatus(message: "error $e", success: false);
    }
  }

  
  Future<ReturnedStatus> addToClub(String clubId) async {
    try {
      
      final reference =  firestore.collection("club").doc(clubId);

      await reference.set({'members': FieldValue.arrayUnion([clubId])});

      return ReturnedStatus(message: "", success: true);
    } catch (e) {
      return ReturnedStatus(message: "error $e", success: false);
    }
  }

  Future<ReturnedStatus> sendRequest(String clubId, String userId) async {
    try {
      
      await firestore.collection("club_requests").add({
        "clubId": clubId,
        "userId": userId
      });

      return ReturnedStatus(message: "", success: true);
    } catch (e) {
      return ReturnedStatus(message: "error $e", success: false);
    }
  }

  

}