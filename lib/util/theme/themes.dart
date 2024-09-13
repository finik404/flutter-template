import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/constants/colors.dart';

class Themes {
  Themes._();

  // --------------- TEXT --------------- //
  static TextTheme textTheme = TextTheme(
    bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: TColors.text),
    bodyMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: TColors.text),
    bodyLarge: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.normal, color: TColors.text),
    titleSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: TColors.text),
    titleMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.normal, color: TColors.text),
    labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: TColors.text),
  );

  // --------------- ICONS --------------- //
  static IconThemeData iconSmTheme = const IconThemeData(size: 16, weight: 400, color: TColors.black);
  static IconThemeData iconMdTheme = const IconThemeData(size: 18, weight: 400, color: TColors.black);
  static IconThemeData iconLgTheme = const IconThemeData(size: 20, weight: 400, color: TColors.black);
  static IconThemeData iconXlTheme = const IconThemeData(size: 30, weight: 400, color: TColors.black);

  // --------------- BUTTONS --------------- //
  static ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.all(15),
      backgroundColor: TColors.btn,
      shape: RoundedRectangleBorder(borderRadius: TStyles.br),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: TColors.btnText),
    ),
  );

  static ElevatedButtonThemeData buttonSecondaryTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.all(11),
      backgroundColor: TColors.btnSecondary,
      shape: RoundedRectangleBorder(borderRadius: TStyles.br),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: TColors.btnSecondaryText),
    ),
  );

// --------------- INPUTS --------------- //
  static InputDecorationTheme inputTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: TStyles.br,
      borderSide: BorderSide(color: TColors.inputBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: TStyles.br,
      borderSide: BorderSide(color: TColors.inputBorderActive),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: TStyles.br,
      borderSide: BorderSide(color: TColors.inputBorderError),
    ),
  );

// --------------- TEXTLINKS --------------- //
}
