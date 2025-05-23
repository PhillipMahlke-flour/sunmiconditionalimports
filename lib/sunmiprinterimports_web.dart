import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

class SunmiPrinter {
  static Future<bool?> bindingPrinter() {
    print("We're in Web, nothing to do here!");
    return Future.value(false);
  }

  static startTransactionPrint() {
    print("We're in Web, nothing to do here!");
  }

  static setAlignment(Object alignment) {
    print("We're in Web, nothing to do here!");
  }

  static printImage(Uint8List image) {
    print("We're in Web, nothing to do here!");
  }

  static lineWrap(int count) {
    print("We're in Web, nothing to do here!");
  }

  static setCustomFontSize(int size) {
    print("We're in Web, nothing to do here!");
  }

  static printText(String text) {
    print("We're in Web, nothing to do here!");
  }

  static resetFontSize() {
    print("We're in Web, nothing to do here!");
  }

  static setFontSize(Object fontSize) {
    print("We're in Web, nothing to do here!");
  }

  static bold() {
    print("We're in Web, nothing to do here!");
  }

  static resetBold() {
    print("We're in Web, nothing to do here!");
  }

  static printRow({List<Object> cols = const []}) {
    print("We're in Web, nothing to do here!");
    // No need to convert columns in web implementation
  }

  static line({int len = 1}) {
    print("We're in Web, nothing to do here!");
  }

  static printQRCode(String data) {
    print("We're in Web, nothing to do here!");
  }

  static cut() {
    print("We're in Web, nothing to do here!");
  }

  static submitTransactionPrint() {
    print("We're in Web, nothing to do here!");
  }

  static exitTransactionPrint() {
    print("We're in Web, nothing to do here!");
  }
}

class SunmiPrintAlign {
  static center() {
    print("We're in Web, nothing to do here!");
  }

  static left() {
    print("We're in Web, nothing to do here!");
  }

  static right() {
    print("We're in Web, nothing to do here!");
  }
}

class SunmiFontSize {
  static xs() {
    print("We're in Web, nothing to do here!");
  }

  static sm() {
    print("We're in Web, nothing to do here!");
  }

  static md() {
    print("We're in Web, nothing to do here!");
  }

  static lg() {
    print("We're in Web, nothing to do here!");
  }

  static xl() {
    print("We're in Web, nothing to do here!");
  }
}

class ColumnMaker {
  final String text;
  final int width;
  final Object align;

  ColumnMaker({this.text = '', this.width = 0, this.align = const {}}) {
    print("We're in Web, nothing to do here!");
  }
  
  // For backward compatibility
  static createColumnMaker({String text = '', int width = 0, Object align = const {}}) {
    print("We're in Web, nothing to do here!");
    return null;
  }
  
  // Convert this wrapper to the format expected by printRow
  toSunmiColumnMaker() {
    print("We're in Web, nothing to do here!");
    return null;
  }
}

class Bitmap {
  static Future<ui.Image?> getImageDimensions(String url) async {
    print("We're in Web, nothing to do here!");
    return null;
  }

  static Future<Uint8List?> fromProvider(NetworkImage image, int width) async {
    print("We're in Web, nothing to do here!");
    return null;
  }

}
