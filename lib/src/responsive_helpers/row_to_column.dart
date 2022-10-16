import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class RowToColumn extends StatelessWidget {
  const RowToColumn({
    super.key,
    required this.children,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.start,
    this.spaceColumns = 16,
  });

  final List<Widget> children;
  final double? spaceColumns;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final items = children.fold<List<Widget>>([], (items, child) {
        return items
          ..addAll([child, SizedBox(width: spaceColumns)])
          ..removeLast();
      });

      return ConstrainedBox(
        constraints: constraints.copyWith(
          minWidth: 50,
        ),
        child: ToggleMobileDesktop(
          desktop: _WhenDesktop(
            items: items,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
          ),
          mobile: _WhenMobile(
            items: items,
            columnCrossAxisAlignment: columnCrossAxisAlignment,
            rowCrossAxisAlignment: rowCrossAxisAlignment,
          ),
        ),
      );
    });
  }
}

class _WhenDesktop extends StatelessWidget {
  const _WhenDesktop({
    required this.rowCrossAxisAlignment,
    required this.items,
  });

  final CrossAxisAlignment rowCrossAxisAlignment;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: rowCrossAxisAlignment,
      children: items,
    );
  }
}

class _WhenMobile extends StatelessWidget {
  const _WhenMobile({
    required this.columnCrossAxisAlignment,
    required this.items,
    required this.rowCrossAxisAlignment,
  });

  final CrossAxisAlignment columnCrossAxisAlignment;
  final List<Widget> items;
  final CrossAxisAlignment rowCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final children = [
      for (var item in items)
        Flexible(
          child: Row(
            crossAxisAlignment: rowCrossAxisAlignment,
            children: [item],
          ),
        )
    ];

    return Column(
        crossAxisAlignment: columnCrossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: children);
  }
}
