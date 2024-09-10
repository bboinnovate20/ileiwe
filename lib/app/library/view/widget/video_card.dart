  import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/dashboard/view/dashboard_screen.dart';
import 'package:ileiwe/app/library/data/models/video.dart';
import 'package:ileiwe/constant/routes.dart';

Widget videoThumbnail(BuildContext context, Video videoInfo) {
    return GestureDetector(
      onTap: () => context.push(RoutesName.videoScreen, extra: videoInfo),
      child: Container(
        height: 200,
        decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
         image:  NetworkImage(videoInfo.thumbnailUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.5), // Adjust opacity as needed
            BlendMode.darken,),
                              )),
                                 width: 180, 
                                 child:   Padding(
                                  padding: const EdgeInsets.all(10),
                                   child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 185, 166, 3),
                                        borderRadius: BorderRadius.circular(10)
                                   
                                        ),
                                        child: Text(videoInfo.categoryName, style: const TextStyle(color: Colors.white, fontSize: 12),),
                                      ),
                                        const Expanded(
                                         child: Align(alignment: Alignment.center,child: 
                                         Icon(Icons.play_arrow_rounded, color: Colors.white, size: 40,) ,),
                                       ),
                                       Text(videoInfo.title, style: 
                                        Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white, fontSize: 18),),
                                     ],
                                   ),
                                 ),
                              ),
    );
  }


