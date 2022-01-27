import 'package:flutter/material.dart';

class RowToColumn extends StatelessWidget {
  const RowToColumn({Key? key, this.children}) : super(key: key);

  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 50, minWidth: 50),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = MediaQuery.of(context).size.width > 992;
          final items = [
            for (var i = 0; i < children!.length; i++) ...[
              children![i],
              if (i != children!.length - 1)
                SizedBox(
                  width: 16,
                ),
            ],
          ];
          if (isDesktop) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items,
            );
          } else {
            return Column(
              children: [
                for (var item in items)
                  Row(
                    children: [item],
                  )
              ],
            );
          }
        },
      ),
    );
  }
}
