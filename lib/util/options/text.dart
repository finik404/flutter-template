import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/sizes.dart';

class TTextOptions {
  TTextOptions._();

  // --------------- OPTIONS --------------- //
  static TextStyle styles = textTheme.bodyMedium!;
  static const bool hasParse = false;

  // TextLink
  static TextStyle linkStyles = linkTheme;
  static TextStyle linkIconStyles = linkIconTheme;
  static const bool linkIsRightIcon = false;
  static const double linkSpaceBetween = TSizes.spaceSm;
  static const double linkClickRadius = 5;
  static const EdgeInsets linkClickPadding = EdgeInsets.symmetric(horizontal: 5);

  // Texts
  static const Color textsLinkColor = TColors.primary;
  static const bool textsLinkHasDecoration = false;

  // --------------- THEMES --------------- //
  static TextTheme textTheme = TextTheme(
    bodySmall: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary),
    bodyMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary),
    bodyLarge: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary),
    titleSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(Get.context!).colorScheme.primary),
    titleMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).colorScheme.primary),
  );

  // TextLink
  static TextStyle linkTheme = const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).primaryColor);
  static TextStyle linkIconTheme =
      const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(Get.context!).primaryColor);
}
