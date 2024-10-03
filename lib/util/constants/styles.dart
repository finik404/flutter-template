import 'package:flutter/material.dart';
import 'package:tproject/util/constants/colors.dart';

class TStyles {
  TStyles._();

  // FontFamily
  static const String font = 'Circe';

  // BorderRadius
  static const double radius = 10;
  static BorderRadius br = BorderRadius.circular(radius);

  static BorderRadius brBottom(double? value) {
    return BorderRadius.only(
      topLeft: Radius.circular(value ?? radius),
      topRight: Radius.circular(value ?? radius),
    );
  }

  static BorderRadius brTop(double? value) {
    return BorderRadius.only(
      topLeft: Radius.circular(value ?? radius),
      topRight: Radius.circular(value ?? radius),
    );
  }

  // Padding
  static const EdgeInsets pd = EdgeInsets.symmetric(vertical: 16, horizontal: 27);
  static const EdgeInsets pdLg = EdgeInsets.symmetric(vertical: 32, horizontal: 27);
  static const EdgeInsets pdClick = EdgeInsets.all(10);
  static const EdgeInsets pdBg = EdgeInsets.symmetric(vertical: 20, horizontal: 20);

  // Border
  static Border bd(Color? value) => Border.all(color: value ?? TColors.divider);

  static Border bdBottom(Color? value) => Border(bottom: BorderSide(color: value ?? TColors.divider));

  static Border bdTop(Color? value) => Border(top: BorderSide(color: value ?? TColors.divider));

  // BoxShadow
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      spreadRadius: 0,
      blurRadius: 15,
      offset: const Offset(0, 4),
    ),
  ];
}
