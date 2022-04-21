import 'package:flutter/material.dart';
import 'package:tag_ui/components/components.dart';
import 'package:tag_ui/design_tokens/tokens.dart';

class TagDataTable extends StatelessWidget {
  const TagDataTable({
    Key? key,
    required this.columns,
    required this.source,
    this.onTapRow,
  }) : super(key: key);

  final List<DataColumn> columns;
  final DataTableSource source;
  final void Function(int)? onTapRow;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(minWidth: constraints.maxWidth),
        child: _TagTable(
          onTapRow: onTapRow,
          columns: columns,
          source: source,
        ),
      ),
    );
  }
}

class _TagTable extends StatelessWidget {
  const _TagTable({
    Key? key,
    required this.columns,
    required this.source,
    this.onTapRow,
  }) : super(key: key);

  final List<DataColumn> columns;
  final DataTableSource source;
  final void Function(int)? onTapRow;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 992;
    return Column(
      children: [
        if (isDesktop)
          SizedBox(
            height: 30,
            child: Builder(builder: (context) {
              final headers = columns
                  .map(
                    (e) => _Header(child: e.label),
                  )
                  .toList();
              return Row(
                children: [...headers, SizedBox(width: 50)],
              );
            }),
          ),
        if (isDesktop)
          Divider(
            height: 1,
            color: TagColors.colorBaseInkLight,
          ),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: source.rowCount,
            itemBuilder: (context, index) {
              final item = source.getRow(index);
              final cells = item!.cells.map((e) => _Cell(child: e.child));

              final cellsDivided = cells.fold<List<Widget>>(
                [],
                (previousValue, element) => previousValue
                  ..addAll(
                    [
                      element,
                      if (isDesktop)
                        Container(
                          height: 30,
                          width: 2,
                          color: TagColors.colorBaseCloudLightHover,
                        ),
                    ],
                  ),
              );

              return Container(
                color: TagColors.colorBaseProductLighter,
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => onTapRow != null ? onTapRow!(index) : null,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints: constraints,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RowToColumn(
                              rowCrossAxisAlignment: CrossAxisAlignment.center,
                              children: cellsDivided,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Icon(Icons.keyboard_arrow_right),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: child,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: child,
      ),
    );
  }
}
