import 'package:flutter/material.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  final Widget child;

  SliverCustomHeaderDelegate(
      {@required this.child,
      @required this.minHeight,
      @required this.maxHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // return SizedBox.expand(
    //   child: child,
    return child;
    //TOD)" crear chil aqui mismo "
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate;
  }
}
