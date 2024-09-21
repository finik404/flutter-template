import 'package:get/get.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/extensions/media.dart';

class TSelectOptions {
  TSelectOptions._();

  // --------------- OPTIONS --------------- //
  static InputDecorationTheme Function(bool hasError, {EdgeInsets? padding})? styles = selectTheme;
  static TextStyle iconStyles = selectIconTheme;
  static MenuStyle menuStyles = selectMenuTheme;
  static ButtonStyle menuItemStyles = selectMenuItemTheme;
  static const bool isPlaceholder = false;
  static double width = Get.context!.screenWidth - 40;

  // --------------- THEMES --------------- //
  static InputDecorationTheme Function(bool hasError, {EdgeInsets? padding}) selectTheme = (bool hasError, {EdgeInsets? padding}) {
    return InputDecorationTheme(
      fillColor: Colors.transparent,
      contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
  static MenuStyle selectMenuTheme = MenuStyle(
    backgroundColor: const WidgetStatePropertyAll(TColors.white),
    elevation: const WidgetStatePropertyAll(0),
    side: WidgetStatePropertyAll(BorderSide(color: TColors.primary2.withOpacity(0.2))),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: TStyles.br)),
  );
  static TextStyle selectIconTheme = const TextStyle(fontSize: 16, color: TColors.primary);
  static ButtonStyle selectMenuItemTheme = ButtonStyle();
}
