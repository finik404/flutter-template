import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Basic
  static const Color primary = Color(0xFF005CCC);
  static const Color darkenPrimary = Color(0xFF00479C);
  static const Color secondary = Color(0xFFFFD740);

  // Text
  static const Color text = black;

  // Background
  static const Color bg = white;

  // Container
  static Color container = const Color(0xFF0E6CDD).withOpacity(0.1);
  static Color containerBorder = divider;
  static const Color containerShadow = Color(0xFFF1F6FD);

  // Btn
  static const Color btn = secondary;
  static const Color btnText = black;
  static Color btnSecondary = const Color(0xFF005CCC).withOpacity(0.08);
  static const Color btnSecondaryText = primary;

  // Input
  static const Color input = secondary;
  static const Color inputText = black;
  static Color inputBorder = const Color(0xFF0E6CDD).withOpacity(0.2);
  static Color inputBorderActive = primary.withOpacity(0.5);
  static Color inputBorderError = error.withOpacity(0.5);
  static Color inputLabel = const Color(0xFF005CCC).withOpacity(0.5);
  static Color inputLabelActive = primary;
  static Color inputLabelError = error.withOpacity(0.5);

  // Divider
  static Color divider = const Color(0xFF0E6CDD).withOpacity(0.1);

  // AppBar
  static const Color appBar = Color(0xFFF7F7F7);

  // BottomSheet
  static const Color bottomSheet = Color(0xFFF8FBFE);
  static const Color bottomSheetBorder = Color.fromRGBO(14, 108, 221, 0.10);
  static const Color bottomSheetShadow = Color.fromRGBO(0, 71, 156, 0.08);

  // Validation
  static const Color error = Color(0xFFBD081C);
  static Color lightenError = const Color(0xFFFB6340).withOpacity(0.1);
  static const Color success = Color(0xFF34A853);
  static const Color warning = Color(0xFFFFCA00);
  static Color lightenWarning = warning.withOpacity(0.1);

  // Other
  static const Color black = Color(0xFF5468FE);
  static Color grey = black.withOpacity(0.5);
  static Color darkenGrey = black.withOpacity(0.7);
  static const Color white = Color(0xFFFFFFFF);
}
