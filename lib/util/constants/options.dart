import 'package:flutter/material.dart';
import 'package:tproject/util/constants/sizes.dart';

class WidgetsOptions {
  WidgetsOptions._();

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
}
