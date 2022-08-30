import 'package:flutter/material.dart';

class DataSource extends DataTableSource {
  final List<String> data;
  final bool nullrow;
  DataSource(this.data, {this.nullrow = false});

  @override
  DataRow? getRow(int index) {
    if (nullrow) return null;
    return DataRow(cells: [
      DataCell(
        Text(index.toString()),
      ),
      DataCell(
        Text(data[index]),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
