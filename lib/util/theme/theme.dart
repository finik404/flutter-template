import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/theme/custom/btn.dart';
import 'package:tproject/util/theme/custom/icon.dart';
import 'package:tproject/util/theme/custom/text.dart';

class AppTheme {
  AppTheme._();

  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Circe',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bg,
    textTheme: ThemeTexts.textsTheme,
    elevatedButtonTheme: ThemeButtons.btnPrimaryTheme,
    iconTheme: ThemeIcons.iconsMdTheme,
  );
}
