
import 'package:flutter/material.dart';

class DumbHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      key: Key("actionsHeader"),
      color: Colors.amber,
      height: maxExtent,
      child: const Text("batata"),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}