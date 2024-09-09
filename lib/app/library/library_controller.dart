

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ileiwe/app/library/data/models/e_library_category.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';

class LibraryController {
  const LibraryController({required this.ref, required this.context});

  final WidgetRef ref;
  final BuildContext context;


  // Future<ELibraryCategory> getAllCollections ()async {
    
  //   final response = await ref.read(libraryRepositoryProvider).getEBookCategories();
  //   if(response.success) {
  //     return  ELibraryCategory.fromJson(response.data);
  //   }
  //   else {
  //     return  [] as ELibraryCategory;
  //   }
  // }

    getAllBooks ()async {
    
    final response = await ref.read(libraryRepositoryProvider).getCategoryBook("5oTOqxw7sPxlBwmFrg8n", "IIz48unaQFTuaSFAm6pe");

    // if(response.success) { 
    //   return  ELibraryCategory.fromJson(response.data);
    // }
    // else {
    //   return  [] as ELibraryCategory;
    // }
  }


}