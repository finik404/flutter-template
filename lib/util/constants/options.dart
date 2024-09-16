import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/enums.dart';
import 'package:tproject/util/constants/icons.dart';
import 'package:tproject/util/constants/sizes.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/extensions/media.dart';
import 'package:tproject/util/theme/themes.dart';

class TOptions {
  TOptions._();

  // --------------- TEXT --------------- //
  static TextStyle textStyles = Themes.textTheme.bodyMedium!;

  // --------------- ICON --------------- //
  static TextStyle iconStyles = Themes.iconMdTheme;

  // --------------- BUTTON --------------- //
  static ElevatedButtonThemeData Function({EdgeInsets? padding}) buttonStyles = Themes.buttonTheme;
  static TextStyle buttonIconStyles = Themes.textTheme.bodyMedium!;
  static const double buttonSpaceBetween = TSizes.spaceSm;
  static const bool buttonIsRightIcon = false;
  static const bool buttonIsFullWidth = true;

  // --------------- INPUTS --------------- //
  static InputDecorationTheme Function(bool hasError) inputStyles = Themes.inputTheme;
  static const bool inputIsPlaceholder = false;
  static TextStyle inputIconStyles = TextStyle(fontSize: 18, color: TColors.primary.withOpacity(0.5));
  static const InputCounterOptions inputHasCounter = InputCounterOptions.hide;
  static TextStyle inputCounterStyles = const TextStyle(fontSize: 12);
  static TextStyle inputPasswordIconStyles = TextStyle(fontSize: 18, color: TColors.primary.withOpacity(0.5));

  // Search input
  static InputDecorationTheme Function(bool hasError)? inputSearchStyles;
  static EdgeInsets? inputSearchPadding;
  static const bool inputSearchIsPlaceholder = true;
  static const bool inputSearchAutofocus = true;
  static String? inputSearchPrefixIcon = TIcons.search;
  static String? inputSearchSuffixIcon = TIcons.close;
  static TextStyle? inputSearchPrefixIconStyles = TextStyle(fontSize: 16, color: TColors.primary.withOpacity(0.5));
  static TextStyle? inputSearchSuffixIconStyles = TextStyle(fontSize: 18, color: TColors.primary.withOpacity(0.5));

  // Textarea
  static InputDecorationTheme Function(bool hasError)? textareaStyles;
  static EdgeInsets? textareaPadding;
  static const bool textareaIsPlaceholder = false;
  static const int textareaMinLines = 2;
  static int? textareaMaxLines;
  static const bool textAreaIsInfinity = true;

  // Phone input
  static InputDecorationTheme Function(bool hasError)? inputPhoneStyles;
  static EdgeInsets? inputPhonePadding;
  static const bool inputPhoneIsPlaceholder = false;

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
  static const Color textsLinkColor = TColors.primary;
  static const bool textsLinkHasDecoration = false;

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
  static const double checkBoxSpaceBetween = 10;
  static const double checkBoxClickRadiusWithLabel = 8.0;
  static EdgeInsets checkBoxClickPaddingWithLabel = const EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  static TextStyle? checkBoxLabelStyles;

// --------------- RADIOBUTTON --------------- //

  // --------------- TOAST --------------- //
  static const double toastMaxWidth = 0.8;
  static const EdgeInsets toastPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static BorderRadius toastBorderRadius = BorderRadius.circular(30);
  static List<BoxShadow>? toastBoxShadow = [
    BoxShadow(color: Colors.black.withOpacity(0.2), offset: const Offset(0, 3), blurRadius: 5, spreadRadius: 1)
  ];
  static Border? toastBorder;

  // --------------- SNACKBAR --------------- //
  static SnackPosition snackBarPosition = SnackPosition.BOTTOM;
  static String snackBarTitle = 'Ошибка';

  // --------------- CONFIRM --------------- //
  static double confirmWidth = Get.context!.screenWidth * 0.7;
  static double confirmRadius = TSizes.radius;
  static String confirmButtonString = 'OK';

  // --------------- ACTIONMENU --------------- //
  static Color barrierColor = TColors.black.withOpacity(0.5);
  static Color actionMenuBackground = Theme.of(Get.context!).scaffoldBackgroundColor;
  static BorderRadius actionMenuBorderRadius = BorderRadius.circular(20);

  // --------------- SKELETON --------------- //
  static Color skeletonColor1 = Colors.grey[300]!;
  static Color skeletonColor2 = Colors.grey[100]!;
  static const double skeletonHeight = 18;
  static const double skeletonRadius = TSizes.radius;

  // --------------- OTHERS --------------- //
  static const String dateFormat = 'dd.MM.yyyy';
}
