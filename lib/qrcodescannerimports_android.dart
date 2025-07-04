import 'package:qrcode_barcode_scanner/qrcode_barcode_scanner.dart' as qrcode_scanner;

/// Callback function type for scan events
typedef ScannedCallback = void Function(String value);

/// QRCodeScanner class provides a wrapper around the qrcode_barcode_scanner package
/// for Android platform.
class QRCodeScanner {
  
  // Properties
  /// Internal instance of the scanner
  static qrcode_scanner.QrcodeBarcodeScanner? _scanner;
  
  // Methods
  /// Initialize the scanner with a callback function
  /// [onScannedCallback] - Function to be called when a barcode is scanned
  static void initialize({required ScannedCallback onScannedCallback}) {
    try {
      _scanner = qrcode_scanner.QrcodeBarcodeScanner(
        onScannedCallback: onScannedCallback,
      );
    } catch (e) {
      throw Exception('Error initializing QR code scanner: $e');
    }
  }
  
  /// Dispose the scanner to free resources
  static void dispose() {
    try {
      // The qrcode_barcode_scanner package doesn't provide a dispose method,
      // but we include this for consistency with other scanner implementations
      _scanner = null;
    } catch (e) {
      throw Exception('Error disposing QR code scanner: $e');
    }
  }
  
  /// Check if the scanner is initialized
  /// Returns true if the scanner has been initialized, false otherwise
  static bool isInitialized() {
    return _scanner != null;
  }
}
