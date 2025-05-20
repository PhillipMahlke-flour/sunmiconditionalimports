import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart' as sunmi;
import 'package:sunmi_printer_plus/enums.dart' as sunmi_enums;
import 'package:sunmi_printer_plus/column_maker.dart' as sunmi_column;
import 'package:bitmap/bitmap.dart' as bitmap_lib;
import 'dart:typed_data';

class SunmiPrinter {
  // Static methods that implement the platform-specific functionality
  static Future<bool?> bindingPrinter() {
    var result = sunmi.SunmiPrinter.bindingPrinter();
    return result;
  }
  
  static startTransactionPrint() {
    sunmi.SunmiPrinter.startTransactionPrint();
  }

  static setAlignment(Object alignment) {
    sunmi.SunmiPrinter.setAlignment(alignment as sunmi_enums.SunmiPrintAlign);
  }

  static printImage(Uint8List image) {
    sunmi.SunmiPrinter.printImage(image);
  }

  static lineWrap(int count) {
    sunmi.SunmiPrinter.lineWrap(count);
  }

  static setCustomFontSize(int size) {
    sunmi.SunmiPrinter.setCustomFontSize(size);
  }

  static printText(String text) {
    sunmi.SunmiPrinter.printText(text);
  }

  static resetFontSize() {
    sunmi.SunmiPrinter.resetFontSize();
  }

  static setFontSize(Object fontSize) {
    sunmi.SunmiPrinter.setFontSize(fontSize as sunmi_enums.SunmiFontSize);
  }

  static bold() {
    sunmi.SunmiPrinter.bold();
  }

  static resetBold() {
    sunmi.SunmiPrinter.resetBold();
  }

  static printRow({List<Object> cols = const []}) {
    sunmi.SunmiPrinter.printRow(cols: cols as List<sunmi_column.ColumnMaker>);
  }

  static line({int len = 1}) {
    sunmi.SunmiPrinter.line(len: len);
  }

  static printQRCode(String data) {
    sunmi.SunmiPrinter.printQRCode(data);
  }

  static cut() {
    sunmi.SunmiPrinter.cut();
  }

  static submitTransactionPrint() {
    sunmi.SunmiPrinter.submitTransactionPrint();
  }

  static exitTransactionPrint() {
    sunmi.SunmiPrinter.exitTransactionPrint();
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
  static createColumnMaker({String text = '', int width = 0, Object align = sunmi_enums.SunmiPrintAlign.LEFT}) {
    return sunmi_column.ColumnMaker(text: text, width: width, align: align as sunmi_enums.SunmiPrintAlign);
  }
}

class Bitmap {
  static fromProvider(NetworkImage image, int width) async {
    bitmap_lib.Bitmap bitmap = await bitmap_lib.Bitmap.fromProvider(image);
    int logoWidth = (384 / 100 * width).toInt();
    bitmap_lib.Bitmap resizedBitmap = bitmap.apply(bitmap_lib.BitmapResize.to(width: logoWidth));
    Uint8List headedBitmap = resizedBitmap.buildHeaded();
    return headedBitmap;
  }
}