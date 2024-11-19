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
        if (cell.value is Widget) {
          return cell.value as Widget;
        } else if (cell.value is num) {
          return Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(cell.value.toString()),
          );
        } else if (cell.value is String) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(cell.value),
          );
        } else if (cell.value is bool) {
          return Checkbox(
            value: cell.value as bool,
            onChanged: null,
          );
        } else {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(cell.value.toString()),
          );
        }
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

class CustomDataGrid<T> extends StatelessWidget {
  final List<T> data;
  final List<GridColumn> columns;

  const CustomDataGrid({
    super.key,
    required this.data,
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> columnNames = [
      'Id reserva',
      'Casa',
      'Propietario',
      'Fecha de reserva',
      'Tipo de reserva',
      'Estado de la estancia',
      'Huésped principal',
      'Notas huéspedes',
      'Fecha de entrada',
      'Fecha de salida',
      'Nº de personas',
      'Nº de estancias',
      'Nº de locker',
      'CX',
      'Planificación',
      'Check in',
      'Pre-estancia',
      'Control de llegada',
      'NPS',
      'Disfrutada',
      'Notas',
      'Plan de viaje',
    ];
    return SfDataGrid(
      source: GenericDataGridSource<T>(
        data: data,
        columnNames: columnNames,
      ),
      columns: columns,
      frozenColumnsCount: 4,
      columnWidthMode: ColumnWidthMode.auto,
      allowColumnsDragging: true,
      showCheckboxColumn: true,
    );
  }
}
