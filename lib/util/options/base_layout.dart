import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';

class TBaseLayoutOptions {
  TBaseLayoutOptions._();

  // --------------- OPTIONS --------------- //
  static const bool isScrollable = false;
  static const bool hasSafeArea = true;
  static const bool hasTop = false;
  static EdgeInsets? padding = TStyles.pdBg;
}
