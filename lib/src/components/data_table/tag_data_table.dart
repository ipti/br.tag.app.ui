import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

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
    return Column(
      children: [
        ShowOnDesktop(
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: _TableHead(
                  columns: columns,
                ),
              ),
              Divider(
                height: 1,
                color: TagColors.colorBaseInkLight,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 500,
          child: _TableBody(source: source, onTapRow: onTapRow),
        ),
      ],
    );
  }
}

class _TableBody extends StatelessWidget {
  const _TableBody({
    Key? key,
    required this.source,
    required this.onTapRow,
  }) : super(key: key);

  final DataTableSource source;
  final void Function(int p1)? onTapRow;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: source.rowCount,
      itemBuilder: (context, index) {
        final dataRow = source.getRow(index);
        if (dataRow == null) return Container();
        final row = _mapCellsChild(dataRow);

        return _TableRow(
          index: index,
          onTapRow: onTapRow,
          children: row,
        );
      },
    );
  }

  List<Widget> _mapCellsChild(DataRow data) {
    final cells = data.cells.map((e) => _Cell(child: e.child));

    final cellsDivided = cells.fold<List<Widget>>(
      [],
      (previousValue, element) => previousValue
        ..addAll(
          [
            element,
            ShowOnDesktop(
              child: Container(
                height: 30,
                width: 2,
                color: TagColors.colorBaseCloudLightHover,
              ),
            ),
          ],
        ),
    );

    return cellsDivided..removeLast();
  }
}

class _TableHead extends StatelessWidget {
  const _TableHead({
    Key? key,
    required this.columns,
  }) : super(key: key);

  final List<DataColumn> columns;

  @override
  Widget build(BuildContext context) {
    final headers = columns.map((e) => _Header(child: e.label)).toList();
    return Row(
      children: [...headers, SizedBox(width: 50)],
    );
  }
}

class _TableRow extends StatelessWidget {
  const _TableRow({
    Key? key,
    required this.onTapRow,
    required this.children,
    required this.index,
  }) : super(key: key);

  final int index;
  final void Function(int index)? onTapRow;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
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
                    children: children,
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
