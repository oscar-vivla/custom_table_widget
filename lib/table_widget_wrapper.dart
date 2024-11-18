import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BookDataSource extends DataGridSource {
  BookDataSource(List<Map<String, dynamic>> bookData) {
    rows = bookData
        .map<DataGridRow>((data) => DataGridRow(cells: [
              DataGridCell(columnName: 'Id de reserva', value: data),
              DataGridCell(columnName: 'Casa', value: data),
              DataGridCell(columnName: 'Propietario', value: data),
              DataGridCell(columnName: 'Fecha de la reserva', value: data),
              DataGridCell(columnName: 'Tipo de reserva', value: data),
              DataGridCell(columnName: 'Estado de la estancia', value: data),
              DataGridCell(columnName: 'Huésped principal', value: data),
              DataGridCell(columnName: 'Notas huéspedes', value: data),
              DataGridCell(columnName: 'Fecha de entrada', value: data),
              DataGridCell(columnName: 'Fecha de salida', value: data),
              DataGridCell(columnName: 'Nº de personas', value: data),
              DataGridCell(columnName: 'Nº de estancias', value: data),
              DataGridCell(columnName: 'Nº de locker', value: data),
              DataGridCell(columnName: 'CX', value: data),
              DataGridCell(columnName: 'Planificación', value: data),
              DataGridCell(columnName: 'Check in', value: data),
              DataGridCell(columnName: 'Pre-estancia', value: data),
              DataGridCell(columnName: 'Control de llegada', value: data),
              DataGridCell(columnName: 'NPS', value: data),
              DataGridCell(columnName: 'Disfrutada', value: data),
              DataGridCell(columnName: 'Notas', value: data),
              DataGridCell(columnName: 'Plan de viaje', value: data),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> rows = [];

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataCell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(dataCell.value?.toString() ?? 'Sin datos'),
        );
      }).toList(),
    );
  }
}

class CustomTableWidget extends StatefulWidget {
  final List<Map<String, dynamic>>? bookData;

  const CustomTableWidget({
    super.key,
    this.width,
    this.height,
    this.bookData,
    // this.userData,
    // this.homeData,
  });

  final double? width;
  final double? height;
  // final dynamic userData;
  // final dynamic homeData;

  @override
  State<CustomTableWidget> createState() => _CustomTableWidgetState();
}

class _CustomTableWidgetState extends State<CustomTableWidget> {
  late BookDataSource _dataSource;
  final DataGridController _dataGridController = DataGridController();

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

  @override
  void initState() {
    super.initState();
    _dataSource = BookDataSource(widget.bookData ?? []);
  }

  @override
  Widget build(BuildContext context) {
    const Color headerStyle = Colors.grey;
    return SfDataGrid(
      source: _dataSource,
      frozenColumnsCount: 4,
      columnWidthMode: ColumnWidthMode.auto,
      controller: _dataGridController,
      selectionMode: SelectionMode.multiple,
      showCheckboxColumn: true,
      allowColumnsDragging: true,
      columns: columnOrder.map((columnName) {
        return GridColumn(
          columnName: columnName,
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Text(columnName, style: const TextStyle(color: headerStyle)),
          ),
        );
      }).toList(),
    );
  }

  // void _getSelectedRows() {
  //   List<DataGridRow> selectedRows = _dataGridController.selectedRows;
  //   print('Filas seleccionadas: $selectedRows');
  // }
}
