import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart' as sunmi;
import 'package:sunmi_printer_plus/enums.dart' as sunmi_enums;
import 'package:sunmi_printer_plus/column_maker.dart' as sunmi_column;
import 'package:bitmap/bitmap.dart' as bitmap_lib;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:sumup/sumup.dart' as sumup_lib;

class SunmiPrinter {
  // Static methods that implement the platform-specific functionality
  static Future<bool?> bindingPrinter() {
    try {
      var result = sunmi.SunmiPrinter.bindingPrinter();
      return result;
    } catch (e) {
      throw Exception('Error binding printer: $e');
    }
  }
  
  static startTransactionPrint() {
    try {
      sunmi.SunmiPrinter.startTransactionPrint();
    } catch (e) {
      throw Exception('Error starting transaction print: $e');
    }
  }

  static setAlignment(Object alignment) {
    try {
      sunmi.SunmiPrinter.setAlignment(alignment as sunmi_enums.SunmiPrintAlign);
    } catch (e) {
      throw Exception('Error setting alignment: $e');
    }
  }

  static printImage(Uint8List image) {
    try {
      sunmi.SunmiPrinter.printImage(image);
    } catch (e) {
      throw Exception('Error printing image: $e');
    }
  }

  static lineWrap(int count) {
    try {
      sunmi.SunmiPrinter.lineWrap(count);
    } catch (e) {
      throw Exception('Error performing line wrap: $e');
    }
  }

  static setCustomFontSize(int size) {
    try {
      sunmi.SunmiPrinter.setCustomFontSize(size);
    } catch (e) {
      throw Exception('Error setting custom font size: $e');
    }
  }

  static printText(String text) {
    try {
      sunmi.SunmiPrinter.printText(text);
    } catch (e) {
      throw Exception('Error printing text: $e');
    }
  }

  static resetFontSize() {
    try {
      sunmi.SunmiPrinter.resetFontSize();
    } catch (e) {
      throw Exception('Error resetting font size: $e');
    }
  }

  static setFontSize(Object fontSize) {
    try {
      sunmi.SunmiPrinter.setFontSize(fontSize as sunmi_enums.SunmiFontSize);
    } catch (e) {
      throw Exception('Error setting font size: $e');
    }
  }

  static bold() {
    try {
      sunmi.SunmiPrinter.bold();
    } catch (e) {
      throw Exception('Error setting bold text: $e');
    }
  }

  static resetBold() {
    try {
      sunmi.SunmiPrinter.resetBold();
    } catch (e) {
      throw Exception('Error resetting bold text: $e');
    }
  }

  static printRow({List<Object> cols = const []}) {
    try {
      // Convert any ColumnMaker instances to sunmi_column.ColumnMaker
      List<sunmi_column.ColumnMaker> sunmiCols = cols.map((col) {
        if (col is ColumnMaker) {
          return col.toSunmiColumnMaker();
        } else if (col is sunmi_column.ColumnMaker) {
          return col;
        } else {
          throw Exception('Invalid column type: ${col.runtimeType}');
        }
      }).toList();
      
      sunmi.SunmiPrinter.printRow(cols: sunmiCols);
    } catch (e) {
      throw Exception('Error printing row: $e');
    }
  }

  static line({int len = 1}) {
    try {
      sunmi.SunmiPrinter.line(len: len);
    } catch (e) {
      throw Exception('Error printing line: $e');
    }
  }

  static printQRCode(String data) {
    try {
      sunmi.SunmiPrinter.printQRCode(data);
    } catch (e) {
      throw Exception('Error printing QR code: $e');
    }
  }

  static cut() {
    try {
      sunmi.SunmiPrinter.cut();
    } catch (e) {
      throw Exception('Error cutting paper: $e');
    }
  }

  static submitTransactionPrint() {
    try {
      sunmi.SunmiPrinter.submitTransactionPrint();
    } catch (e) {
      throw Exception('Error submitting transaction print: $e');
    }
  }

  static exitTransactionPrint() {
    try {
      sunmi.SunmiPrinter.exitTransactionPrint();
    } catch (e) {
      throw Exception('Error exiting transaction print: $e');
    }
  }
}

class SunmiPrintAlign {
  static center() {
    return sunmi_enums.SunmiPrintAlign.CENTER;
  }

  static left() {
    return sunmi_enums.SunmiPrintAlign.LEFT;
  }

  static right() {
    return sunmi_enums.SunmiPrintAlign.RIGHT;
  }
}

class SunmiFontSize {
  static xs() {
    return sunmi_enums.SunmiFontSize.XS;
  }

  static sm() {
    return sunmi_enums.SunmiFontSize.SM;
  }

  static md() {
    return sunmi_enums.SunmiFontSize.MD;
  }

  static lg() {
    return sunmi_enums.SunmiFontSize.LG;
  }

  static xl() {
    return sunmi_enums.SunmiFontSize.XL;
  }
}

class ColumnMaker {
  final String text;
  final int width;
  final Object align;

  ColumnMaker({this.text = '', this.width = 0, this.align = sunmi_enums.SunmiPrintAlign.LEFT}) {
    try {
      // This constructor creates a ColumnMaker that wraps the sunmi_column.ColumnMaker
      // The actual ColumnMaker is created when this is used in printRow
    } catch (e) {
      throw Exception('Error creating column maker: $e');
    }
  }
  
  // For backward compatibility
  static sunmi_column.ColumnMaker createColumnMaker({String text = '', int width = 0, Object align = sunmi_enums.SunmiPrintAlign.LEFT}) {
    try {
      return sunmi_column.ColumnMaker(text: text, width: width, align: align as sunmi_enums.SunmiPrintAlign);
    } catch (e) {
      throw Exception('Error creating column maker: $e');
    }
  }
  
  // Convert this wrapper to the actual sunmi ColumnMaker
  sunmi_column.ColumnMaker toSunmiColumnMaker() {
    try {
      return sunmi_column.ColumnMaker(text: text, width: width, align: align as sunmi_enums.SunmiPrintAlign);
    } catch (e) {
      throw Exception('Error creating column maker: $e');
    }
  }
}

class Bitmap {
  /// Get the dimensions of an image from a URL
  static Future<ui.Image?> getImageDimensions(String url) async {
    try {
      final NetworkImage provider = NetworkImage(url);
      final ImageStream stream = provider.resolve(ImageConfiguration.empty);
      final Completer<ui.Image> completer = Completer<ui.Image>();
      late ImageStreamListener listener;
      
      listener = ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);
        stream.removeListener(listener);
      }, onError: (dynamic exception, StackTrace? stackTrace) {
        completer.completeError(exception, stackTrace);
        stream.removeListener(listener);
      });
      
      stream.addListener(listener);
      return await completer.future;
    } catch (e) {
      throw Exception('Error getting image dimensions: $e');
    }
  }
  
  static Future<Uint8List> fromProvider(NetworkImage image, int width) async {
    try {
      // Get the original image dimensions to maintain aspect ratio
      final ui.Image? imageInfo = await getImageDimensions(image.url);
      final int originalWidth = imageInfo?.width ?? width;
      final int originalHeight = imageInfo?.height ?? width;
      
      // Calculate height based on aspect ratio
      final double aspectRatio = originalWidth / originalHeight;
      final int scaledHeight = (width / aspectRatio).round();
      
      // Create a blank white bitmap as the background with correct dimensions
      bitmap_lib.Bitmap whiteBitmap = bitmap_lib.Bitmap.blank(width, scaledHeight);
      
      // Fill it with white color (RGBA: 255, 255, 255, 255)
      for (int i = 0; i < whiteBitmap.content.length; i += 4) {
        whiteBitmap.content[i] = 255;     // R
        whiteBitmap.content[i + 1] = 255; // G
        whiteBitmap.content[i + 2] = 255; // B
        whiteBitmap.content[i + 3] = 255; // A (fully opaque)
      }
      
      // Get the original image
      bitmap_lib.Bitmap originalBitmap = await bitmap_lib.Bitmap.fromProvider(image);
      
      // Resize the original image maintaining aspect ratio
      bitmap_lib.Bitmap resizedBitmap = originalBitmap.apply(
        bitmap_lib.BitmapResize.to(width: width, height: scaledHeight)
      );
      
      // Create a new bitmap to combine the white background with the original image
      int pixelCount = resizedBitmap.content.length ~/ 4;
      
      // For each pixel, blend the original image with the white background based on alpha
      for (int i = 0; i < pixelCount; i++) {
        int baseIndex = i * 4;
        int r = resizedBitmap.content[baseIndex];
        int g = resizedBitmap.content[baseIndex + 1];
        int b = resizedBitmap.content[baseIndex + 2];
        int a = resizedBitmap.content[baseIndex + 3];
        
        // If pixel has transparency, blend with white background
        if (a < 255) {
          double alpha = a / 255.0;
          // Alpha blending formula: result = foreground * alpha + background * (1 - alpha)
          whiteBitmap.content[baseIndex] = (r * alpha + 255 * (1 - alpha)).round();
          whiteBitmap.content[baseIndex + 1] = (g * alpha + 255 * (1 - alpha)).round();
          whiteBitmap.content[baseIndex + 2] = (b * alpha + 255 * (1 - alpha)).round();
          whiteBitmap.content[baseIndex + 3] = 255; // Make fully opaque
        } else {
          // If pixel is fully opaque, just copy it
          whiteBitmap.content[baseIndex] = r;
          whiteBitmap.content[baseIndex + 1] = g;
          whiteBitmap.content[baseIndex + 2] = b;
          whiteBitmap.content[baseIndex + 3] = 255; // Make fully opaque
        }
      }
      
      // Build the final bitmap with header
      Uint8List headedBitmap = whiteBitmap.buildHeaded();
      return headedBitmap;
    } catch (e) {
      throw Exception('Error processing bitmap image: $e');
    }
  }
}

class Sumup {
  static Future<sumup_lib.SumupPluginResponse> login() async {
    return await sumup_lib.Sumup.login();
  }

  static Future<sumup_lib.SumupPluginResponse> logout() async {
    return await sumup_lib.Sumup.logout();
  }

  static Future<bool?> isLoggedIn() async {
    return await sumup_lib.Sumup.isLoggedIn;
  }

  static Future<sumup_lib.SumupPluginResponse> init(String affiliateKey) async {
    return await sumup_lib.Sumup.init(affiliateKey);
  }

  static Future<sumup_lib.SumupPluginMerchantResponse> merchant() async {
    return await sumup_lib.Sumup.merchant;
  }

  static Future<sumup_lib.SumupPluginResponse> openSettings() async {
    return await sumup_lib.Sumup.openSettings();
  }

  static Future<sumup_lib.SumupPluginResponse> prepareForCheckout() async {
    return await sumup_lib.Sumup.prepareForCheckout();
  }

  static Future<sumup_lib.SumupPluginCheckoutResponse> checkout(SumupPayment payment) async {
    final sumupPayment = payment.toSumupPayment();
    final paymentRequest = sumup_lib.SumupPaymentRequest(sumupPayment);
    return await sumup_lib.Sumup.checkout(paymentRequest);
  }
}

class SumupPayment {
  final String title;
  final double total;
  final String currency;
  final String foreignTransactionId;
  final int saleItemsCount;
  final bool skipSuccessScreen;
  final double? tip;
  
  SumupPayment({
    required this.title,
    required this.total,
    required this.currency,
    this.foreignTransactionId = '',
    required this.saleItemsCount,
    required this.skipSuccessScreen,
    this.tip,
  });
  
  sumup_lib.SumupPayment toSumupPayment() {
    return sumup_lib.SumupPayment(
      title: title,
      total: total,
      currency: currency,
      foreignTransactionId: foreignTransactionId,
      saleItemsCount: saleItemsCount,
      skipSuccessScreen: skipSuccessScreen,
      tip: tip ?? 0.0, // Provide default value of 0.0 if tip is null
    );
  }
}
