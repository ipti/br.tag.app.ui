import 'package:flutter/material.dart';

import 'package:tag_ui/tag_ui.dart';

class LayoutTopBarAndBody extends StatelessWidget {
  const LayoutTopBarAndBody({Key? key, required this.body, this.drawer})
      : super(key: key);

  final Widget? body;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TagColors.colorBaseWhiteNormal,
      drawer: drawer,
      appBar: TagAppBar(),
      body: body,
    );
  }
}
