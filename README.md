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

This package is a wrapper for the sunmi_printer_plus package aswell as the bitmap package. It provides a way to import the sunmi_printer_plus package and the bitmap package conditionally based on the platform. This is useful for when you want to use the sunmi_printer_plus package and bitmap package on Android, while also deploying the same code to the web. Specifically made for usage with FlutterFlow, since FlutterFlow does not support conditional imports.

## Features

This package provides a way to import the sunmi_printer_plus package and the bitmap package conditionally based on the platform.

## Getting started

Add the following to your `pubspec.yaml` file:

```yaml
dev_dependencies:
  sunmiconditionalimports: ^0.0.1
```

## Usage

```dart
import 'package:sunmiconditionalimports/sunmiconditionalimports_exports.dart';
```

DO NOT import the other files directly, as they are not intended to be used directly.
