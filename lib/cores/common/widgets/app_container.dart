
import 'package:flutter/material.dart';
import 'package:ileiwe/app/dashboard/view/widgets/persistent_header.dart';
import 'package:ileiwe/cores/common/widgets/top_nav.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,  this.child,
    this.appBar,
    this.padding,
    this.margin,
    this.children,
    this.title,
    this.canGoBack = true
  });

  final Widget? child;
  final AppBar? appBar;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  
  final List<Widget>? children;
  final String? title;
  final bool canGoBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      
      body: Container(
        padding: padding,
        margin: margin,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: children != null ? SafeArea(
          child: CustomScrollView(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: StickyHeaderDelegate(
                          child:  TopNav(title: title ?? "", canGoBack: canGoBack),
                          maxHeight: 80, // Adjust this value based on your TopHeader height
                          minHeight: 60,  // Minimum height when fully collapsed
                        ),
                      ),
                      ...children!
                    ],
            ),
        ) : child,
      ),
    );
  }
}