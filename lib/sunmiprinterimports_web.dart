import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sunmiconditionalimports/sunmiprinterimports_base.dart';

class SunmiPrinterImports extends SunmiPrinterImportsBase {
  @override
  startTransactionPrint() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  setAlignment(Object alignment) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  printImage(Uint8List image) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  lineWrap(int count) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  setCustomFontSize(int size) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  printText(String text) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  resetFontSize() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  setFontSize(Object fontSize) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  bold() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  resetBold() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  printRow({List<Object> cols = const []}) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  line() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  printQRCode(String data) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  cut() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  submitTransactionPrint() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  exitTransactionPrint() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}

class SunmiPrintAlignImports extends SunmiPrintAlignImportsBase {
  @override
  center() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  left() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  right() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}

class SunmiFontSizeImports extends SunmiFontSizeImportsBase {
  @override
  xs() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  sm() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  md() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  lg() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  @override
  xl() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}

class ColumnMakerImports extends ColumnMakerImportBase {
  @override
  createColumnMaker({String text = '', int width = 0, Object alignment = const {}}) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}

class BitmapImports extends BitmapImportBase {
  @override
  fromProvider(NetworkImage image, int width) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}
