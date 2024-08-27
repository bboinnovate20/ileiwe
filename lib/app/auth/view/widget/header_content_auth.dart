import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeaderContentAuth extends StatelessWidget {
  const HeaderContentAuth({
    super.key,
    required this.mainHeader,
    required this.content
  });

  final String mainHeader;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
                
         children: [
          
            Text(mainHeader, style: const TextStyle(fontSize: 26, wordSpacing: 0, 
           fontWeight: FontWeight.bold, color: Colors.white),).animate().fade(duration:500.ms).moveY(duration: 500.ms),
           const SizedBox(height: 10),
          
            Text(content, 
           textAlign: TextAlign.left,
           style: const TextStyle(fontSize: 24, wordSpacing: 0, 
           fontWeight: FontWeight.w500, color: Colors.white),).animate().fade(duration: 500.ms)
           
         ],
       ),
     ],
                );
  }
}