import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/sizes.dart';

// Default options for UI widgets
class WidgetsOptions {
  WidgetsOptions._();

  // Text
  static const int text = 2;

  // Icon
  static const int Icon = 2;

  // Button
  static const int Button = 2;

  // Grid
  static const int gridCrossCount = 2;
  static const double gridSpaceBetween = Sizes.spaceSm;
  static const double gridSpaceBottom = Sizes.spaceSm;
  static const bool gridHasScroll = false;
  static const EdgeInsets gridPadding = EdgeInsets.all(0);

  // List
  static const Axis listDirection = Axis.vertical;
  static const bool listHasScroll = false;
  static const EdgeInsets listPadding = EdgeInsets.symmetric(horizontal: Sizes.spaceSm);
  static const double listSpaceBetween = Sizes.spaceSm;
  static const double? listHeight = null;

  // TextLink
  static Color textLinkColor = Theme.of(Get.context!).primaryColor;
  static const bool textLinkIsRightIcon = false;
  static const double textLinkSpaceBetween = Sizes.spaceSm;
}
