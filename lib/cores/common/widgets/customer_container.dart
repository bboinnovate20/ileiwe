import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({
    super.key,
    required this.child,
    this.bottomSheet,
    this.appBar,
  });

  final Widget child;
  final Widget? bottomSheet;
  final Widget? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: appBar != null ? SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.paddingOf(context).top * 2.2, left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(onTap: () => context.pop(), child: appBar)),
        ),
      ) : null,
      
      // appBar: appBar,
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomSheet: bottomSheet,
      body: Stack(
        children: [
          
          Align(
            alignment: Alignment.center,
            child: ClipPath(child: Image.asset("assets/images/bg_path_2.png",  
                height: MediaQuery.of(context).size.height, fit: BoxFit.contain,)),
          ),

              SafeArea(child: Padding(
            padding: appBar!= null ? EdgeInsets.only(top: MediaQuery.paddingOf(context).top +15) : const EdgeInsets.all(0),
            child: child,
          )),
  
          
          
      
        ],
      ),
    );
  }
}