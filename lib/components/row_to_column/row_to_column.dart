import 'package:flutter/material.dart';

class RowToColumn extends StatelessWidget {
  const RowToColumn({
    Key? key,
    required this.children,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final List<Widget> children;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: constraints.copyWith(
          minHeight: 50,
          minWidth: 50,
          // maxWidth: MediaQuery.of(context).size.width,
          // maxHeight: MediaQuery.of(context).size.height,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = MediaQuery.of(context).size.width > 992;
            final items = [
              for (var i = 0; i < children.length; i++) ...[
                children[i],
                if (i != children.length - 1)
                  SizedBox(
                    width: 16,
                  ),
              ],
            ];
            if (isDesktop) {
              return Row(
                crossAxisAlignment: rowCrossAxisAlignment,
                children: items,
              );
            } else {
              return Column(
                crossAxisAlignment: columnCrossAxisAlignment,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var item in items)
                    Flexible(
                      child: Row(
                        crossAxisAlignment: rowCrossAxisAlignment,
                        children: [item],
                      ),
                    )
                ],
              );
            }
          },
        ),
      );
    });
  }
}
