import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/icons.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/models/base.dart';

export 'package:tproject/util/models/base.dart';

class TInputOptions {
  TInputOptions._();

  // --------------- OPTIONS --------------- //
  static InputDecorationTheme Function(bool hasError) styles = inputTheme;
  static const bool isPlaceholder = false;
  static TextStyle iconStyles = TextStyle(fontSize: 18, color: TColors.primary.withOpacity(0.5));
  static const InputCounterOptions hasCounter = InputCounterOptions.hide;
  static TextStyle counterStyles = const TextStyle(fontSize: 12);
  static TextStyle inputPasswordIconStyles = TextStyle(fontSize: 18, color: TColors.primary.withOpacity(0.5));

  // Search input
  static InputDecorationTheme Function(bool hasError)? inputSearchStyles;
  static EdgeInsets? inputSearchPadding;
  static const bool inputSearchIsPlaceholder = true;
  static const bool inputSearchAutofocus = true;
  static String? inputSearchPrefixIcon = TIcons.search;
  static String? inputSearchSuffixIcon = TIcons.close;
  static TextStyle? inputSearchPrefixIconStyles = TextStyle(fontSize: 16, color: TColors.primary.withOpacity(0.5));
  static TextStyle? inputSearchSuffixIconStyles = TextStyle(fontSize: 18, color: TColors.primary.withOpacity(0.5));

  // Textarea
  static InputDecorationTheme Function(bool hasError)? textareaStyles;
  static EdgeInsets? textareaPadding;
  static const bool textareaIsPlaceholder = false;
  static const int textareaMinLines = 2;
  static int? textareaMaxLines;
  static const bool textAreaIsInfinity = true;

  // Phone input
  static InputDecorationTheme Function(bool hasError)? inputPhoneStyles;
  static EdgeInsets? inputPhonePadding;
  static const bool inputPhoneIsPlaceholder = false;
  static TextInputMask inputPhoneMask = TextInputMask(mask: '\\+7 999 999 99 99');

  // --------------- THEMES --------------- //
  static InputDecorationTheme Function(bool hasError) inputTheme = (hasError) {
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
}
