import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart' as sunmi;
import 'package:sunmi_printer_plus/enums.dart' as sunmi_enums;
import 'package:sunmi_printer_plus/column_maker.dart' as sunmi_column;
import 'dart:typed_data';

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
