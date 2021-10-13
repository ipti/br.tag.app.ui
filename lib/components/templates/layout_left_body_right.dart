import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutLeftBodyRight extends StatelessWidget {
  const LayoutLeftBodyRight({
    Key? key,
    required this.body,
    this.left,
    this.right,
  }) : super(key: key);

  final Widget? left;
  final Widget? body;
  final Widget? right;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _LayoutPages(
          left: left,
          center: body,
          right: right,
        ),
      ),
    );
  }
}

class _LayoutPages extends StatelessWidget {
  const _LayoutPages({Key? key, this.left, this.center, this.right})
      : super(key: key);

  final Widget? left;
  final Widget? center;
  final Widget? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(flex: 4, child: left ?? Container()),
          Flexible(
            flex: right != null ? 12 : 16,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: center,
            ),
          ),
          if (right != null) Flexible(flex: 4, child: right ?? Container()),
        ],
      ),
    );
  }
}
