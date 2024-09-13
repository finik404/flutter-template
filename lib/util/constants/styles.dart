import 'package:flutter/material.dart';
import 'package:tproject/util/constants/sizes.dart';

class TStyles {
  TStyles._();

  // BorderRadius
  static BorderRadius br = BorderRadius.circular(TSizes.radius);

  // Padding
  static EdgeInsets pd = const EdgeInsets.symmetric(vertical: 16, horizontal: 27);
  static EdgeInsets pdLg = const EdgeInsets.symmetric(vertical: 32, horizontal: 27);
  static EdgeInsets noPd = const EdgeInsets.all(0);
  static EdgeInsets pdClick = const EdgeInsets.all(10);
}
