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
 --

## Getting started

1. Añade el paquete con el siguiente código en tu pusbpec.yaml

```dart
    custom_table_widget:
    git:
      url: https://github.com/oscar-vivla/custom_table_widget.git
      ref: main
```

2. Importa los paquetes donde vayas a utilizarlo

    ```dart
    import 'package:custom_table_widget/custom_table_widget.dart';
    import 'package:custom_table_widget/table_widget_wrapper.dart';
    ```

3. Utiliza el widget

    ```dart
      Widget build(BuildContext context) {
        return CustomTableWidget(
          bookingData: widget.books,
          userData: widget.users,
          homeData: widget.homes);
      }
      ```
 4. Ejecuta el siguiente comando para actualizar las dependencias

    ```shell
     flutter pub get
    ```

