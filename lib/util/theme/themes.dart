import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/constants/colors.dart';

class Themes {
  Themes._();

  // --------------- TEXT --------------- //
  static TextTheme textTheme = TextTheme(
    bodySmall: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary),
    bodyMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary),
    bodyLarge: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary),
    titleSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(Get.context!).colorScheme.primary),
    titleMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary),
  );

  // --------------- ICONS --------------- //
  static IconThemeData iconSmTheme = IconThemeData(size: 16, weight: 400, color: Theme.of(Get.context!).colorScheme.primary);
  static IconThemeData iconMdTheme = IconThemeData(size: 18, weight: 400, color: Theme.of(Get.context!).colorScheme.primary);
  static IconThemeData iconLgTheme = IconThemeData(size: 20, weight: 400, color: Theme.of(Get.context!).colorScheme.primary);
  static IconThemeData iconXlTheme = IconThemeData(size: 30, weight: 400, color: Theme.of(Get.context!).colorScheme.primary);

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
  static TextStyle textLinkTheme =
      const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).primaryColor);
  static TextStyle textLinkIconTheme =
      const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).primaryColor);
}
