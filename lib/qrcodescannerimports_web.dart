/// Callback function type for scan events
typedef ScannedCallback = void Function(String value);

/// QRCodeScanner class provides a stub implementation for web platform
/// since the qrcode_barcode_scanner package only supports Android.
class QRCodeScanner {
  
  // Methods
  /// Initialize the scanner with a callback function - stub implementation for web
  /// [onScannedCallback] - Function to be called when a barcode is scanned
  static void initialize({required ScannedCallback onScannedCallback}) {
    print("QR code scanner is not supported on web platform");
  }
  
  /// Dispose the scanner to free resources - stub implementation for web
  static void dispose() {
    print("QR code scanner is not supported on web platform");
  }
  
  /// Check if the scanner is initialized - stub implementation for web
  /// Returns false since scanner is not supported on web
  static bool isInitialized() {
    print("QR code scanner is not supported on web platform");
    return false;
  }
}
