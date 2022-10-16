import 'package:flutter/material.dart';

class ShowOnDesktop extends StatelessWidget {
  ShowOnDesktop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 992;
    if (isDesktop) return child;

    return Container();
  }
}
