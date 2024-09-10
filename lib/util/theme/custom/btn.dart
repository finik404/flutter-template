import 'package:flutter/material.dart';
import 'package:tproject/common/styles/styles.dart';
import 'package:tproject/util/constants/colors.dart';

class ThemeButton {
  ThemeButton._();

  // Btn primary light theme
  static ElevatedButtonThemeData btnPrimaryLightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.all(15),
      backgroundColor: AppColors.btn,
      shape: RoundedRectangleBorder(borderRadius: Styles.br),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.btnText),
    ),
  );

  // Btn secondary
  static ElevatedButtonThemeData btnSecondary = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.all(11),
      backgroundColor: AppColors.btnSecondary,
      shape: RoundedRectangleBorder(borderRadius: Styles.br),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.btnSecondaryText),
    ),
  );
}
