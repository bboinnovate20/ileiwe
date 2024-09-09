import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/view/kid_detail_screen.dart';
import 'package:ileiwe/constant/routes.dart';

class TopNav extends StatelessWidget {
  const TopNav({super.key, required this.title, this.style, this.canGoBack = true, this.action = _defaultAction });

  final String title;
  final TextStyle? style;
  final bool canGoBack;
  final Function() action;
  
  static void _defaultAction() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          canGoBack == true ? GestureDetector(
            onTap: () async {
              if(context.mounted) {
                try {
                  context.pop();
                  
                } catch (e) {
                  context.go(RoutesName.homeDashboard); 
                }
              }
            },
            child: const Icon(Icons.arrow_back_rounded, size: 30, color: Colors.black, )) : Container(),
          Expanded(
            child: Text(title, style: style ?? Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 25), textAlign: TextAlign.center,),
          ),
          
        ],
      ),
    );
  }
}