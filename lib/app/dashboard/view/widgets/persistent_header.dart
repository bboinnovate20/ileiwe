import 'package:flutter/material.dart';
import 'dart:math' as math;

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  StickyHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxHeight;
    
    return Container(
      height: math.max(maxHeight - shrinkOffset, minHeight),
      color: Colors.white.withOpacity(progress.clamp(0.0, 0.8)), // Background becomes more opaque as you scroll
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

