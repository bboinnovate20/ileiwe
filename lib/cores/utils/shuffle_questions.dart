import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ileiwe/app/quizes/models/data/question.dart';

List pickRandomQuestions(List<QueryDocumentSnapshot> questions, int numberOfQuestions) {

  if (numberOfQuestions > questions.length) {
    numberOfQuestions = questions.length;
  }

  questions.shuffle(Random());

  // Pick the first 'n' questions from the shuffled list
  return convertToData(questions.sublist(0, numberOfQuestions));
}

convertToData(List<QueryDocumentSnapshot>   questions) {
  return questions.map((question) {
        final data = question.data() as Map<String, dynamic>;
        return {'id': question.id, ...data};
  
  }).toList();
}