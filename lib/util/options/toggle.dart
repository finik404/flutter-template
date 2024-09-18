import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TToggleOptions {
  TToggleOptions._();

  // --------------- OPTIONS --------------- //
  static Color color = Theme.of(Get.context!).colorScheme.primary.withOpacity(0.4);
  static Color activeColor = Theme.of(Get.context!).primaryColor;
  static const double width = 48;
  static const double height = 24;
  static const double thumbSize = 20;
  static const double thumbSideBetween = 2;
  static Color thumbColor = Theme.of(Get.context!).scaffoldBackgroundColor;
  static Color thumbActiveColor = Theme.of(Get.context!).scaffoldBackgroundColor;
  static const int duration = 200;
  static const BoxDecoration decoration = BoxDecoration();
  static const BoxDecoration thumbDecoration = BoxDecoration();
}
