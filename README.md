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

This package is a wrapper for the sunmi_printer_plus, sunmi_scanner, bitmap, and sumup packages. It provides a way to import these packages conditionally based on the platform. This is useful for when you want to use these packages on Android, while also deploying the same code to the web. Specifically made for usage with FlutterFlow, since FlutterFlow does not support conditional imports.

## Features

This package provides:

* Conditional imports for the sunmi_printer_plus package for receipt printing
* Conditional imports for the sunmi_scanner package for barcode scanning
* Bitmap image processing with transparency support and aspect ratio preservation
* SumUp payment integration for processing card payments
* Cross-platform compatibility for web and Android

## Getting started

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  sunmiconditionalimports: ^0.1.6
```

## Usage

```dart
import 'package:sunmiconditionalimports/sunmiconditionalimports.dart';
```

# DO NOT import the other files directly, as they are not intended to be used directly.


Use the following classes from this package:

### Printing

- `SunmiPrinter` - example: `SunmiPrinter.printText('Hello World')`
- `SunmiPrintAlign` - example: `SunmiPrintAlign.center()`
- `SunmiFontSize` - example: `SunmiFontSize.md()`
- `ColumnMaker` - example: `ColumnMaker(text: 'Hello World', width: 10, align: SunmiPrintAlign.center())`
- `Bitmap` - example: `Bitmap.fromProvider(NetworkImage('https://example.com/image.png'), 100)`

### Barcode Scanning

- `SunmiScanner` - For barcode scanning functionality

### Payment Processing

- `Sumup` - For SumUp payment processing
- `SumupPayment` - For creating payment requests

#### SumUp Payment Example

```dart
// Initialize SumUp with your affiliate key
final initResult = await Sumup.init('YOUR_AFFILIATE_KEY');

// Login to SumUp
final loginResult = await Sumup.login();
if (!loginResult.status) {
  print('Login failed: ${loginResult.message}');
  return;
}

// Create a payment
final payment = SumupPayment(
  title: 'Purchase',
  total: 19.99,
  currency: 'EUR',
  saleItemsCount: 1,
  skipSuccessScreen: false,
);

// Create a payment request
final paymentRequest = SumupPaymentRequest(payment);

// Process the payment
final result = await Sumup.checkout(paymentRequest);

// Check the result
if (result.status) {
  print('Payment successful!');
  print('Transaction code: ${result.transactionCode}');
  print('Card type: ${result.cardType}');
} else {
  print('Payment failed: ${result.message}');
}
```

#### SunmiScanner Example

```dart
// Check if scanner is available
final isAvailable = await SunmiScanner.isScannerAvailable();

// Get scanner model
final scannerModel = await SunmiScanner.getScannerModel();

// Start scanning
await SunmiScanner.scan();

// Listen for scanned barcodes
SunmiScanner.onBarcodeScanned().listen((barcode) {
  print('Scanned barcode: $barcode');
});

// Stop scanning when done
await SunmiScanner.stop();
```
