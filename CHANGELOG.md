# CHANGELOG

## 0.2.5

* downgraded image package to 4.2.0 for better compatibility with existing projects

## 0.2.4

* fixed implementation of bitmap replacement using http package instead of NetworkAssetBundle
* ensured consistent return types between Android and web implementations
* improved error handling for network image loading
* downgraded image package to 4.2.0 for better compatibility with existing projects

## 0.2.3

* replaced bitmap package with image package to support minSDK version 21
* maintained same API interface for bitmap functions

## 0.2.2

* removed export of bitmap functions as the package is outdated. replacement WIP

## 0.2.1

* removed export of bitmap functions as the package is outdated. replacement WIP

## 0.2.0

* added QR code barcode scanner support with conditional imports

## 0.1.7

* fixed an error in the params for sumup checkout in web

## 0.1.6

* added SunmiScanner implementation with platform-specific support
* implemented onBarcodeScanned, getScannerModel, isScannerAvailable, scan, stop, and sendKeyEvent methods
* extracted Bitmap implementation into separate files following the same pattern
* extracted SumUp payment processing into separate files following the same pattern
* added web compatibility through conditional imports
* updated package description to include sunmi_scanner
* improved code organization with separate files for each component
* fixed type compatibility issues in SumUp implementation
* improved error handling in SumUp implementation with proper try/catch blocks
* aligned Android and web implementations with consistent interfaces
* added helper methods to reduce code duplication
* updated package description to include sumup package

## 0.1.5

* added loginWithToken function

## 0.1.4

* replaced parameter of checkout. SumupPayment -> SumupPaymentRequest

## 0.1.3

* fixed an issue with SumupPaymentRequest constructor

## 0.1.2

* updated SumupPaymentRequest constructor to match respective sumup library constructor

## 0.1.1

* added SumupPluginResponse and SumupPluginMerchantResponse classes
* added SumupPluginCheckoutResponse class

## 0.1.0

* added SumupPaymentRequest class for payment processing

## 0.0.17

* added SumUp payment integration support
* added SumupPayment class for payment processing
* improved cross-platform compatibility for payment functionality

## 0.0.16

* improved image scaling to maintain aspect ratio when printing images
* added method to retrieve image dimensions

## 0.0.15

* fixed transparent png files being printed as black

## 0.0.14

* fixed a scaling issue with bitmaps

## 0.0.13

* updated platform check

## 0.0.12

* updated platform check

## 0.0.11

* updated platform check

## 0.0.10

* updated web functionality. removed kDebugMode check

## 0.0.9

* updated ColumnMaker to function the same as in sunmi_printer_plus package
* added basic error handling

## 0.0.8

* added missing bindingPrinter function
* refactored Code to use static methods

## 0.0.7

* added a missing named parameter
* updated readme with usage instructions

## 0.0.6

* fixed an error with named parameters

## 0.0.5

* added named parameters to match behaviour of sunmi_printer_plus

## 0.0.4

* Updated dart sdk version

## 0.0.3

* Updated flutter version

## 0.0.2

* Updated README.md to update usage instruction.

## 0.0.1

* Initial release.