import 'package:flutter/material.dart';

class TopNav extends StatelessWidget {
  const TopNav({super.key, required this.title, this.style, this.canGoBack = true});

  final String title;
  final TextStyle? style;
  final bool canGoBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          canGoBack == true ? const Icon(Icons.arrow_back_rounded, size: 40, color: Colors.black, ) : Container(),
          const SizedBox(width: 10),
          Expanded(
            child: Text(title, style: style ?? Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 30), textAlign: TextAlign.center,),
          ),
          
        ],
      ),
    );
  }
}