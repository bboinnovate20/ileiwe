

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ileiwe/app/library/data/models/book.dart';

Widget imageNetwork(String imagePath, {width}) {
    return CachedNetworkImage(
          imageUrl: imagePath,  
          width: width,
          fit: BoxFit.cover, 
          // loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          //   if (loadingProgress == null) {
          //     return child;  
          //   } else {
          //     return Center(
          //       child: CircularProgressIndicator(
          //         value: loadingProgress.expectedTotalBytes != null
          //             ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
          //             : null,  
          //       ),
          //     );
          //   }
          // },
          // errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          //   return const Icon(Icons.error);  
          // },
        );
  }