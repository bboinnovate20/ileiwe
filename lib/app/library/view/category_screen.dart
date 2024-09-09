import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/app/library/view/e_book_library_screen.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final categories = ref.watch(eLibraryCategoryProvider(limit: false));
    

    return  AppContainer(
      canGoBack: true,
      title: "Category",
      addHeader: true,
      child: categories.when(
        data: (category) {
          return   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.5 / 1,
                                children: List.generate(category.length, (index) {
                                final assess = category[index];
                                  return GestureDetector(
                                    onTap: () => context.push(
                                      RoutesName.eLibraryCategoriesBooks,
                                      extra: {
                                        'title': assess.categoryName,
                                        'libraryCategoryId': assess.libraryId,
                                        'bookCategoryId': assess.id
                                      }
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        
                                        decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image:  NetworkImage(assess.imagePath),
                                            fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.5), // Adjust opacity as needed
                                                  BlendMode.darken, // Blend mode to darken the image
                                                ),
                                          )
                                        ),
                                        
                                        // height: 40,
                                        child:  Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(assess.categoryName , style: const TextStyle(fontSize: 20, color: Colors.white),),
                                              Text("${assess.numberOfBooks}" , style: const TextStyle(fontSize: 14, color: Colors.white),),
                                            ],
                                          ),),
                                      ),
                                                                  
                                      
                                    ),
                                  );
                                }),
                              ),
                );
        },
        error: (err, _) => errorWidget(),
        loading: () => loadingWidget()
      )
      
      
    
    );
  }
}