// This file handles conditional exports based on platform
import 'package:flutter/foundation.dart' show kIsWeb;

// Export the platform-specific implementation based on the current platform
// On Android devices, this will export the Android implementation
// On Web, this will export the Web implementation
export 'sunmiprinterimports_web.dart' if (!kIsWeb) 'sunmiprinterimports_android.dart';