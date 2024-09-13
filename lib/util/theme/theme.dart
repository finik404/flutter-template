import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';

class AppTheme {
  AppTheme._();

  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Circe',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    colorScheme: const ColorScheme.light(primary: TColors.black),
    primaryColorLight: TColors.black,
    scaffoldBackgroundColor: TColors.bg,
  );
}
