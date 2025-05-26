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

// Type definitions for Sumup classes to match Android implementation
abstract class SumupPluginResponse {
  bool get status;
  Map<String, dynamic>? get message;
}

class _SumupPluginResponse implements SumupPluginResponse {
  @override
  final bool status;
  @override
  final Map<String, dynamic>? message;
  
  _SumupPluginResponse({required this.status, this.message});
}

abstract class SumupPluginMerchantResponse {
  String? get merchantCode;
  String? get merchantCurrency;
}

class _SumupPluginMerchantResponse implements SumupPluginMerchantResponse {
  @override
  final String? merchantCode = null;
  @override
  final String? merchantCurrency = null;
}

abstract class SumupPluginCheckoutResponse implements SumupPluginResponse {
  String? get transactionCode;
  String? get cardType;
}

class _SumupPluginCheckoutResponse implements SumupPluginCheckoutResponse {
  @override
  final bool status;
  @override
  final Map<String, dynamic>? message;
  @override
  final String? transactionCode;
  @override
  final String? cardType;
  
  _SumupPluginCheckoutResponse({
    required this.status,
    this.message,
    this.transactionCode,
    this.cardType,
  });
}

class Sumup {
  // Helper methods to create responses
  static SumupPluginResponse _createResponse(bool status, [Map<String, dynamic>? message]) {
    return _SumupPluginResponse(status: status, message: message);
  }
  
  static SumupPluginCheckoutResponse _createCheckoutResponse(bool status, [Map<String, dynamic>? message]) {
    return _SumupPluginCheckoutResponse(
      status: status,
      message: message,
      transactionCode: null,
      cardType: null,
    );
  }
  
  static SumupPluginMerchantResponse _createMerchantResponse() {
    return _SumupPluginMerchantResponse();
  }
  
  static Future<SumupPluginResponse> login() async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  static Future<SumupPluginResponse> logout() async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  static Future<bool?> isLoggedIn() async {
    print("We're in Web, nothing to do here!");
    return false;
  }

  static Future<SumupPluginResponse> init(String affiliateKey) async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  static Future<SumupPluginMerchantResponse> merchant() async {
    print("We're in Web, nothing to do here!");
    return _createMerchantResponse();
  }

  static Future<SumupPluginResponse> openSettings() async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  static Future<SumupPluginResponse> prepareForCheckout() async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  static Future<SumupPluginCheckoutResponse> checkout(SumupPayment payment) async {
    print("We're in Web, nothing to do here!");
    return _createCheckoutResponse(false, {'error': 'Not supported on web'});
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
}

class SumupPaymentRequest {
  final SumupPayment payment;
  
  SumupPaymentRequest(this.payment);
}