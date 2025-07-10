import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:http/http.dart' as http;

/// Bitmap class provides a wrapper around the bitmap package
/// for Android platform.
class Bitmap {
  /// Get the dimensions of an image from a URL
  static Future<ui.Image?> getImageDimensions(String url) async {
    try {
      final NetworkImage provider = NetworkImage(url);
      final ImageStream stream = provider.resolve(ImageConfiguration.empty);
      final Completer<ui.Image> completer = Completer<ui.Image>();
      late ImageStreamListener listener;
      
      listener = ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);
        stream.removeListener(listener);
      }, onError: (dynamic exception, StackTrace? stackTrace) {
        completer.completeError(exception, stackTrace);
        stream.removeListener(listener);
      });
      
      stream.addListener(listener);
      return await completer.future;
    } catch (e) {
      throw Exception('Error getting image dimensions: $e');
    }
  }
  
  /// Process and convert a NetworkImage to a Uint8List suitable for printing
  /// Maintains aspect ratio and handles transparency
  static Future<Uint8List> fromProvider(NetworkImage image, int width) async {
    try {
      // Get the original image dimensions to maintain aspect ratio
      final ui.Image? imageInfo = await getImageDimensions(image.url);
      final int originalWidth = imageInfo?.width ?? width;
      final int originalHeight = imageInfo?.height ?? width;
      
      // Calculate height based on aspect ratio
      final double aspectRatio = originalWidth / originalHeight;
      final int scaledHeight = (width / aspectRatio).round();
      
      // Download the image using http package
      final http.Response response = await http.get(Uri.parse(image.url));
      if (response.statusCode != 200) {
        throw Exception('Failed to load image data: ${response.statusCode}');
      }
      
      // Decode the image
      final img.Image? originalImage = img.decodeImage(response.bodyBytes);
      if (originalImage == null) {
        throw Exception('Failed to decode image');
      }
      
      // Resize the image maintaining aspect ratio
      final img.Image resizedImage = img.copyResize(
        originalImage,
        width: width,
        height: scaledHeight,
        interpolation: img.Interpolation.linear
      );
      
      // Create a white background image
      final img.Image whiteBackground = img.Image(
        width: width,
        height: scaledHeight,
      );
      
      // Fill with white color
      img.fill(whiteBackground, color: img.ColorRgba8(255, 255, 255, 255));
      
      // Composite the resized image over the white background
      img.compositeImage(whiteBackground, resizedImage);
      
      // Convert to Uint8List with BMP format
      final Uint8List bmpData = img.encodeBmp(whiteBackground);
      
      return bmpData;
    } catch (e) {
      throw Exception('Error processing bitmap image: $e');
    }
  }
}
