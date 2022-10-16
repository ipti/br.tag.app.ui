import 'package:tag_ui/tag_ui.dart';
import 'package:flutter/material.dart';

class TagBox extends StatelessWidget {
  const TagBox(
      {super.key,
      required this.child,
      this.minHeight = 0,
      this.minWidth = 0,
      this.background,
      this.padding});

  final Widget child;
  final double minHeight;
  final double minWidth;
  final Color? background;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: minHeight, minWidth: minWidth),
        padding: padding ?? EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(
            TagBorderRadiusValues.borderRadiusNormal,
          ),
        ),
        child: child);
  }
}
