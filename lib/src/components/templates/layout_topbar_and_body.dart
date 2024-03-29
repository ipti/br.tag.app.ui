import 'package:flutter/material.dart';

import 'package:tag_ui/tag_ui.dart';

class LayoutTopBarAndBody extends StatelessWidget {
  const LayoutTopBarAndBody({
    Key? key,
    required this.body,
    this.drawer,
    this.appBar = const TagAppBar(),
  }) : super(key: key);

  final Widget? body;
  final Widget? drawer;
  final PreferredSize? appBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TagColors.colorBaseWhiteNormal,
        drawer: drawer,
        appBar: appBar ?? const TagAppBar(),
        body: body,
      ),
    );
  }
}
