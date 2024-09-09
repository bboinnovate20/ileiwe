import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({
    super.key,
    required this.child,
    this.bottomSheet,
    this.appBar,
    this.isNotScrollable = false,
    this.canGoBack =true
  });

  final Widget child;
  final Widget? bottomSheet;
  final Widget? appBar;
  final bool isNotScrollable;
  final bool canGoBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      extendBody: true,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: canGoBack ? AppBar(
        leading: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(onTap: () => context.pop(), child: Container(    
            decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(top: 10, left: 20),
            child: const Icon(Icons.arrow_back_rounded, size: 30, color: Color.fromARGB(255, 79, 6, 91),)),)) ,
      ): null,
      
      // appBar: appBar,
      // backgroundColor: Theme.of(context).colorScheme.surface,
      bottomSheet: bottomSheet,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_auth.png"),
            fit: BoxFit.cover,
          )),
        child:  isNotScrollable ?   SingleChildScrollView(
               child: SafeArea(child: child)
             ): SafeArea(child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: child)),
      )
    );
  }
}