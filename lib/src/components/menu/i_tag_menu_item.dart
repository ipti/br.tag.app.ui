import 'package:flutter/widgets.dart';

abstract class ITagMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final bool isActive;
  final void Function(String route) onTap;

  const ITagMenuItem({
    required this.title,
    required this.route,
    required this.onTap,
    this.isActive = false,
  });

  
}
