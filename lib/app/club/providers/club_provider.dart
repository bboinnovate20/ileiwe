import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ileiwe/app/club/data/models/club.dart';
import 'package:ileiwe/app/club/data/repository/club_repository.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';



part 'club_provider.g.dart';

@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirebaseStorage firebaseStorage(FirebaseStorageRef ref) {
  return FirebaseStorage.instance;
}

@riverpod
ClubRepository clubRepository(ClubRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  final storage = ref.watch(firebaseStorageProvider);


  return ClubRepository(firestore: firestore, firebaseStorage: storage); 
}




@riverpod
Future<List<Club>> club(ClubRef ref) async {
    final response = await ref.read(clubRepositoryProvider).getAllClubs();
    print(response);
    if(response.success) {
       List<Club> clubs = [];

      for (var category in response.data) {
          
            clubs.add(Club.fromJson(category));
      }
      return clubs;
    }
    else {
      return  [];
    }
}