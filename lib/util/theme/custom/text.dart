import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';

class ThemeText {
  ThemeText._();

  // Base styles
  static TextStyle baseTextStyles(double size, {FontWeight? weight}) {
    return const TextStyle().copyWith(fontSize: size, fontWeight: weight ?? FontWeight.normal, color: TColors.text);
  }

  // Text theme
  static TextTheme textTheme = TextTheme(
    // Text
    bodySmall: baseTextStyles(14),
    bodyMedium: baseTextStyles(16),
    bodyLarge: baseTextStyles(18),

    // Text
    titleSmall: baseTextStyles(18, weight: FontWeight.bold),
    titleMedium: baseTextStyles(24),

    // Label
    labelMedium: baseTextStyles(12),
  );
}
