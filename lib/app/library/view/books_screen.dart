import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/app/library/view/e_book_library_screen.dart';
import 'package:ileiwe/app/library/view/widget/custom_search.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
import 'package:ileiwe/cores/common/widgets/network_image.dart';

import 'dart:async';

class BooksScreen extends ConsumerStatefulWidget {
  const BooksScreen({
    super.key,
    required this.title,
    required this.libraryCategoryId,
    required this.bookCategoryId,
  });

  final String libraryCategoryId;
  final String bookCategoryId;
  final String title;

  @override
  ConsumerState<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends ConsumerState<BooksScreen> {
  late TextEditingController _searchController;
  List<Book> _filteredBooks = [];
  List<Book> _allCacheBook = [];
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
    print(query);
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        print('mounted');
        setState(() {
          _filteredBooks = _allCacheBook .where((book) =>
            book.name.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase())
          ).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(categoryBookProvider(
      limit: false,
      categoryId: widget.bookCategoryId,
      libraryId: widget.libraryCategoryId,
    ));

    print(_searchController.text.isEmpty);

    return AppContainer(
      canGoBack: true,
      title: widget.title,
      addHeader: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            CustomSearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),
            Expanded(
              child: books.when(
                data: (bookList) {
                   if(!isActive){
                      _filteredBooks = bookList;
                   }
                  _allCacheBook = bookList;
                   isActive = true;
                  return AllBooks(book: _searchController.text.isEmpty ? bookList : _filteredBooks);
                },
                error: (err, _) => errorWidget(),
                loading: () => loadingWidget(),
              ),
            ),
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

