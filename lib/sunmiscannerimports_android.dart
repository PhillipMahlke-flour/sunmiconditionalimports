import 'package:flutter/foundation.dart';
import 'package:sunmi_scanner/sunmi_scanner.dart' as sunmi_scanner;
import 'dart:async';

/// SunmiScanner class provides a wrapper around the sunmi_scanner package
/// for Android platform.
class SunmiScanner {
  /// Listen to barcode scan events
  /// Returns a Stream of String that emits whenever a barcode is scanned
  static Stream<String> onBarcodeScanned() {
    try {
      return sunmi_scanner.SunmiScanner.onBarcodeScanned();
    } catch (e) {
      throw Exception('Error listening to barcode scanner: $e');
    }
  }
  
  /// Get the scanner model
  /// Returns a Future<int> with the scanner model code
  static Future<int?> getScannerModel() {
    try {
      return sunmi_scanner.SunmiScanner.getScannerModel();
    } catch (e) {
      throw Exception('Error getting scanner model: $e');
    }
  }
  
  /// Check if scanner is available
  /// Returns a Future<bool> indicating if scanner is available
  static Future<bool?> isScannerAvailable() {
    try {
      return sunmi_scanner.SunmiScanner.isScannerAvailable();
    } catch (e) {
      throw Exception('Error checking scanner availability: $e');
    }
  }
  
  /// Start scanning
  static Future<void> scan() async {
    try {
      await sunmi_scanner.SunmiScanner.scan();
    } catch (e) {
      throw Exception('Error starting scanner: $e');
    }
  }
  
  /// Stop scanning
  static Future<void> stop() async {
    try {
      await sunmi_scanner.SunmiScanner.stop();
    } catch (e) {
      throw Exception('Error stopping scanner: $e');
    }
  }
  
  /// Send key event to scanner
  /// [action] - KeyAction enum (UP or DOWN)
  /// [keyCode] - Key code to send
  static Future<void> sendKeyEvent(Object action, int keyCode) async {
    try {
      await sunmi_scanner.SunmiScanner.sendKeyEvent(
        action as sunmi_scanner.KeyAction,
        keyCode
      );
    } catch (e) {
      throw Exception('Error sending key event: $e');
    }
  }
}
