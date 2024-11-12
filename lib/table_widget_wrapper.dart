import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:intl/intl.dart';

class CustomTableWidget extends StatefulWidget {
  const CustomTableWidget({
    super.key,
    this.width,
    this.height,
    this.bookingData,
    this.userData,
    this.homeData,
    this.navigationToUserDetails,
  });

  final double? width;
  final double? height;
  // final List<BooksRecord>? bookingData;
  // final List<UsersRecord>? userData;
  // final List<HomesRecord>? homeData;
  final List<Map<String, dynamic>>? bookingData;
  final List<Map<String, dynamic>>? userData;
  final List<Map<String, dynamic>>? homeData;
  final Future Function()? navigationToUserDetails;

  @override
  State<CustomTableWidget> createState() => _CustomTableWidgetState();
}

class _CustomTableWidgetState extends State<CustomTableWidget> {
  LinkedScrollControllerGroup controllerGroup = LinkedScrollControllerGroup();

  ScrollController? headerScrollController;
  ScrollController? contentScrollControler;

  @override
  void initState() {
    super.initState();
    headerScrollController = controllerGroup.addAndGet();
    contentScrollControler = controllerGroup.addAndGet();
  }

  @override
  void dispose() {
    headerScrollController?.dispose();
    contentScrollControler?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Cabeceras de las columnas
    final List<String> headers = [
      'Id reserva',
      'Casa',
      'Propietarios',
      'Fecha de reserva',
      'Tipo de reserva',
      'Estado de la estancia',
      'Notas huespedes',
      'Huesped principal',
      'Fecha de entrada',
      'Nº de personas',
      'Hora de llegada',
      'Hora de salida',
      'Nº de estancias',
      'CX',
      'Planificación',
      'Nº de locker',
      'Check in',
      'Pre-estancia',
      'Control de llegada',
      'NPS',
      'Disfrutada',
      'Notas',
      'Plan de viaje',
    ];

    final bookings = widget.bookingData ?? [];
    final users = widget.userData ?? [];
    final homes = widget.homeData ?? [];

    return SizedBox(
      child: Stack(
        children: [
          tableContent(headers, bookings, users, homes),
          tableHeader(headers),
        ],
      ),
    );
  }

  Widget tableHeader(List<String> headers) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          // CABECERA FIJA
          DataTable(
            columns: const [
              DataColumn(label: Text('Id reserva')),
              DataColumn(label: Text('Casa')),
              DataColumn(label: Text('Propietario')),
              DataColumn(label: Text('Fecha de la reserva')),
            ],
            rows: const [],
          ),

          // CABECERA CON SCROLL
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: contentScrollControler,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Tipo de reserva')),
                  DataColumn(label: Text('Estado de la estancia')),
                  DataColumn(label: Text('Notas huéspedes')),
                  DataColumn(label: Text('Huesped principal')),
                  DataColumn(label: Text('Fecha de entrada')),
                  DataColumn(label: Text('Nº de personas')),
                  DataColumn(label: Text('Hora de llegada')),
                  DataColumn(label: Text('Hora de salida')),
                  DataColumn(label: Text('Nº de estancias')),
                  DataColumn(label: Text('CX')),
                  DataColumn(label: Text('Planificación')),
                  DataColumn(label: Text('Nº de locker')),
                  DataColumn(label: Text('Check in')),
                  DataColumn(label: Text('Pre-estancia')),
                  DataColumn(label: Text('Control de llegada')),
                  DataColumn(label: Text('NPS')),
                  DataColumn(label: Text('Disfrutada')),
                  DataColumn(label: Text('Notas')),
                  DataColumn(label: Text('Plan de viaje')),
                ],
                rows: const [],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tableContent(List<String> headers, bookingData, userData, homeData) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            // CABECERA FIJA REPETIDA
            DataTable(
              dataRowMinHeight: 80,
              dataRowMaxHeight: 80,

              // columnas repetidas para el scroll vertical
              columns: const [
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: List.generate(bookingData.length, (index) {
                final books = bookingData[index];
                final user = userData.firstWhere((u) => u.uid == books.uid);
                final home = homeData.firstWhere((h) => h.hid == books.hid);

                return DataRow(cells: [
                  DataCell(Text(books.bid)),
                  homeNameCell(home),
                  userCell(user),
                  dateCell(books)
                ]);
              }),
            ),
            tableDivider(),

//FINAL CABECERA FIJA REPETIDA

            // CABECERA CON SCROLL REPETIDA
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: headerScrollController,
                child: DataTable(
                  dataRowMinHeight: 80,
                  dataRowMaxHeight: 80,

                  // columnas repetidas para el scroll vertical
                  columns: headers.sublist(4).map((header) {
                    return DataColumn(
                      label: SizedBox(
                        child: Text(header, textAlign: TextAlign.center),
                      ),
                    );
                  }).toList(),

                  rows: List.generate(bookingData.length, (index) {
                    final book = bookingData[index];

                    return DataRow(cells: [
                      bookTypeCell(book),
                      const DataCell(Text('Claudia')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                    ]);
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  DataCell userCell(userData) {
    return DataCell(
      GestureDetector(
        onTap: () async {
          if (widget.navigationToUserDetails != null) {
            await widget.navigationToUserDetails?.call();
          }
        },
        child: Flexible(
          child: SizedBox(
            width: 150,
            child: Row(
              children: [Text(userData.displayName)],
            ),
          ),
        ),
      ),
    );
  }
}

DataCell homeNameCell(home) {
  return DataCell(
    SizedBox(width: 100, child: Text(home.name)),
  );
}

DataCell dateCell(books) {
  final DateFormat formatter = DateFormat('dMMM', 'es');
  final DateFormat inputFormat = DateFormat('d/M/yyyy');

  // convertir a datetime
  DateTime startDate = inputFormat.parse(books.startDate);
  DateTime endDate = inputFormat.parse(books.endDate);

  // formateo fechas
  String startFormatted = formatter.format(startDate).toLowerCase();
  String endFormatted = formatter.format(endDate).toLowerCase();

  return DataCell(Row(
    children: [
      Text('$startFormatted - $endFormatted'),
      tableDivider(),
    ],
  ));
}

DataCell bookTypeCell(book) {
  const bookStatus = {
    'open': '🛎️ Abierta',
    'exchange': '🔄 Intercambio',
    'book': '🏝 Disfrute',
    'rent': '🛋 Alquiler'
  };

  return DataCell(
    Text(bookStatus[book.type] ?? book.type),
  );
}

Widget tableDivider() {
  return Container(
    alignment: Alignment.centerRight,
    width: 1,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3), // Color de la línea
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 2, // Difuminado
          offset: const Offset(1, 0), // Desplazamiento para la sombra
        ),
      ],
    ),
  );
}
