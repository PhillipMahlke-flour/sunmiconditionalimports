import 'package:flutter/foundation.dart';

abstract class SunmiPrinterImportsBase {

  startTransactionPrint();

  setAlignment(SunmiPrintAlignImportsBase alignment);

  printImage(Uint8List image);

  lineWrap(int count);

  setCustomFontSize(int size);

  printText(String text);

  resetFontSize();

  setFontSize(SunmiFontSizeImportsBase fontSize);

  bold();

  resetBold();

  printRow(List<ColumnMakerImportBase> columns);

  line(int count);

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
  createColumnMaker(String text, int width, SunmiPrintAlignImportsBase alignment);
}

abstract class BitmapImportBase {
  fromProvider(NetworkImage image, int width);
}