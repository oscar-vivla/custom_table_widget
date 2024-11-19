import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<String> columnOrder = [
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

class DynamicDataGrid<T> extends StatelessWidget {
  final List<T> data;
  final List<String> columnNames = columnOrder;
  final List<Widget Function(T)> columnGetters;

  DynamicDataGrid({
    super.key,
    required this.data,
    required this.columnGetters,
  });

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: DynamicDataGridSource<T>(data, columnGetters),
      columns: _getColumns(),
    );
  }

  // Generación de columnas dinámicas según los nombres de columna
  List<GridColumn> _getColumns() {
    return columnNames
        .map((name) => GridColumn(
              columnName: name,
              label: Text(name, style: const TextStyle(color: Colors.grey)),
            ))
        .toList();
  }
}

class DynamicDataGridSource<T> extends DataGridSource {
  final List<T> data;
  final List<Widget Function(T)> columnGetters;

  DynamicDataGridSource(this.data, this.columnGetters);

  @override
  List<DataGridRow> get rows {
    return data.map((item) {
      return DataGridRow(
        cells: columnGetters
            .asMap()
            .map((index, getter) {
              return MapEntry(
                index,
                DataGridCell<Widget>(
                  columnName: columnOrder[index],
                  value: getter(item),
                ),
              );
            })
            .values
            .toList(),
      );
    }).toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: dataGridCell.value,
        );
      }).toList(),
    );
  }
}
