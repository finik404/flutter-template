import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/styles.dart';

class TIconOptions {
  TIconOptions._();

  // --------------- OPTIONS --------------- //
  static TextStyle styles = iconTheme;

  // IconButton
  static const double clickRadius = 50;
  static EdgeInsets clickPadding = TStyles.pdClick;

  // --------------- THEMES --------------- //
  static TextStyle iconTheme = TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary);
}
