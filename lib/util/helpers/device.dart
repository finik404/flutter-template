import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class TDevice {
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double statusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double bottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static Future<String> androidVersion() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    return androidInfo.version.release;
  }

  static Future<String> iOSVersion() async {
    final deviceInfo = DeviceInfoPlugin();
    final iosInfo = await deviceInfo.iosInfo;
    return iosInfo.systemVersion;
  }

  static Future<String> versionApp() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool isDartMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Future<void> setStatusBarBrightness(Brightness value) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: value));
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color));
  }

  static Future<void> setBottomNavigationColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: color));
  }

  static double keyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
