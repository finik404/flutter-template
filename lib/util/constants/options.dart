import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/icons.dart';
import 'package:tproject/util/constants/sizes.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/theme/themes.dart';

// Default options for UI widgets
class TOptions {
  TOptions._();

  // --------------- TEXT --------------- //
  static TextStyle textStyles = Themes.textTheme.bodyMedium!;

  // --------------- ICON --------------- //
  static IconThemeData iconStyles = Themes.iconMdTheme;

  // --------------- BUTTON --------------- //
  static ButtonStyle buttonStyles = Themes.buttonTheme.style!;
  static TextStyle buttonIconStyles =Themes.textTheme.bodyMedium!;
  static const double buttonSpaceBetween = TSizes.spaceSm;
  static const bool buttonIsRightIcon = false;
  static const bool buttonIsFullWidth = true;

  // --------------- INPUT --------------- //
  static InputDecorationTheme inputStyles = Themes.inputTheme;

  // --------------- SELECT --------------- //

  // --------------- ICONBUTTON --------------- //
  static const double iconButtonRadius = 50;
  static EdgeInsets iconButtonPadding = TStyles.pdClick;

  // --------------- TEXTLINK --------------- //
  static TextStyle textLinkStyles = Themes.textLinkTheme;
  static TextStyle textLinkIconStyles = Themes.textLinkIconTheme;
  static const bool textLinkIsRightIcon = false;
  static const double textLinkSpaceBetween = TSizes.spaceSm;
  static const double textLinkClickRadius = 5;
  static const EdgeInsets textLinkClickPadding = EdgeInsets.symmetric(horizontal: 5);

  // --------------- TEXTS --------------- //

  // --------------- LIST --------------- //
  static const Axis listDirection = Axis.vertical;
  static const bool listHasScroll = false;
  static const EdgeInsets listPadding = EdgeInsets.symmetric(horizontal: TSizes.spaceSm);
  static const double listSpaceBetween = TSizes.spaceSm;
  static const double? listHeight = null;

  // --------------- GRID --------------- //
  static const int gridCrossCount = 2;
  static const double gridSpaceBetween = TSizes.spaceSm;
  static const double gridSpaceBottom = TSizes.spaceSm;
  static const bool gridHasScroll = false;
  static const EdgeInsets gridPadding = EdgeInsets.all(0);

  // --------------- REFRESH --------------- //
  static Color refreshColor = Theme.of(Get.context!).primaryColor;
  static Color refreshBackground = Theme.of(Get.context!).scaffoldBackgroundColor;

  // --------------- CLICKAREA --------------- //
  static Color clickAreaColor = TColors.black.withOpacity(0.1);
  static const double clickAreaRadius = TSizes.radius;
  static EdgeInsets clickAreaPadding = TStyles.noPd;

  // --------------- IMAGE --------------- //
  static const BoxFit imageFit = BoxFit.cover;
  static BorderRadiusGeometry imageRadius = TStyles.br;
  static TextStyle imageLetterStyles =
      const TextStyle().copyWith(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(Get.context!).colorScheme.primary);
  static Color imageBg = Theme.of(Get.context!).scaffoldBackgroundColor;
  static Color imagePlaceholderBg = Theme.of(Get.context!).scaffoldBackgroundColor;
  static String? imagePlaceholderIcon = TIcons.camera;
  static const BoxDecoration imageDecoration = BoxDecoration();

  // --------------- TOGGLE --------------- //
  static Color toggleColor = Theme.of(Get.context!).colorScheme.primary.withOpacity(0.4);
  static Color toggleActiveColor = Theme.of(Get.context!).primaryColor;
  static const double toggleWidth = 48;
  static const double toggleHeight = 24;
  static const double toggleThumbSize = 20;
  static const double toggleThumbSideBetween = 2;
  static Color toggleThumbColor = Theme.of(Get.context!).scaffoldBackgroundColor;
  static Color toggleThumbActiveColor = Theme.of(Get.context!).scaffoldBackgroundColor;
  static const int toggleDuration = 200;
  static const BoxDecoration toggleDecoration = BoxDecoration();
  static const BoxDecoration toggleThumbDecoration = BoxDecoration();

  // --------------- CHECKBOX --------------- //
  static const double checkBoxSize = 20;
  static const double checkBoxRadius = 3;
  static const double checkBoxIconSize = 0.5;
  static TextStyle checkBoxIconStyles = const TextStyle().copyWith(fontWeight: FontWeight.bold, color: Theme.of(Get.context!).primaryColor);
  static EdgeInsets checkBoxClickPadding = TStyles.pdClick;
  static const double checkBoxClickRadius = 20;
  static String checkBoxIcon = TIcons.check;
  static BoxDecoration Function(bool) checkBoxDecoration = (bool value) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(checkBoxRadius),
      border: Border.all(color: value ? Theme.of(Get.context!).primaryColor : Theme.of(Get.context!).primaryColor.withOpacity(0.5), width: 2),
    );
  };

// --------------- RADIOBUTTON --------------- //

// --------------- TOAST --------------- //

// --------------- ALERT --------------- //

// --------------- ACTIONMENU --------------- //

  // --------------- SKELETON --------------- //
  static Color skeletonColor1 = Colors.grey[300]!;
  static Color skeletonColor2 = Colors.grey[100]!;
  static const double skeletonHeight = 18;
  static const double skeletonRadius = TSizes.radius;

// --------------- HTMLTOTEXT --------------- //

  static const String dateFormat = 'dd.MM.yyyy';
}
