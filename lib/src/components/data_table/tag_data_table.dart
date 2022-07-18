import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagDataTable extends StatelessWidget {
  const TagDataTable({
    Key? key,
    required this.columns,
    required this.source,
    this.onTapRow,
    this.bodyHeight,
  }) : super(key: key);

  final List<DataColumn> columns;
  final DataTableSource source;
  final void Function(int rowIndex)? onTapRow;
  final double? bodyHeight;

  @override
  Widget build(BuildContext context) {
    return _TagTable(
      onTapRow: onTapRow,
      columns: columns,
      source: source,
      bodyHeight: bodyHeight,
    );
  }
}

class _TagTable extends StatelessWidget {
  const _TagTable({
    Key? key,
    required this.columns,
    required this.source,
    this.onTapRow,
    this.bodyHeight,
  }) : super(key: key);

  final List<DataColumn> columns;
  final DataTableSource source;
  final void Function(int rowIndex)? onTapRow;
  final double? bodyHeight;

  @override
  Widget build(BuildContext context) {
    final defaultBodyHeight = (MediaQuery.of(context).size.height / 4) * 3;

    return LimitedBox(
      maxHeight: bodyHeight ?? defaultBodyHeight,
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _SliverheaderDelegate(columns),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: ShowOnDesktop(
              child: Divider(
                height: 1,
                color: TagColors.colorBaseInkLight,
              ),
            ),
          ),
          _TableBody(source: source, onTapRow: onTapRow),
        ],
      ),
    );
  }
}

class _SliverheaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverheaderDelegate(this.columns);

  final List<DataColumn> columns;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ShowOnDesktop(
      child: SizedBox(
        height: 30,
        child: _TableHead(
          columns: columns,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 30;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _TableBody extends StatelessWidget {
  const _TableBody({
    Key? key,
    required this.source,
    required this.onTapRow,
  }) : super(key: key);

  final DataTableSource source;
  final void Function(int rowIndex)? onTapRow;

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 100,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final dataRow = source.getRow(index);
          if (dataRow == null) return Container();
          final row = _mapCellsChild(dataRow);

          return ToggleMobileDesktop(
            mobile: _TableRow(
              index: index,
              onTapRow: onTapRow,
              children: row,
            ),
            desktop: LimitedBox(
              maxHeight: 50,
              child: _TableRow(
                index: index,
                onTapRow: onTapRow,
                children: row,
              ),
            ),
          );
        },
        childCount: source.rowCount,
      ),
    );
  }

  List<Widget> _mapCellsChild(DataRow data) {
    final cells = data.cells.map((e) => _Cell(child: e.child));
    return cells.toList();
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
      padding: const EdgeInsets.all(14.0),
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
                  width: 32,
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
        padding: EdgeInsets.all(0),
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
