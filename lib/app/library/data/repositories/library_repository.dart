

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ileiwe/cores/common/returned_status.dart';

class LibraryRepository {


  LibraryRepository({required this.firestore, required this.firebaseStorage});

  final FirebaseFirestore firestore;
  final FirebaseStorage firebaseStorage;

  
  final data = [
    "5oTOqxw7sPxlBwmFrg8n", //ebook
    "CWvEczgUa4CLvkjkOipx", //skit
    "BrTsCPjOp312bQNxHpu0", //stories
    
  ];

  Future<ReturnedStatus> getEBookCategories({limit = true}) async {
    try {
      QuerySnapshot reference;

      if(limit) {
        reference = await firestore.collection("libraries").doc(data[0]).collection('books').limit(4).get();
      }
      else {
        reference = await firestore.collection("libraries").doc(data[0]).collection('books').get();
      }
      
      List<Map<String, dynamic>> listOfCategories = [];
      
      for (var doc in reference.docs) {
        final imageRef = await firebaseStorage.ref().child("categories/${doc.id}.png").getDownloadURL();
        listOfCategories.add({'id': doc.id, ...doc.data() as Map<String,dynamic> , 
            "libraryId": data[0],
            'imagePath': imageRef});
      }

      return ReturnedStatus(message: "", success: true, data: listOfCategories);

    } catch (e) {
      return ReturnedStatus(message: "error $e", success: false);
    }
  }




    Future<ReturnedStatus> getSkitLibraryCategories({limit = true}) async {
    try {
      QuerySnapshot reference;

      if(limit) {
        reference = await firestore.collection("libraries").doc(data[1]).collection('skit').limit(4).get();
      }
      else {
        reference = await firestore.collection("libraries").doc(data[1]).collection('skit').get();
      }
      
      List<Map<String, dynamic>> listOfCategories = [];
      
      for (var doc in reference.docs) {
        final imageRef = await firebaseStorage.ref().child("categories/${doc.id}.png").getDownloadURL();
        listOfCategories.add({'id': doc.id, ...doc.data() as Map<String,dynamic> , 
            "libraryId": data[1],
            'imagePath': imageRef});
      }

      return ReturnedStatus(message: "", success: true, data: listOfCategories);

    } catch (e) {
      print("error $e");
      return ReturnedStatus(message: "error $e", success: false);
    }
  }



  Future<ReturnedStatus> getEBookBook({limit = true, mostPopular=false}) async {
    try {
        QuerySnapshot reference;
        if(mostPopular) {
          reference = await firestore.collection("books").where("totalReaders", isGreaterThan: 10).get();
        }
       else if(limit) {
       reference = await firestore.collection("books").get();
       }
       else {
        reference = await firestore.collection("books").get();
       }
       List books = [];

        for (var book in reference.docs) {
            final imagePath = await firebaseStorage.ref().child("books/${book.id}.png").getDownloadURL();
            // print(book.data());
            books.add({"id": book.id, ...book.data() as Map<String,dynamic>, "imagePath": imagePath });
        }
      return ReturnedStatus(message: "", success: true, data: books);

    } catch (e) {
      return ReturnedStatus(message: "error $e", success: false);
    }
  }


  Future<ReturnedStatus> getSkitVideo( {limit = true}) async {
      try {
          QuerySnapshot reference;
        // if(limit) {
          reference = await firestore.collection("videos").where("libraryId", isEqualTo: data[1]).get();

        // }
        // else {
        //   reference = await firestore.collection("books").get();
        // }
        List<Map<String, dynamic>>  skits = [];

          for (var book in reference.docs) {
              final bookInfo = book.data() as Map;

              final myCategoryName = await firestore.collection("libraries").doc(data[1]).collection('skit').doc("8RwFNYbPNgewyA7Abxn5").get();
              final name = myCategoryName.data() as Map;
              
              skits.add({"id": book.id, ...bookInfo, "categoryName": name['name']});
          }


        return ReturnedStatus(message: "", success: true, data: skits );

      } catch (e) {
        print("$e error");
        return ReturnedStatus(message: "error $e", success: false);
      }
    }





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




  Future<ReturnedStatus> getAllEBooks(String categoryId) async {
    try {
      
      final reference = await firestore.collection("libraries").doc(data[0]).collection('books').get();
  
      return ReturnedStatus(message: "", success: true);
    } catch (e) {
      return ReturnedStatus(message: "error $e", success: false);
    }
  }


    Future<ReturnedStatus> getStories() async {
    try {
      
      final reference = await firestore.collection("books").
                        where("categoryId", isEqualTo: data[2]).get();
      
      List stories = [];

      for (var story in reference.docs) {
        final imageRef = await firebaseStorage.ref().child("books/${story.id}.png").getDownloadURL();
        stories.add({...story.data(), "id": story.id, "imagePath": imageRef });
      }

      return ReturnedStatus(message: "", success: true, data: stories);
    } catch (e) {
      return ReturnedStatus(message: "error $e", success: false);
    }
  }
  

}