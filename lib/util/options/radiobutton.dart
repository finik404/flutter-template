import 'package:tproject/util/constants/colors.dart';
import 'package:flutter/material.dart';

class TRadioButtonOptions {
  TRadioButtonOptions._();

  // --------------- OPTIONS --------------- //
  static const double size = 15;
  static const double thumbSize = 5;
  static const double borderWidth = 1;
  static Color color = TColors.primary.withOpacity(0.3);
  static Color activeColor = TColors.primary;
  static const double spaceBetween = 15;
  static const double clickRadius = 5;
  static EdgeInsets clickPadding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  static const bool isRightRadio = false;
  static const bool isFullWidth = false;
}
