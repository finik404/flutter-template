import 'package:get/get.dart';
import 'package:tproject/util/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';

class TImageOptions {
  TImageOptions._();

  // --------------- OPTIONS --------------- //
  static const BoxFit fit = BoxFit.cover;
  static BorderRadiusGeometry radius = TStyles.br;
  static TextStyle letterStyles =
      const TextStyle().copyWith(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(Get.context!).colorScheme.primary);
  static Color bg = Theme.of(Get.context!).scaffoldBackgroundColor;
  static Color placeholderBg = Theme.of(Get.context!).scaffoldBackgroundColor;
  static String? placeholderIcon = TIcons.camera;
  static const BoxDecoration decoration = BoxDecoration();
}
