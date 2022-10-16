import 'package:flutter/material.dart';
import 'layout_left_body_right.dart';
import 'layout_topbar_and_body.dart';

class MainLayoutAdaptativy extends StatelessWidget {
  const MainLayoutAdaptativy(
      {super.key, this.left, this.body, this.right, this.appBar});

  final Widget? left;
  final Widget? body;
  final PreferredSize? appBar;
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

        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: LayoutTopBarAndBody(
            appBar: appBar,
            body: body,
            drawer: left,
          ),
        );
      },
    );
  }
}
