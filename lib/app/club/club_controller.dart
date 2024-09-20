

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ileiwe/app/club/data/models/club.dart';
import 'package:ileiwe/app/club/providers/club_provider.dart';

class ClubController {

  ClubController({required this.ref});

  final WidgetRef ref;


  Future<List<Club>>getClubs() async {
    final allClubs = await ref.read(clubRepositoryProvider).getAllClubs();
    
    if(allClubs.success){
        return (allClubs.data as List).cast<Map<String, Object?>>().map(Club.fromJson).toList();
    }
    return [];
  }

  
  
}