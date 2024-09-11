import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';

class ThemeLink {
  ThemeLink._();

  // Link theme
  static TextButtonThemeData linkTheme = TextButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all<Color>(AppColors.black),
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return const TextStyle(decoration: TextDecoration.underline);
          }
          return const TextStyle(decoration: TextDecoration.none);
        },
      ),
      // Отступы для кнопки
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(5)),
    ),
  );
}
