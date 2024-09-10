import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/login_screen.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/data/models/e_library_category.dart';
import 'package:ileiwe/app/library/data/models/video.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/app/library/view/e_book_library_screen.dart';
import 'package:ileiwe/app/library/view/widget/all_skits.dart';
import 'package:ileiwe/app/library/view/widget/custom_search.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
import 'package:ileiwe/cores/common/widgets/network_image.dart';

import 'dart:async';

class SkitLibraryScreen extends ConsumerStatefulWidget {
  const SkitLibraryScreen({
    super.key,
    // required this.title,
    // required this.libraryCategoryId,
    // required this.bookCategoryId,
  });

  // final String libraryCategoryId;
  // final String bookCategoryId;
  // final String title;

  @override
  ConsumerState<SkitLibraryScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends ConsumerState<SkitLibraryScreen> {
  late TextEditingController _searchController;
  List<Video> _filteredSkits = [];
  List<Video> _allCacheSkit = [];
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
    
    final allCategories = ref.watch(skitLibraryCategoryProvider(limit: false));
    final allSkits =  ref.watch(getAllVideoLibraryProvider(limit: false));

    return AppContainer(
      canGoBack: true,
      title: "Skit Library",
      addHeader: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),

            _searchController.text.isEmpty ? allCategories.when(
              data: (categories) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:20),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                Text("Categories", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),),
                                GestureDetector(
                                  onTap: () => context.push(RoutesName.eLibraryCategories),
                                  child: Text("See all >", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),))
                              ],),
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
                                      final ESkitCategory assess = categories[index];
                                      return GestureDetector(
                                        onTap: () => context.push(
                                        RoutesName.eLibraryCategoriesBooks,
                                        extra: {
                                          'title': assess.name,
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
                                        )),
                                           width: 180, 
                                           child:  Align(alignment: Alignment.center,child: 
                                        Text(assess.name , style: const TextStyle(fontSize: 20, color: Colors.white),),),
                                        ).animate().scale(duration: 300.ms, delay: (100 * index+1).ms , begin: const Offset(0.5, 0.5), end: const Offset(1, 1) )
                                        ,),
                                      ); },)),
                    ],
                  )
                  
                  );
              }, 
              error: (err, _) => errorWidget(), loading: () => loadingWidget()
              
            ): Container(),

            allSkits.when(
              data: (skits){
                 if(!isActive){
                      _filteredSkits = skits;
                   }
                  _allCacheSkit = skits;
                   isActive = true;
                return Expanded(child:  AllSkits(
                  showHeader: _searchController.text.isEmpty,
                  skits: _searchController.text.isEmpty ? skits : _filteredSkits));
              }, 
              error: (err, _) => errorWidget(), 
              loading: () => loadingWidget())
            // const Expanded(child:  AllSkits())
          ],
        ),
      ),
    );
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

