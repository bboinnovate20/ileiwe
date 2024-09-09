 import 'package:flutter/material.dart';
import 'package:ileiwe/constant/routes.dart';

final List<Map<String, dynamic>> assessments = [
          {
            'title': "Literacy",
            'imageName': "little_boy_reading_smile",
            'color': [const Color(0xFFFDD667), const Color(0xFFD6B835)],
            'action': RoutesName.quizInstruction
          },
          {
            'title': "Reading",
            'imageName': "reading_little_boy",
            'color': [const Color(0xFF95D1FC), const Color(0xFF3F44D8)],
            'action': RoutesName.quizInstruction
          },
          {
            'title': "Writing",
            'imageName': "girl_writing",
            'color': [const Color(0xFFFD5A20), const Color(0xFFE2772F)],
            'action': RoutesName.quizInstruction
          },
          

    ];