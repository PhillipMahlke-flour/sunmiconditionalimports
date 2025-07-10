import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bitmap/bitmap.dart' as bitmap_lib;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';

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
      
      // Create a blank white bitmap as the background with correct dimensions
      bitmap_lib.Bitmap whiteBitmap = bitmap_lib.Bitmap.blank(width, scaledHeight);
      
      // Fill it with white color (RGBA: 255, 255, 255, 255)
      for (int i = 0; i < whiteBitmap.content.length; i += 4) {
        whiteBitmap.content[i] = 255;     // R
        whiteBitmap.content[i + 1] = 255; // G
        whiteBitmap.content[i + 2] = 255; // B
        whiteBitmap.content[i + 3] = 255; // A (fully opaque)
      }
      
      // Get the original image
      bitmap_lib.Bitmap originalBitmap = await bitmap_lib.Bitmap.fromProvider(image);
      
      // Resize the original image maintaining aspect ratio
      bitmap_lib.Bitmap resizedBitmap = originalBitmap.apply(
        bitmap_lib.BitmapResize.to(width: width, height: scaledHeight)
      );
      
      // Create a new bitmap to combine the white background with the original image
      int pixelCount = resizedBitmap.content.length ~/ 4;
      
      // For each pixel, blend the original image with the white background based on alpha
      for (int i = 0; i < pixelCount; i++) {
        int baseIndex = i * 4;
        int r = resizedBitmap.content[baseIndex];
        int g = resizedBitmap.content[baseIndex + 1];
        int b = resizedBitmap.content[baseIndex + 2];
        int a = resizedBitmap.content[baseIndex + 3];
        
        // If pixel has transparency, blend with white background
        if (a < 255) {
          double alpha = a / 255.0;
          // Alpha blending formula: result = foreground * alpha + background * (1 - alpha)
          whiteBitmap.content[baseIndex] = (r * alpha + 255 * (1 - alpha)).round();
          whiteBitmap.content[baseIndex + 1] = (g * alpha + 255 * (1 - alpha)).round();
          whiteBitmap.content[baseIndex + 2] = (b * alpha + 255 * (1 - alpha)).round();
          whiteBitmap.content[baseIndex + 3] = 255; // Make fully opaque
        } else {
          // If pixel is fully opaque, just copy it
          whiteBitmap.content[baseIndex] = r;
          whiteBitmap.content[baseIndex + 1] = g;
          whiteBitmap.content[baseIndex + 2] = b;
          whiteBitmap.content[baseIndex + 3] = 255; // Make fully opaque
        }
      }
      
      // Build the final bitmap with header
      Uint8List headedBitmap = whiteBitmap.buildHeaded();
      return headedBitmap;
    } catch (e) {
      throw Exception('Error processing bitmap image: $e');
    }
  }
}
