import 'package:flutter/foundation.dart';
import 'package:sumup/sumup.dart' as sumup_lib;

/// Wrapper class for SumUp payment processing functionality on Android
class Sumup {
  /// Login to SumUp
  static Future<SumupPluginResponse> login() async {
    return await sumup_lib.Sumup.login();
  }

  /// Login to SumUp with a token
  static Future<SumupPluginResponse> loginWithToken(String token) async {
    return await sumup_lib.Sumup.loginWithToken(token);
  }

  /// Logout from SumUp
  static Future<SumupPluginResponse> logout() async {
    return await sumup_lib.Sumup.logout();
  }

  /// Check if user is logged in to SumUp
  static Future<bool?> isLoggedIn() async {
    return await sumup_lib.Sumup.isLoggedIn;
  }

  /// Initialize SumUp with affiliate key
  static Future<SumupPluginResponse> init(String affiliateKey) async {
    return await sumup_lib.Sumup.init(affiliateKey);
  }

  /// Get merchant information
  static Future<SumupPluginMerchantResponse> merchant() async {
    return await sumup_lib.Sumup.merchant;
  }

  /// Open SumUp settings
  static Future<SumupPluginResponse> openSettings() async {
    return await sumup_lib.Sumup.openSettings();
  }

  /// Prepare for checkout
  static Future<SumupPluginResponse> prepareForCheckout() async {
    return await sumup_lib.Sumup.prepareForCheckout();
  }

  /// Process a payment checkout
  static Future<SumupPluginCheckoutResponse> checkout(SumupPaymentRequest paymentRequest) async {
    return await sumup_lib.Sumup.checkout(paymentRequest.toSumupPaymentRequest());
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

/// Response class for SumUp operations
class SumupPluginResponse {
  final bool status;
  final Map<String, dynamic>? message;
  
  /// Constructor for SumupPluginResponse
  SumupPluginResponse({required this.status, this.message});
}

/// Merchant information response from SumUp
class SumupPluginMerchantResponse {
  final String? merchantCode;
  final String? merchantCurrency;
  
  /// Constructor for SumupPluginMerchantResponse
  SumupPluginMerchantResponse({this.merchantCode, this.merchantCurrency});
}

/// Checkout response from SumUp
class SumupPluginCheckoutResponse implements SumupPluginResponse {
  final bool status;
  final Map<String, dynamic>? message;
  final String? transactionCode;
  final String? cardType;
  
  /// Constructor for SumupPluginCheckoutResponse
  SumupPluginCheckoutResponse({
    required this.status,
    this.message,
    this.transactionCode,
    this.cardType,
  });
}
