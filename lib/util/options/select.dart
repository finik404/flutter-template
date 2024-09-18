import 'package:tproject/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';

class TSelectOptions {
  TSelectOptions._();

  // --------------- OPTIONS --------------- //
  static InputDecorationTheme styles = selectTheme;
  static TextStyle labelStyles = selectTheme.labelStyle!;
  static TextStyle activeLabelStyles = selectTheme.floatingLabelStyle!;
  static TextStyle iconStyles = selectIconTheme;
  static MenuStyle menuStyles = selectMenuTheme;
  static ButtonStyle menuItemStyles = selectMenuItemTheme;

  // --------------- THEMES --------------- //
  static InputDecorationTheme selectTheme = InputDecorationTheme(
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    labelStyle: TextStyle(fontSize: 14, color: TColors.primary.withOpacity(0.5)),
    floatingLabelStyle: TextStyle(fontSize: 18, color: TColors.primary.withOpacity(0.5)),
    enabledBorder: OutlineInputBorder(
      borderRadius: TStyles.br,
      borderSide: BorderSide(color: TColors.primary2.withOpacity(0.2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: TStyles.br,
      borderSide: const BorderSide(color: TColors.primary2),
    ),
  );
  static MenuStyle selectMenuTheme = MenuStyle(
    backgroundColor: const WidgetStatePropertyAll(TColors.white),
    elevation: const WidgetStatePropertyAll(0),
    side: WidgetStatePropertyAll(BorderSide(color: TColors.primary2.withOpacity(0.2))),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 5)),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: TStyles.br)),
  );
  static TextStyle selectIconTheme = const TextStyle(fontSize: 16, color: TColors.primary);
  static ButtonStyle selectMenuItemTheme = ButtonStyle();
}
