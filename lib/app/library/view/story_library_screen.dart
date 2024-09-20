
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/login_screen.dart';
import 'package:ileiwe/app/club/providers/club_provider.dart';
import 'package:ileiwe/app/dashboard/view/dashboard_screen.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/data/models/e_library_category.dart';
import 'package:ileiwe/app/library/data/models/video.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/app/library/view/e_book_library_screen.dart';
import 'package:ileiwe/app/library/view/widget/all_skits.dart';
import 'package:ileiwe/app/library/view/widget/custom_search.dart';
import 'package:ileiwe/constant/constants.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
import 'package:ileiwe/cores/common/widgets/network_image.dart';

import 'dart:async';

class StoryLibraryScreen extends ConsumerStatefulWidget {
  const StoryLibraryScreen({
    super.key,
    // required this.title,
    // required this.libraryCategoryId,
    // required this.bookCategoryId,
  });

  // final String libraryCategoryId;
  // final String bookCategoryId;
  // final String title;

  @override
  ConsumerState<StoryLibraryScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends ConsumerState<StoryLibraryScreen> {
  late TextEditingController _searchController;
  List<Video> _filteredSkits = [];
  final List<Video> _allCacheSkit = [];
  Timer? _debounce;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {

        setState(() {
          _filteredSkits = _allCacheSkit .where((skit) =>
            skit.title.toLowerCase().contains(query.toLowerCase()) ||
            skit.categoryName.toLowerCase().contains(query.toLowerCase())
          ).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final allCLubs = ref.watch(storyBooksAndCategoryProvider);

    return AppContainer(
      canGoBack: true,
      title: "Story Library",
      addHeader: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(
                controller: _searchController,
                onChanged: _onSearchChanged,
              ),
              const Gap(15),
              
              
              allCLubs.when(
                  data: (data) {
                    final categories = data["categories"] as List<ELibraryCategory>;
                     final stories = data["stories"] as List<Book>;
                     final popular = (data["books"] as List<Book>).where((story) {
                        return story.totalReaders >= mostPopularMetric;
                  
                     }).toList();

                     
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text("Recent Stories", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),),
                          ),
                          const Gap(10),
                        SizedBox(
                          height: 150,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                                  final story = stories[index];
                                  return GestureDetector(
                                    onTap: () => context.push(RoutesName.eLibraryBookIntro, extra: story),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(story.imagePath),
                                    ),
                                  );
                                
                          
                                }, separatorBuilder: (context, index) => const Gap(10), itemCount: stories.length),
                              ),
                        ),
                        const Gap(20),
                         const SizedBox(
                              child: ContinueReadingCard(title: "Sleep Over and other Stores", 
                              author: "Fox Chick", coverImagePath: "assets/images/sleep_over.png", progress: 0.5),
                            ),

                            const Gap(20),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Categories", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),),
                                  GestureDetector(
                                    onTap: () => context.push(RoutesName.eLibraryCategories),
                                    child: Text("See all >", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),))
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 100,
                              child:   
                                   ListView.separated(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                
                                const Gap(20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text("Most Popular", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),),
                                      const Gap(10),
                                      ...popular.map((book) {
                                        return _popularWidget(book);
                                      })
                                    ],
                                  ),
                                ),

                          ]);
                  },
                  error:(err, _) => errorWidget(), 
                  loading: () => loadingWidget()),
              
        
            ],
          ),
        ),
      ),
    );
  
  
  }

  Container _popularWidget(Book book) {
    return Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration:  BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(book.imagePath,
                                            width: 60,),
                                          ),
                                          const Gap(10),
                                           Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(book.name , style: const TextStyle(fontSize: 18),),
                                                Text(book.author)
                                              ],
                                            ),
                                           
                                          ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: storyStatus(book.isPremium ? "Premium": "Free"),
                                            )
                                        ],
                                      ),
                                    );
  }

  Container storyStatus(String status) {
    if(status == "Free") {
      return    Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
               decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               color: Colors.green.withOpacity(0.5)),
               child: const Text("Free", style:  
              TextStyle(color: Color.fromARGB(255, 4, 100, 7), fontSize: 12),));
    }

   if(status == "Premium") {
      return    Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
               decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               color: Colors.yellow.withOpacity(0.5)),
               child: const Text("Premium", style:  
              TextStyle(color: Colors.red, fontSize: 12),));
    }
    return Container();
  }
}

class AllBooks extends StatelessWidget {
  const AllBooks({
    super.key,
    required this.book
  });

  final List<Book> book;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
                    height: 500,
                    child:GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1 / 2.25,
                      children: List.generate(book.length, (index) {
                        final bk = book[index];
                        return GestureDetector(
                          onTap: () => context.push(RoutesName.eLibraryBookIntro, extra: bk),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text(bk.name, style: const TextStyle(fontWeight: FontWeight.bold),), 
                              Text(bk.author, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54),), 
                            ],
                          ),
                        );
                      }),
                    )
      
                  ),
    );
  }
}

