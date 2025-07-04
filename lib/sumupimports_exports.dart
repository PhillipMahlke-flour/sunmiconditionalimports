// Export the platform-specific implementation based on the current platform
// On Android devices, this will export the Android implementation
// Otherwise (web or other platforms), this will export the Web implementation
export 'sumupimports_web.dart' // Default fallback for other platforms
    if (dart.library.io) 'sumupimports_android.dart'; // For Android platform
