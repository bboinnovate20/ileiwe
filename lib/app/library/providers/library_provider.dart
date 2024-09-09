
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ileiwe/app/analytics/models/providers/analytics_provider.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/data/models/e_library_category.dart';
import 'package:ileiwe/app/library/data/repositories/library_repository.dart';
import 'package:ileiwe/app/library/view/e_book_library_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'library_provider.g.dart';

@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirebaseStorage firebaseStorage(FirebaseStorageRef ref) {
  return FirebaseStorage.instance;
}

@riverpod
LibraryRepository libraryRepository(LibraryRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  final storage = ref.watch(firebaseStorageProvider);


  return LibraryRepository(firestore: firestore, firebaseStorage: storage); 
}

@riverpod
Future<Map<String, dynamic>> allBookAndCategory(AllBookAndCategoryRef ref, {limit=true}) async {
  
    final response = await ref.read(libraryRepositoryProvider).getEBookCategories(limit: limit);
    final response2 = await ref.read(libraryRepositoryProvider).getEBookBook(limit: limit);
    
    try {
        if(response.success && response2.success) {
          
          List<ELibraryCategory> categories = [];
          List<Book> books = [];

          for (var category in response.data) {
                categories.add(ELibraryCategory.fromJson(category));
          }

          for (var book in response2.data) {
                
                books.add(Book.fromJson(book));
          }

          return {
            'categories': categories,
            'books': books,
            };
        }
        else {
          
          return  {'categories': [], 'books': []};
        }
      
    } catch (e) {
        
        return  {'categories': [], 'books': []};
    }
}

@riverpod
Future<List<ELibraryCategory>> eLibraryCategory(ELibraryCategoryRef ref, {limit=true}) async {
  
    final response = await ref.read(libraryRepositoryProvider).getEBookCategories(limit: limit);

    
    try {
        if(response.success) {
          
          List<ELibraryCategory> categories = [];

          for (var category in response.data) {
                categories.add(ELibraryCategory.fromJson(category));
          }



          return categories;
        }
        else {
          
          return  [];
        }
      
    } catch (e) {
        
        return  [];
    }
}



@riverpod
Future<List<ESkitCategory>> skitLibraryCategory(SkitLibraryCategoryRef ref, {limit=true}) async {
  
    final response = await ref.read(libraryRepositoryProvider).getSkitLibraryCategories(limit: limit);
    
    try {
        if(response.success) {  
          List<ESkitCategory> categories = [];

          for (var category in response.data) {
                categories.add(ESkitCategory.fromJson(category));
          }
          return categories;
        }
        return  [];
    } catch (e) {return  [];}
}



@riverpod
Future<List<Book>> books(BooksRef ref, {limit=true}) async {
    final response = await ref.read(libraryRepositoryProvider).getEBookBook(limit: limit);
    if(response.success) {
       List<Book> categories = [];

      for (var category in response.data) {
          
            categories.add(Book.fromJson(category));
      }
      return categories;
    }
    else {
      return  [];
    }
}


@riverpod
Future<List<Book>> categoryBook(CategoryBookRef ref, {limit=true, required libraryId, required categoryId}) async {
    final response = await ref.read(libraryRepositoryProvider).getCategoryBook(libraryId, categoryId, limit: limit);
    if(response.success) {
       List<Book> categories = [];

      for (var category in response.data) {
          
            categories.add(Book.fromJson(category));
      }
      return categories;
    }
    else {
      return  [];
    }
}

