import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/game/view/game_screen.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/data/models/e_library_category.dart';
import 'package:ileiwe/app/library/library_controller.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/app/library/view/widget/book_carousel.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
import 'package:ileiwe/cores/common/widgets/network_image.dart';
import 'package:ileiwe/cores/common/widgets/toast_view.dart';

class EBookLibraryScreen extends ConsumerWidget {
  const EBookLibraryScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
      
      final allCategories = ref.watch(allBookAndCategoryProvider(limit: false));
      // final controller = LibraryController(ref: ref, context: context);
      // controller.getAllBooks();

      
    return  AppContainer(
      title: "E-Book Library",
      canGoBack: true,
      addHeader: true,
      child: allCategories.when(data: 
          (data) {
            final categories = data['categories'] ;
            final books = data['books'] as List<Book>;

            return       Column(children: 
              [
                const Gap(20),
              BookCarousel(books: books),
              const Gap(20),
              Expanded(child: 
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            child: ContinueReadingCard(title: "Sleep Over and other Stores", 
                            author: "Fox Chick", coverImagePath: "assets/images/sleep_over.png", progress: 0.5),
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Categories", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),),
                              GestureDetector(
                                onTap: () => context.push(RoutesName.eLibraryCategories),
                                child: Text("See all >", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),))
                            ],
                          ),
                          const Gap(5),
                          
                          SizedBox(
                            height: 100,
                            child:   
                                 ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  separatorBuilder: (context, index) {
                                    return const Gap(10);
                                  },
                                  itemBuilder: (context, index) {
                                    final ELibraryCategory assess = categories[index];
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
                                              image:  
                                              NetworkImage(assess.imagePath),
                                        fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5), // Adjust opacity as needed
                                              BlendMode.darken, // Blend mode to darken the image
                                            ),
                                      )
                                                                        ),
                                                                        width: 180,
                                                                        // height: 40,
                                                                        child:  Align(alignment: Alignment.center,child: 
                                      Text(assess.categoryName , style: const TextStyle(fontSize: 20, color: Colors.white),),),
                                ).animate().scale(duration: 300.ms, delay: (100 * index+1).ms , begin: const Offset(0.5, 0.5), end: const Offset(1, 1)),
                                ),
                                    ); },)),
                            
                          const Gap(30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Features Books", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),),
                              Text("See all >", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),)
                            ],
                          ),
                          const Gap(20),

                          SizedBox(
                            height: 500,
                            child:GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1 / 2.25,
                              children: List.generate(books.length, (index) {
                                final bk = books[index];
                                return Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.blue, 
                                      ),
                                      
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: imageNetwork(bk.imagePath))
                                    ),
                                    const Gap(10),
                                    Text(bk.name, style: const TextStyle(fontWeight: FontWeight.bold),), // Example text with index
                                  ],
                                );
                              }),
                            )

                          )

                        
                        ],
                      ),
                    ),
                  )
                  
              ),            
            ]

    );
          }, 
        error: (e, _) =>  Text(e.toString()),
        loading: () => loadingWidget()));
 
 
 }
}