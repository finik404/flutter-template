import 'package:flutter/material.dart';
import 'package:tproject/util/constants/sizes.dart';

class TStyles {
  TStyles._();

  // FontFamily
  static const String font = 'Circe';

  // BorderRadius
  static BorderRadius br = BorderRadius.circular(TSizes.radius);

  // Padding
  static const EdgeInsets pd =  EdgeInsets.symmetric(vertical: 16, horizontal: 27);
  static const EdgeInsets pdLg =  EdgeInsets.symmetric(vertical: 32, horizontal: 27);
  static const EdgeInsets pdClick =  EdgeInsets.all(10);
  static const EdgeInsets pdBg =  EdgeInsets.symmetric(vertical: 20, horizontal: 20);
}
