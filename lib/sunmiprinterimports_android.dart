
import 'package:sunmiconditionalimports/sunmiprinterimports_base.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:bitmap/bitmap.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SunmiPrinterImports extends SunmiPrinterImportsBase {
  @override
  startTransactionPrint() {
    SunmiPrinter.startTransactionPrint(true);
  }

  @override
  setAlignment(Object alignment) {
    SunmiPrinter.setAlignment(alignment as SunmiPrintAlign);
  }

  @override
  printImage(Uint8List image) {
    SunmiPrinter.printImage(image);
  }

  @override
  lineWrap(int count) {
    SunmiPrinter.lineWrap(count);
  }

  @override
  setCustomFontSize(int size) {
    SunmiPrinter.setCustomFontSize(size);
  }

  @override
  printText(String text) {
    SunmiPrinter.printText(text);
  }

  @override
  resetFontSize() {
    SunmiPrinter.resetFontSize();
  }

  @override
  setFontSize(Object fontSize) {
    SunmiPrinter.setFontSize(fontSize as SunmiFontSize);
  }

  @override
  bold() {
    SunmiPrinter.bold();
  }

  @override
  resetBold() {
    SunmiPrinter.resetBold();
  }

  @override
  printRow({List<Object> cols}) {
    SunmiPrinter.printRow(cols: cols as List<ColumnMaker>);
  }

  @override
  line() {
    SunmiPrinter.line();
  }

  @override
  printQRCode(String data) {
    SunmiPrinter.printQRCode(data);
  }

  @override
  cut() {
    SunmiPrinter.cut();
  }

  @override
  submitTransactionPrint() {
    SunmiPrinter.submitTransactionPrint();
  }

  @override
  exitTransactionPrint() {
    SunmiPrinter.exitTransactionPrint(true);
  }
}

class SunmiPrintAlignImports extends SunmiPrintAlignImportsBase {
  @override
  center() {
    return SunmiPrintAlign.CENTER;
  }

  @override
  left() {
    return SunmiPrintAlign.LEFT;
  }

  @override
  right() {
    return SunmiPrintAlign.RIGHT;
  }
}

class SunmiFontSizeImports extends SunmiFontSizeImportsBase {
  @override
  xs() {
    return SunmiFontSize.XS;
  }

  @override
  sm() {
    return SunmiFontSize.SM;
  }

  @override
  md() {
    return SunmiFontSize.MD;
  }

  @override
  lg() {
    return SunmiFontSize.LG;
  }

  @override
  xl() {
    return SunmiFontSize.XL;
  }
}

class ColumnMakerImports extends ColumnMakerImportBase {
  @override
  createColumnMaker({String text, int width, Object alignment}) {
    return ColumnMaker(text: text, width: width, align: alignment as SunmiPrintAlign);
  }
}

class BitmapImports extends BitmapImportBase {
  @override
  fromProvider(NetworkImage image, int width) async {
    Bitmap bitmap = await Bitmap.fromProvider(image);
    int logoWidth = (384 / 100 * width).toInt();
    Bitmap resizedBitmap = bitmap.apply(BitmapResize.to(width: logoWidth));
    Uint8List headedBitmap = resizedBitmap.buildHeaded();
    return headedBitmap;
  }
}