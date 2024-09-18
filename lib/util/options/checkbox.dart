import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/icons.dart';
import 'package:tproject/util/constants/styles.dart';

class TCheckBoxOptions {
  TCheckBoxOptions._();

  // --------------- OPTIONS --------------- //
  static const double size = 20;
  static const double radius = 3;
  static const double iconSize = 0.5;
  static TextStyle iconStyles = const TextStyle().copyWith(fontWeight: FontWeight.bold, color: Theme.of(Get.context!).primaryColor);
  static EdgeInsets clickPadding = TStyles.pdClick;
  static const double clickRadius = 20;
  static String icon = TIcons.check;
  static BoxDecoration Function(bool) decoration = (bool value) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: value ? Theme.of(Get.context!).primaryColor : Theme.of(Get.context!).primaryColor.withOpacity(0.5), width: 2),
    );
  };
  static const double spaceBetween = 10;
  static const double clickRadiusWithLabel = 8.0;
  static EdgeInsets clickPaddingWithLabel = const EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  static TextStyle? labelStyles;
}
