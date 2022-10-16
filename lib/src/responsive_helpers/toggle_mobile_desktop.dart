import 'package:flutter/material.dart';

class ToggleMobileDesktop extends StatelessWidget {
  ToggleMobileDesktop({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  final Widget mobile;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 992;
    if (isDesktop) return desktop;

    return mobile;
  }
}
