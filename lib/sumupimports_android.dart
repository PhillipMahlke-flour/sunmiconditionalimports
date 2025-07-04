import 'package:sumup/sumup.dart' as sumup_lib;

/// Wrapper class for SumUp payment processing functionality on Android
class Sumup {
  // Helper methods to create responses
  static SumupPluginResponse _createResponse(bool status, [Map? rawMessage]) {
    // Convert Map<dynamic, dynamic>? to Map<String, dynamic>?
    Map<String, dynamic>? message;
    if (rawMessage != null) {
      message = Map<String, dynamic>.from(rawMessage.map(
        (key, value) => MapEntry(key.toString(), value),
      ));
    }
    return _SumupPluginResponse(status: status, message: message);
  }
  
  static SumupPluginCheckoutResponse _createCheckoutResponse(bool status, [Map? rawMessage, String? transactionCode, String? cardType]) {
    // Convert Map<dynamic, dynamic>? to Map<String, dynamic>?
    Map<String, dynamic>? message;
    if (rawMessage != null) {
      message = Map<String, dynamic>.from(rawMessage.map(
        (key, value) => MapEntry(key.toString(), value),
      ));
    }
    return _SumupPluginCheckoutResponse(
      status: status,
      message: message,
      transactionCode: transactionCode,
      cardType: cardType,
    );
  }
  
  static SumupPluginMerchantResponse _createMerchantResponse([String? merchantCode, String? currencyCode]) {
    return _SumupPluginMerchantResponse(merchantCode: merchantCode, currencyCode: currencyCode);
  }
  
  /// Login to SumUp
  static Future<SumupPluginResponse> login() async {
    try {
      final response = await sumup_lib.Sumup.login();
      return _createResponse(response.status, response.message);
    } catch (e) {
      return _createResponse(false, {'error': e.toString()});
    }
  }

  /// Login to SumUp with a token
  static Future<SumupPluginResponse> loginWithToken(String token) async {
    try {
      final response = await sumup_lib.Sumup.loginWithToken(token);
      return _createResponse(response.status, response.message);
    } catch (e) {
      return _createResponse(false, {'error': e.toString()});
    }
  }

  /// Logout from SumUp
  static Future<SumupPluginResponse> logout() async {
    try {
      final response = await sumup_lib.Sumup.logout();
      return _createResponse(response.status, response.message);
    } catch (e) {
      return _createResponse(false, {'error': e.toString()});
    }
  }

  /// Check if user is logged in to SumUp
  static Future<bool?> isLoggedIn() async {
    try {
      return await sumup_lib.Sumup.isLoggedIn;
    } catch (e) {
      return false;
    }
  }

  /// Initialize SumUp with affiliate key
  static Future<SumupPluginResponse> init(String affiliateKey) async {
    try {
      final response = await sumup_lib.Sumup.init(affiliateKey);
      return _createResponse(response.status, response.message);
    } catch (e) {
      return _createResponse(false, {'error': e.toString()});
    }
  }

  /// Get merchant information
  static Future<SumupPluginMerchantResponse> merchant() async {
    try {
      final response = await sumup_lib.Sumup.merchant;
      // According to the SumUp package documentation, the merchant response uses
      // merchantCode and currencyCode properties
      return _createMerchantResponse(response.merchantCode, response.currencyCode);
    } catch (e) {
      return _createMerchantResponse();
    }
  }

  /// Open SumUp settings
  static Future<SumupPluginResponse> openSettings() async {
    try {
      final response = await sumup_lib.Sumup.openSettings();
      return _createResponse(response.status, response.message);
    } catch (e) {
      return _createResponse(false, {'error': e.toString()});
    }
  }

  /// Prepare for checkout
  static Future<SumupPluginResponse> prepareForCheckout() async {
    try {
      final response = await sumup_lib.Sumup.prepareForCheckout();
      return _createResponse(response.status, response.message);
    } catch (e) {
      return _createResponse(false, {'error': e.toString()});
    }
  }

  /// Process a payment checkout
  static Future<SumupPluginCheckoutResponse> checkout(SumupPaymentRequest paymentRequest) async {
    try {
      // Get the native response from SumUp
      final nativeResponse = await sumup_lib.Sumup.checkout(paymentRequest.toSumupPaymentRequest());
      
      // Extract the properties we need in a type-safe way
      // According to the SumUp package documentation, success is a boolean property
      final bool isSuccess = nativeResponse.success ?? false;
      final String? txnCode = nativeResponse.transactionCode;
      final String? card = nativeResponse.cardType;
      
      // Create our response with the available properties
      return _createCheckoutResponse(
        isSuccess,
        {'success': isSuccess}, // Create a simple message map with the success status
        txnCode,
        card
      );
    } catch (e) {
      return _createCheckoutResponse(false, {'error': e.toString()});
    }
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
  
  /// Convert to native SumUp payment object
  sumup_lib.SumupPayment toSumupPayment() {
    return sumup_lib.SumupPayment(
      title: title,
      total: total,
      currency: currency,
      foreignTransactionId: foreignTransactionId,
      saleItemsCount: saleItemsCount,
      skipSuccessScreen: skipSuccessScreen,
      tip: tip ?? 0.0, // Provide default value of 0.0 if tip is null
    );
  }
}

/// Payment request wrapper for SumUp
class SumupPaymentRequest {
  final SumupPayment payment;
  
  /// Constructor for SumupPaymentRequest
  SumupPaymentRequest(this.payment);
  
  /// Convert to native SumUp payment request
  sumup_lib.SumupPaymentRequest toSumupPaymentRequest() {
    return sumup_lib.SumupPaymentRequest(payment.toSumupPayment());
  }
}

/// Interface for SumUp plugin responses
abstract class SumupPluginResponse {
  bool get status;
  Map<String, dynamic>? get message;
}

/// Implementation of SumupPluginResponse for Android
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
  String? get currencyCode;
}

/// Implementation of SumupPluginMerchantResponse for Android
class _SumupPluginMerchantResponse implements SumupPluginMerchantResponse {
  @override
  final String? merchantCode;
  @override
  final String? currencyCode;
  
  _SumupPluginMerchantResponse({this.merchantCode, this.currencyCode});
}

/// Interface for SumUp checkout responses
abstract class SumupPluginCheckoutResponse implements SumupPluginResponse {
  String? get transactionCode;
  String? get cardType;
}

/// Implementation of SumupPluginCheckoutResponse for Android
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
