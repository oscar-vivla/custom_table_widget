<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

## Features
⚠️ Este paquete está diseñado para uso interno. No se garantiza compatibilidad externa.

## Getting started

1. Añade el paquete con el siguiente código en tu pusbpec.yaml

```dart
    custom_table_widget:
    git:
      url: https://github.com/oscar-vivla/custom_table_widget.git
      ref: main
```

O corre este comando:

```shell
  flutter pub add custom_table_widget
```

2. Importa los paquetes donde vayas a utilizarlo

  ```dart
  import 'package:custom_table_widget/custom_table_widget.dart';
  import 'package:custom_table_widget/table_widget_wrapper.dart';
  ```

3. Define las cabeceras que quieras utilizar:
  ```dart
  // ejemplo: 
  List<String> columnNames = [
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
  ```

4. Utiliza el widget

  ```dart
      Widget build(BuildContext context) {
        return CustomDataGrid(
          data: //añade aquí tu fuente de datos

          // constuye por cada propiedad una columna de datos.
          // Pueden ser tanto textos como widgets. ej:
          columnGetters: [
            // (item) => Text(item.id)
            // (item) => Text(item.name)
            (item) => Row(
              children: [ 
                Text(item.name,
                Text(item.lastname), 
              ),
            ],
          ),
        ],
          // utiliza la variable de las cabeceras definida anteriormente
          columnNames: columnNames
          );
      };
  ```


 5. Ejecuta el siguiente comando para actualizar las dependencias

  ```shell
     flutter pub get
  ```

