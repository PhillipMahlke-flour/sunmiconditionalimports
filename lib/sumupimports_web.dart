import 'package:flutter/foundation.dart';

/// Interface for SumUp plugin responses
abstract class SumupPluginResponse {
  bool get status;
  Map<String, dynamic>? get message;
}

/// Implementation of SumupPluginResponse for web
class _SumupPluginResponse implements SumupPluginResponse {
  @override
  final bool status;
  @override
  final Map<String, dynamic>? message;
  
  _SumupPluginResponse({required this.status, this.message});
}

/// Interface for SumUp merchant responses
abstract class SumupPluginMerchantResponse {
  String? get merchantCode;
  String? get merchantCurrency;
}

/// Implementation of SumupPluginMerchantResponse for web
class _SumupPluginMerchantResponse implements SumupPluginMerchantResponse {
  @override
  final String? merchantCode = null;
  @override
  final String? merchantCurrency = null;
}

/// Interface for SumUp checkout responses
abstract class SumupPluginCheckoutResponse implements SumupPluginResponse {
  String? get transactionCode;
  String? get cardType;
}

/// Implementation of SumupPluginCheckoutResponse for web
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

/// Wrapper class for SumUp payment processing functionality on web
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
  
  /// Login to SumUp (stub implementation for web)
  static Future<SumupPluginResponse> login() async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  /// Login to SumUp with a token (stub implementation for web)
  static Future<SumupPluginResponse> loginWithToken(String token) async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  /// Logout from SumUp (stub implementation for web)
  static Future<SumupPluginResponse> logout() async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  /// Check if user is logged in to SumUp (stub implementation for web)
  static Future<bool?> isLoggedIn() async {
    print("We're in Web, nothing to do here!");
    return false;
  }

  /// Initialize SumUp with affiliate key (stub implementation for web)
  static Future<SumupPluginResponse> init(String affiliateKey) async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  /// Get merchant information (stub implementation for web)
  static Future<SumupPluginMerchantResponse> merchant() async {
    print("We're in Web, nothing to do here!");
    return _createMerchantResponse();
  }

  /// Open SumUp settings (stub implementation for web)
  static Future<SumupPluginResponse> openSettings() async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  /// Prepare for checkout (stub implementation for web)
  static Future<SumupPluginResponse> prepareForCheckout() async {
    print("We're in Web, nothing to do here!");
    return _createResponse(false, {'error': 'Not supported on web'});
  }

  /// Process a payment checkout (stub implementation for web)
  static Future<SumupPluginCheckoutResponse> checkout(SumupPayment payment) async {
    print("We're in Web, nothing to do here!");
    return _createCheckoutResponse(false, {'error': 'Not supported on web'});
  }
}

/// Payment data class for SumUp payments
class SumupPayment {
  final String title;
  final double total;
  final String currency;
  final String foreignTransactionId;
  final int saleItemsCount;
  final bool skipSuccessScreen;
  final double? tip;
  
  /// Constructor for SumupPayment
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

/// Payment request wrapper for SumUp
class SumupPaymentRequest {
  final SumupPayment payment;
  
  /// Constructor for SumupPaymentRequest
  SumupPaymentRequest(this.payment);
}
