import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Dialogs/ActionMenu.dart';
import 'package:tproject/common/widgets/Dialogs/Confirm.dart';
import 'package:tproject/common/widgets/Dialogs/PermissionPopup.dart';
import 'package:tproject/common/widgets/Dialogs/Toast.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/languages/L.dart';
import 'package:tproject/util/constants/colors.dart';

class TDialog {
  // showSnackBar ---------------
  static void showSnackBar(String message, {String? title, bool isError = false}) {
    Get.snackbar(
      title ?? L.of(Get.context!).error,
      message,
      shouldIconPulse: true,
      isDismissible: true,
      colorText: Colors.white,
      backgroundColor: isError ? Colors.red : Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.all(20),
      icon: const UIIcon(FontAwesomeIcons.triangleExclamation, color: Colors.white, size: 20),
    );
  }

  // showConfirm ---------------
  static void showConfirm(
    String title, {
    String? text,
    double? width,
    Function()? close,
  }) {
    showDialog(
      context: Get.context!,
      barrierColor: TColors.black.withValues(alpha: 0.5),
      builder: (BuildContext context) {
        return UIConfirm(title, text: text, width: width, close: close);
      },
    );
  }

  // showActionMenu ---------------
  static void showActionMenu({
    List<ActionModel>? actions,
    Widget? content,
    String? label,
    Color? bg,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
  }) {
    Color background = bg ?? TColors.bg;

    showModalBottomSheet(
      useSafeArea: true,
      context: Get.context!,
      barrierColor: TColors.black.withValues(alpha: 0.5),
      backgroundColor: background,
      elevation: 0,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return UIActionMenu(
          actions: actions,
          content: content,
          label: label,
          padding: padding,
          borderRadius: borderRadius,
          bg: background,
        );
      },
    );
  }

  // showToast ---------------
  static void showToast(String text, {bool isWarning = false}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      titleText: Container(),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      barBlur: 0,
      messageText: UIToast(text, isWarning: isWarning),
    );
  }

  // showPermissionPopup ---------------
  static void showPermissionPopup(String title, String text) {
    showActionMenu(content: UIPermissionPopup(title, text));
  }
}
