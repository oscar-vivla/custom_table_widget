import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BookDataSource extends DataGridSource {
  BookDataSource(List<BooksRecord> bookingData) {
    rows = bookingData
        .map<DataGridRow>((data) => DataGridRow(cells: [
              DataGridCell(columnName: 'Id de reserva', value: data.bid),
              DataGridCell(columnName: 'Casa', value: data.status),
              DataGridCell(columnName: 'Propietario', value: data.bookBy),
              DataGridCell(
                  columnName: 'Fecha de la reserva', value: data.season),
              DataGridCell(columnName: 'Tipo de reserva', value: data.bid),
              DataGridCell(
                  columnName: 'Estado de la estancia', value: data.status),
              DataGridCell(columnName: 'Huésped principal', value: data.bookBy),
              const DataGridCell(
                  columnName: 'Notas huéspedes',
                  value: 'Texto super largo para comprobar como se ve...'),
              DataGridCell(
                  columnName: 'Fecha de entrada', value: data.bookRound),
              DataGridCell(
                  columnName: 'Fecha de salida', value: data.bookRound),
              DataGridCell(columnName: 'Nº de personas', value: data.bookRound),
              DataGridCell(
                  columnName: 'Nº de estancias', value: data.bookRound),
              DataGridCell(columnName: 'Nº de locker', value: data.bookRound),
              const DataGridCell(columnName: 'CX', value: 'Claudia'),
              DataGridCell(columnName: 'Planificación', value: data.bookRound),
              DataGridCell(columnName: 'Check in', value: data.bookRound),
              DataGridCell(columnName: 'Pre-estancia', value: data.bookRound),
              DataGridCell(
                  columnName: 'Control de llegada', value: data.bookRound),
              DataGridCell(columnName: 'NPS', value: data.bookRound),
              DataGridCell(columnName: 'Disfrutada', value: data.bookRound),
              DataGridCell(columnName: 'Notas', value: data.bookRound),
              DataGridCell(columnName: 'Plan de viaje', value: data.bookRound),
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

class CustomTableDavi extends StatefulWidget {
  final List<BooksRecord>? bookData;

  const CustomTableDavi({
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
  State<CustomTableDavi> createState() => _CustomTableDaviState();
}

class BooksRecord {
  final String bid;
  final String status;
  final String bookBy;
  final String bookRound;
  final String season;

  BooksRecord(
      {required this.bid,
      required this.status,
      required this.bookBy,
      required this.bookRound,
      required this.season});
}

class _CustomTableDaviState extends State<CustomTableDavi> {
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
