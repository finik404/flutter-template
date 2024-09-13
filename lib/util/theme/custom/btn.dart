import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/constants/colors.dart';

class ThemeButton {
  ThemeButton._();

  // Btn primary theme
  static ElevatedButtonThemeData btnPrimaryTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.all(15),
      backgroundColor: TColors.btn,
      shape: RoundedRectangleBorder(borderRadius: TStyles.br),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: TColors.btnText),
    ),
  );

  // Btn secondary
  static ElevatedButtonThemeData btnSecondaryTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.all(11),
      backgroundColor: TColors.btnSecondary,
      shape: RoundedRectangleBorder(borderRadius: TStyles.br),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: TColors.btnSecondaryText),
    ),
  );
}
