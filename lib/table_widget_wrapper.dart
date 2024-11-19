import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GenericDataGridSource<T> extends DataGridSource {
  final List<T> data;
  final List<String> columnNames;

  GenericDataGridSource({
    required this.data,
    required this.columnNames,
  });

  @override
  List<DataGridRow> get rows => data.map<DataGridRow>((item) {
        return DataGridRow(
          cells: columnNames.map<DataGridCell>((columnName) {
            return DataGridCell(
              columnName: columnName,
              value: _getValue(item, columnName),
            );
          }).toList(),
        );
      }).toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }

  dynamic _getValue(T item, String columnName) {
    try {
      final value = (item as Map)[columnName];
      return value;
    } catch (_) {
      throw Exception(
          "El objeto debe ser un Map o tener un método para obtener el valor de '$columnName'");
    }
  }
}

class CustomGenericDataGrid<T> extends StatelessWidget {
  final List<T> data;
  final List<GridColumn> columns;
  final List<String> columnNames;

  const CustomGenericDataGrid({
    super.key,
    required this.data,
    required this.columns,
    required this.columnNames,
  });

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: GenericDataGridSource<T>(
        data: data,
        columnNames: columnNames,
      ),
      columns: columns,
    );
  }
}
