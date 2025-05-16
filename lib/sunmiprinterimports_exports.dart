import 'dart:io' show Platform;

export 'sunmiprinterimports_web.dart'
  if(Platform.isAndroid) 'sunmiprinterimports_android.dart';