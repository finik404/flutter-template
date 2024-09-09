import 'package:flutter/material.dart';

/*
  Colors ----------------
 */
class TColors {
  TColors._();

  // Basic
  static const Color primary = Color(0xFF343434);
  static const Color secondary = Color(0xFF343434);
  static const Color accent = Color(0xFF343434);

  // Text
  static const Color textPrimary = Color(0xFF343434);
  static const Color textSecondary = Color(0xFF343434);
  static const Color textWhite = Color(0xFF343434);

  // Background
  static const Color light = Color(0xFF5468FE);
  static const Color dark = Color(0xFF5468FE);
  static const Color primaryBackground = Color(0xFF5468FE);

  // Button
  static const Color buttonPrimary = Color(0xFF5468FE);
  static const Color buttonSecondary = Color(0xFF5468FE);
  static const Color buttonDisabled = Color(0xFF5468FE);

  // Border
  static const Color borderPrimary = Color(0xFF5468FE);
  static const Color borderSecondary = Color(0xFF5468FE);

  // Validation
  static const Color error = Color(0xFF5468FE);
  static const Color success = Color(0xFF5468FE);
  static const Color warning = Color(0xFF5468FE);
  static const Color info = Color(0xFF5468FE);

  // Other
  static const Color black = Color(0xFF5468FE);
  static const Color grey = Color(0xFF5468FE);
  static const Color darkerGrey = Color(0xFF5468FE);
  static const Color darkGrey = Color(0xFF5468FE);
  static const Color white = Color(0xFF5468FE);

  // Gradient
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFF5468FE),
      Color(0xFF5468FE),
    ],
  );
}