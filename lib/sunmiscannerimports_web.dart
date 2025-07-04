import 'package:flutter/foundation.dart';
import 'dart:async';

/// KeyAction enum for web implementation
/// Mirrors the enum from sunmi_scanner package
enum KeyAction {
  /// Simulates button down on keyboard
  DOWN,
  
  /// Simulates button up on keyboard
  UP,
}

/// SunmiScanner class provides a stub implementation for web platform
/// since the sunmi_scanner package only works on Android.
class SunmiScanner {
  /// Listen to barcode scan events
  /// Returns an empty Stream since this functionality is not available on web
  static Stream<String> onBarcodeScanned() {
    print("We're in Web, nothing to do here!");
    // Return an empty stream that never emits any values
    return Stream<String>.empty();
  }
  
  /// Get the scanner model
  /// Returns a Future<int> with value null since this functionality is not available on web
  static Future<int?> getScannerModel() {
    print("We're in Web, nothing to do here!");
    return Future.value(null);
  }
  
  /// Check if scanner is available
  /// Returns a Future<bool> with value false since scanner is not available on web
  static Future<bool?> isScannerAvailable() {
    print("We're in Web, nothing to do here!");
    return Future.value(false);
  }
  
  /// Start scanning - stub implementation for web
  static Future<void> scan() async {
    print("We're in Web, nothing to do here!");
  }
  
  /// Stop scanning - stub implementation for web
  static Future<void> stop() async {
    print("We're in Web, nothing to do here!");
  }
  
  /// Send key event to scanner - stub implementation for web
  /// [action] - KeyAction enum (UP or DOWN)
  /// [keyCode] - Key code to send
  static Future<void> sendKeyEvent(Object action, int keyCode) async {
    print("We're in Web, nothing to do here!");
  }
}
