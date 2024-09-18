import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/sizes.dart';
import 'package:tproject/util/extensions/media.dart';

class TDialogsOptions {
  TDialogsOptions._();

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
}
