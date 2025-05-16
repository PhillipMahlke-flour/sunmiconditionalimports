import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:core';

abstract class SunmiPrinterImportsBase {

  startTransactionPrint();

  setAlignment(Object alignment);

  printImage(Uint8List image);

  lineWrap(int count);

  setCustomFontSize(int size);

  printText(String text);

  resetFontSize();

  setFontSize(Object fontSize);

  bold();

  resetBold();

  printRow(List<Object> columns);

  line();

  printQRCode(String data);

  cut();

  submitTransactionPrint();

  exitTransactionPrint();

}

abstract class SunmiPrintAlignImportsBase {
  center();
  left();
  right();
}

abstract class SunmiFontSizeImportsBase {
  xs();
  sm();
  md();
  lg();
  xl();
}

abstract class ColumnMakerImportBase {
  createColumnMaker(String text, int width, Object alignment);
}

abstract class BitmapImportBase {
  fromProvider(NetworkImage image, int width);
}