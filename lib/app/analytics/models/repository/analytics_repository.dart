import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:ileiwe/cores/utils/shuffle_questions.dart';

class AnalyticsRepository {

  AnalyticsRepository({required this.firestore});

  final FirebaseFirestore firestore;

Future<ReturnedStatus> getAllSkillsPerformance(userId) async {

      try {
        final docSnapshot = await firestore.collection('quizzes').get();
        final d = docSnapshot;
        

        final List<QueryDocumentSnapshot> documents = d.docs;
        
        final performanceList = [];
        num totalChapters = 0;
        num currentPerformance = 0;

        for (var doc in documents) {
          final data = doc.data() as Map<String, dynamic>;

            Map cChapter = {'totalQuiz': data['totalChapters'], 'quizId': doc.id};
            totalChapters = totalChapters + data['totalChapters'];

            final getCurrentUserSkill = await firestore.collection('kids_skills_learning').doc(userId).get();


            
            if(getCurrentUserSkill.exists) {

                final chapter = getCurrentUserSkill.data()?[doc.id];
                if(chapter != null) {

                    if(chapter['isCompleted'] == true) {

                      cChapter.addAll({'currentChapter': chapter['currentChapter']});
                      currentPerformance = currentPerformance + chapter['currentChapter'];

                    }
                    else {
                      cChapter.addAll({'currentChapter': chapter['currentChapter'] - 1});
                      currentPerformance = currentPerformance + chapter['currentChapter'] - 1;
                    }
                    performanceList.add(cChapter);
                }
    
            }


            
            // print(doc.id); 
            // print(doc.data()); 
        }
            
    
        return ReturnedStatus(message: "success", success: true, data: {'performance': performanceList, 'overall': currentPerformance/totalChapters});
        
      } catch (e) {
        print("error");
        print(e);
        return ReturnedStatus(message: "", success: false);
      }
      
  }



    
}