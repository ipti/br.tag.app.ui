import 'package:flutter/material.dart';
import 'layout_left_body_right.dart';
import 'layout_topbar_and_body.dart';

class MainLayoutAdaptativy extends StatelessWidget {
  const MainLayoutAdaptativy({Key? key, this.left, this.body, this.right})
      : super(key: key);

  final Widget? left;
  final Widget? body;
  final Widget? right;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var isDesktop = constraints.maxWidth > 600;
        if (isDesktop) {
          return LayoutLeftBodyRight(
            body: body,
            left: left,
            right: right,
          );
        }
        return LayoutTopBarAndBody(
          body: body,
          drawer: left,
        );
      },
    );
  }
}
