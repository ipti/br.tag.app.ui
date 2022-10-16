import 'package:flutter/material.dart';

import 'package:tag_ui/tag_ui.dart';

class LayoutLeftAndBody extends StatelessWidget {
  const LayoutLeftAndBody({
    super.key,
    required this.body,
    this.left,
  });

  final Widget? left;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TagColors.colorBaseWhiteNormal,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _LayoutPages(
          left: left,
          center: body,
        ),
      ),
    );
  }
}

class _LayoutPages extends StatelessWidget {
  const _LayoutPages({
    required this.left,
    required this.center,
  });

  final Widget? left;
  final Widget center;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 3,
            child: left ?? Container(),
          ),
          Flexible(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: center,
            ),
          ),
        ],
      ),
    );
  }
}
