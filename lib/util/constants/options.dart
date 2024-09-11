import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/icons.dart';
import 'package:tproject/util/constants/sizes.dart';
import 'package:tproject/util/constants/styles.dart';

// Default options for UI widgets
class WidgetsOptions {
  WidgetsOptions._();

  // Text
  static TextStyle textStyles = Theme.of(Get.context!).textTheme.bodyMedium!;

  // Icon
  static IconThemeData iconStyles = Theme.of(Get.context!).iconTheme;

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
  static TextStyle textLinkStyles = Theme.of(Get.context!).textTheme.bodyMedium!;
  static Color textLinkIconColor = Theme.of(Get.context!).primaryColor;
  static double textLinkIconSize = Theme.of(Get.context!).iconTheme.size!;
  static const FontWeight textLinkIconWeight = FontWeight.normal;
  static IconThemeData textLinkIconStyles = Theme.of(Get.context!).iconTheme;
  static const bool textLinkIsRightIcon = false;
  static const double textLinkSpaceBetween = Sizes.spaceSm;
  static const double textLinkClickRadius = 5;
  static const EdgeInsets textLinkClickPadding = EdgeInsets.symmetric(horizontal: 5);

  // Refresh indicator
  static Color refreshColor = Theme.of(Get.context!).primaryColor;
  static Color refreshBackground = Theme.of(Get.context!).scaffoldBackgroundColor;

  // ClickArea
  static Color clickAreaColor = AppColors.black.withOpacity(0.1);
  static const double clickAreaRadius = Sizes.radius;
  static EdgeInsets clickAreaPadding = Styles.noPd;

  // IconButton
  static const double iconButtonRadius = 50;
  static const EdgeInsets iconButtonPadding = EdgeInsets.all(10);

  // Image
  static const BoxFit imageFit = BoxFit.cover;
  static BorderRadiusGeometry imageRadius = Styles.br;
  static TextStyle imageLetterStyles =
      const TextStyle().copyWith(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(Get.context!).colorScheme.primary);
  static Color imageBg = Theme.of(Get.context!).scaffoldBackgroundColor;
  static Color imagePlaceholderBg = Theme.of(Get.context!).scaffoldBackgroundColor;
  static String? imagePlaceholderIcon = CIcons.camera;

  // Toggle
  static Color toggleColor = Theme.of(Get.context!).colorScheme.primary.withOpacity(0.4);
  static Color toggleActiveColor = Theme.of(Get.context!).primaryColor;
  static const double toggleWidth = 48;
  static const double toggleHeight = 24;
  static const double toggleThumbSize = 25;
  static Color toggleThumbColor = Theme.of(Get.context!).scaffoldBackgroundColor;
  static Color toggleThumbActiveColor = Theme.of(Get.context!).scaffoldBackgroundColor;
  static const int toggleDuration = 200;
}
