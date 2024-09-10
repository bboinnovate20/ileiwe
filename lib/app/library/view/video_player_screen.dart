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
import 'package:ileiwe/app/library/view/widget/video_card.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
import 'package:ileiwe/cores/common/widgets/network_image.dart';

import 'dart:async';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  const VideoPlayerScreen({
    super.key,
    required this.video

  });

  final Video video;


  @override
  ConsumerState<VideoPlayerScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends ConsumerState<VideoPlayerScreen> {


  final _controller = YoutubePlayerController();

  @override
  void initState() {
    super.initState();

    _controller.loadVideoById(videoId: widget.video.videoId); 
  }
  
  @override
  Widget build(BuildContext context) {

    return  AppContainer(
      canGoBack: true,
      title: widget.video.title,
      addHeader: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: 500,
        decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(12)),
      child: YoutubePlayer( 
            controller: _controller,
            aspectRatio: 16 / 9,    
          ),
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

