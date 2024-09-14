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
      backgroundColor: TColors.secondary,
      shape: RoundedRectangleBorder(borderRadius: TStyles.br),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: TColors.black),
    ),
  );

  static ElevatedButtonThemeData buttonSecondaryTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.all(11),
      backgroundColor: TColors.primary.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: TStyles.br),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: TColors.primary),
    ),
  );

  // --------------- INPUTS --------------- //
  static InputDecorationTheme Function(bool) inputTheme = (hasError) {
    return InputDecorationTheme(
      fillColor: Colors.transparent,
      labelStyle: TextStyle(fontSize: 14, color: hasError ? TColors.error.withOpacity(0.5) : TColors.primary.withOpacity(0.5)),
      floatingLabelStyle: TextStyle(fontSize: 18, color: hasError ? TColors.error : TColors.primary.withOpacity(0.5)),
      // labelStyle.fontSize +4
      hintStyle: TextStyle(fontSize: 14, color: hasError ? TColors.error.withOpacity(0.5) : TColors.primary.withOpacity(0.5)),
      enabledBorder: OutlineInputBorder(
        borderRadius: TStyles.br,
        borderSide: BorderSide(width: 1, color: hasError ? TColors.lightenError : TColors.primary2.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: TStyles.br,
        borderSide: BorderSide(width: 1, color: hasError ? TColors.error : TColors.primary2),
      ),
      errorStyle: const TextStyle(fontSize: 12, color: TColors.error),
    );
  };

  // --------------- TEXTLINKS --------------- //
  static TextStyle textLinkTheme =
      const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).primaryColor);
  static TextStyle textLinkIconTheme =
      const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).primaryColor);
}
