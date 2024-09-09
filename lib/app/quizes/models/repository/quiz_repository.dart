import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:ileiwe/cores/utils/shuffle_questions.dart';

class QuizRepository {

  QuizRepository({required this.firestore});

  final FirebaseFirestore firestore;

  Future<ReturnedStatus> getSkill(skillId) async {

     try {
    DocumentSnapshot docSnapshot = await firestore.collection('quizzes').doc(skillId).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      return ReturnedStatus(message: "Successful", success: true, otherData: {'id': docSnapshot.id, ...data});
    } else {
      return ReturnedStatus(message: "", success: false);
    }
  } catch (e) {
    return ReturnedStatus(message: "", success: false);
  }
    
  }

  Future<ReturnedStatus> getAllSkills() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('quizzes').get();

      List<Map<String, dynamic>> skillsList = querySnapshot.docs.map((doc) {
        return {'id': doc.id, ...doc.data() as Map<String, dynamic>};
      }).toList();

      return ReturnedStatus(
        message: "Successful",
        success: true,
        otherData: {'skills': skillsList}
      );
    } catch (e) {
      return ReturnedStatus(message: "Error fetching skills: $e", success: false);
    }
  }

  Future<ReturnedStatus> getKidCurrentProgress(String skillId, String userId) async {
  try {
    DocumentSnapshot querySnapshot = await firestore.collection('kids_skills_learning').doc(userId).get();
    if (querySnapshot.exists) {
      
      final chapter = querySnapshot.data() as Map<String, dynamic>?;
      
      
      if (chapter != null && chapter.containsKey(skillId)) {
        print('here');
        print(chapter);

        try {
          int chapterId = chapter[skillId]['currentChapter'];
          bool isPlayed = chapter[skillId]['isCompleted'];

          // print(isPlayed);
 
          return ReturnedStatus(message: "", success: true, otherData: {'chapter': chapterId, 'isCompleted':isPlayed});
          
        } catch (e) {

          ReturnedStatus(message: "", success: false);
        }
      }

      
    }

    // Set default value if skillId is not present
    await firestore.collection('kids_skills_learning').doc(userId).set({
            skillId: {
              "currentChapter": 1,
              "completedChapter": [],
              "isCompleted": false
            },
          }, SetOptions(merge: true));

    DocumentSnapshot snapshot = await firestore.collection('kids_skills_learning').doc(userId).get();
    final snapshotData = snapshot.data() as Map<String, dynamic>?;
    // print(snapshotData);
    final updatedChapter = snapshotData?[skillId];


    return ReturnedStatus(
      message: "",
      success: true,
      otherData: {'chapter': updatedChapter['currentChapter'], 'isCompleted': updatedChapter['isCompleted']},
    );

  } catch (e) {
    print('Error: $e');
    return ReturnedStatus(
      message: "Error fetching skills: $e",
      success: false,
    );
  }
}

getChapterForQuiz(String skillId, int chapterId)async {
  try {
    QuerySnapshot querySnapshot = await firestore.collection('quizzes')
                                .doc(skillId).collection('chapters').where("id", isEqualTo: chapterId).get();
    
    
    return ReturnedStatus(message: "", success: true, otherData: querySnapshot.docs.first.data() as Map<String, dynamic>);
    
  } catch (e) {
    return ReturnedStatus(
      message: "Error fetching skills: $e",
      success: false,
    );
  }

}
getQuestionsForQuiz(String skillId, int chapterId)async {
      try {
        QuerySnapshot querySnapshot = await firestore.collection('quizzes')
                                    .doc(skillId).collection('chapters').where("id", isEqualTo: 1).get();
        
        // final doc = await querySnapshot.docs.first.reference.collection('questions').get();
        final referenceDoc = querySnapshot.docs.first;
        final questions = await referenceDoc.reference.collection('questions').get();
        final arrayOfQuestions = pickRandomQuestions(questions.docs, 3);

        return ReturnedStatus(message: "", success: true, data: arrayOfQuestions);
        
      } catch (e) {
        return ReturnedStatus(
          message: "Error fetching skills: $e",
          success: false,
        );
      }

}

goToNextChapterForSkill({required String skillId, required userId}) async {
     final response = await firestore.collection('kids_skills_learning').doc(userId).get();
     final ref = response.get(skillId);
     final currentChapter = ref['currentChapter'];
     final nextChapter = currentChapter + 1;

      QuerySnapshot querySnapshot = await firestore
          .collection('quizzes')
          .doc(skillId)
          .collection('chapters')
          .where("id", isEqualTo: nextChapter)
          .get();

      
      if (querySnapshot.docs.isNotEmpty) {
            await firestore.collection('kids_skills_learning').doc(userId).set({

            skillId: {
              "isCompleted": false,
              "currentChapter": nextChapter,
            },
          }, SetOptions(merge: true));

          return ReturnedStatus(message: "", success: true, otherData: {'chapter': nextChapter});
      
      } else {

          return ReturnedStatus(message: "", success: false);
}

        

     


}

updateKidProgress({required String skillId,required int newCurrentChapter,
                    required int coinEarned,
                    required String whatLearnt, required int currentChapterId, required String userId}) async {

      try {
            await firestore.collection('kids_skills_learning').doc(userId).set({

            skillId: {
              "isCompleted": true,
              "currentChapter": currentChapterId,
              "completedChapter": FieldValue.arrayUnion([{
                "chapterId": currentChapterId,
                "whatLearnt": whatLearnt
              }])
            },
          }, SetOptions(merge: true));

          DocumentSnapshot docSnapshot = await firestore.collection('kid_details').doc(userId).get();

          int previousCoinEarned = docSnapshot.get('coinEarned') ?? 0;
          int updatedCoinEarned = previousCoinEarned + coinEarned;

          await firestore.collection('kid_details').doc(userId).set({
                "coinEarned": updatedCoinEarned
              }, SetOptions(merge: true));
            // print("Successful");
          return ReturnedStatus(message: "", success: true);

        
      } catch (e) {
        print(e);
        return ReturnedStatus(message: "", success: false);
      }
}

getKidCoin(userId) async {

      try {
        DocumentSnapshot docSnapshot = await firestore.collection('kid_details').doc(userId).get();

        return ReturnedStatus(message: "", success: true, otherData: {'coin':docSnapshot.get('coinEarned')});
        
      } catch (e) {
        return ReturnedStatus(message: "", success: false);
      }
}

    
}