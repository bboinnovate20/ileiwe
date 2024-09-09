import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ileiwe/app/library/data/models/book.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/cores/common/custom_toast.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
import 'package:ileiwe/cores/common/widgets/network_image.dart';

class BookCarousel extends StatefulWidget {
  const BookCarousel({super.key, required this.books});

  final List<Book> books;

  @override
  State<BookCarousel> createState() => _BookCarouselState();
}

class _BookCarouselState extends State<BookCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.6);
  int _currentPage = 0;


  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    SizedBox(
                      height: 300,
                      
                      child: PageView.builder(
                                        controller: _pageController,
                                        itemCount: widget.books.length,
                                        itemBuilder: (context, index) {
                                          bool isActive = index == _currentPage;
                                          return _buildBookCard(widget.books[index], isActive);
                                        },
                                      )),
                                const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.books.length,
                        (index) => _buildDotIndicator(index == _currentPage),
                      ),
                    ),
                  ],
                );
              


            
            
  
  }

  Widget _buildBookCard(Book book, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutQuint,
      
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: isActive ? 0 : 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: imageNetwork(book.imagePath),

      ),
    );
  }

  

  Widget _buildDotIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}