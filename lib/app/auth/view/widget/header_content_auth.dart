import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeaderContentAuth extends StatelessWidget {
  const HeaderContentAuth({
    super.key,
    required this.mainHeader,
    required this.content,
    required this.imageName,
     this.right,
     this.top,
     this.imageHeight
  });

  final String mainHeader;
  final String content;
  final String imageName;
  final double? right;
  final double? top;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
     children: [
       Align(
         alignment: Alignment.centerLeft,
         
         child: Padding(
           padding: const EdgeInsets.only(left:20.0, top: 5),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
                    
             children: [
              
                Text(mainHeader, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white, fontSize: 32)).animate().fade(duration:500.ms).moveY(duration: 500.ms),
               const SizedBox(height: 10),
              
                Text(content, 
               textAlign: TextAlign.left,
               style: const TextStyle(fontSize: 24, wordSpacing: 0, 
               fontWeight: FontWeight.w500, color: Colors.white),).animate().fade(duration: 500.ms)
               
             ],
           ),
         ),
       ),
      
       Positioned(
        right: right ?? -10,
        top: top ?? 0,
         child: SizedBox(
          
           child: Image.asset('assets/images/$imageName.png', fit: BoxFit.contain, height: imageHeight ??180,),
         ),
       )
     ],
                );
  }
}