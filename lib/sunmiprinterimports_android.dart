
import 'package:sunmiprinterimports/sunmiprinterimports_base.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:bitmap/bitmap.dart';

class SunmiPrinterImports extends SunmiPrinterImportsBase {
  @override
  startTransactionPrint() {
    SunmiPrinter.startTransactionPrint(true);
  }

  @override
  setAlignment(SunmiPrintAlignImportsBase alignment) {
    SunmiPrinter.setAlignment(alignment);
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
  setFontSize(SunmiFontSizeImportsBase fontSize) {
    SunmiPrinter.setFontSize(fontSize);
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
  printRow(List<ColumnMakerImportBase> columns) {
    SunmiPrinter.printRow(cols: columns);
  }

  @override
  line(int count) {
    SunmiPrinter.line(count);
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
  createColumnMaker(String text, int width, SunmiPrintAlignImportsBase alignment) {
    return ColumnMaker(text, width, alignment);
  }
}

class BitmapImports extends BitmapImportBase {
  @override
  fromProvider(NetworkImage image, int width) {
    Bitmap bitmap = await Bitmap.fromProvider(ni);
    int logoWidth = (384 / 100 * prnt.logoSize).toInt();
    Bitmap resizedBitmap = bitmap.apply(BitmapResize.to(width: logoWidth));
    Uint8List headedBitmap = resizedBitmap.buildHeaded();
    return headedBitmap;
  }
}