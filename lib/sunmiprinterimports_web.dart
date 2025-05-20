import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SunmiPrinter {
  static Future<bool?> bindingPrinter() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
    return Future.value(false);
  }

  static startTransactionPrint() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static setAlignment(Object alignment) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static printImage(Uint8List image) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static lineWrap(int count) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static setCustomFontSize(int size) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static printText(String text) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static resetFontSize() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static setFontSize(Object fontSize) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static bold() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static resetBold() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static printRow({List<Object> cols = const []}) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static line({int len = 1}) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static printQRCode(String data) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static cut() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static submitTransactionPrint() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static exitTransactionPrint() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}

class SunmiPrintAlign {
  static center() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static left() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static right() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}

class SunmiFontSize {
  static xs() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static sm() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static md() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static lg() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }

  static xl() {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}

class ColumnMaker {
  static createColumnMaker({String text = '', int width = 0, Object align = const {}}) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}

class Bitmap {
  static fromProvider(NetworkImage image, int width) {
    if(kDebugMode) print("We're in Web, nothing to do here!");
  }
}
