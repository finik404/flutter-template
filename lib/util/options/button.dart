import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/options/text.dart';

class TButtonOptions {
  TButtonOptions._();

  // --------------- OPTIONS --------------- //
  static ElevatedButtonThemeData Function({EdgeInsets? padding}) styles = buttonTheme;
  static TextStyle iconStyles = TTextOptions.textTheme.bodyMedium!;
  static const double spaceBetween = 12;
  static const bool isRightIcon = false;
  static const bool isFullWidth = true;

  // --------------- THEMES --------------- //
  static ElevatedButtonThemeData Function({EdgeInsets? padding}) buttonTheme = ({EdgeInsets? padding}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: padding ?? const EdgeInsets.all(15),
        backgroundColor: TColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: TStyles.br),
        textStyle: TTextOptions.textTheme.bodyMedium,
        shadowColor: Colors.transparent,
      ),
    );
  };

  static ElevatedButtonThemeData Function({EdgeInsets? padding}) buttonSecondaryTheme = ({EdgeInsets? padding}) {
    style:
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(11),
        backgroundColor: TColors.primary.withOpacity(0.08),
        shape: RoundedRectangleBorder(borderRadius: TStyles.br),
        textStyle: TTextOptions.textTheme.bodyMedium,
        shadowColor: Colors.transparent,
      ),
    );
  };
}
