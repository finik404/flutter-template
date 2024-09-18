import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/styles.dart';

class TIconOptions {
  TIconOptions._();

  // --------------- OPTIONS --------------- //
  static TextStyle styles = iconMdTheme;

  // IconButton
  static const double clickRadius = 50;
  static EdgeInsets clickPadding = TStyles.pdClick;

  // --------------- THEMES --------------- //
  static TextStyle iconSmTheme = TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary);
  static TextStyle iconMdTheme = TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary);
  static TextStyle iconLgTheme = TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary);
  static TextStyle iconXlTheme = TextStyle(fontSize: 30, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary);
}
