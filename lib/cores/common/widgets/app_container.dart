import 'package:flutter/material.dart';
import 'package:ileiwe/app/dashboard/view/widgets/persistent_header.dart';
import 'package:ileiwe/cores/common/widgets/top_nav.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.child,
    this.appBar,
    this.padding,
    this.margin,
    this.children,
    this.title,
    this.canGoBack = true,
    this.bottomSheet,
    this.addHeader = false,
    this.isCustom = false,
    this.singleHeader,
  });

  final Widget? child;
  final AppBar? appBar;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<Widget>? children;
  final String? title;
  final bool canGoBack;
  final Widget? bottomSheet;
  final bool addHeader;
  final bool isCustom;
  final Widget? singleHeader;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (children != null) {
      content = Column(
        children: [
          // singleHeader ?? Container(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                if (addHeader)
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyHeaderDelegate(
                      child: TopNav(title: title ?? "", canGoBack: canGoBack),
                      maxHeight: 80,
                      minHeight: 60,
                    ),
                  ),
                ...children!
              ],
            ),
          ),
        ],
      );
    } else if (child != null && !isCustom) {
      content =  Column(
          children: [
            if (addHeader)
              TopNav(title: title ?? "", canGoBack: canGoBack),
            Expanded(child: child!),
          ],
        );
    } else {
      content = SingleChildScrollView(child: child); // Empty container if no content is provided
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      bottomSheet: bottomSheet,
      body: Container(
        padding: padding,
        margin: margin,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(child: content),
      ),
    );
  }
}