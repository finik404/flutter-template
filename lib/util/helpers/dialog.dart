import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Dialogs/ActionMenu.dart';
import 'package:tproject/common/widgets/Dialogs/Confirm.dart';
import 'package:tproject/common/widgets/Dialogs/Toast.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/languages/L.dart';
import 'package:tproject/util/constants/colors.dart';

class TDialog {
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
      icon: const UIIcon(TIcons.warning, color: Colors.white, size: 20),
    );
  }

  static void showConfirm(
    String title, {
    String? text,
    double? width,
    Function()? close,
  }) {
    showDialog(
      context: Get.context!,
      barrierColor: TColors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return UIConfirm(title, text: text, width: width, close: close);
      },
    );
  }

  static void showActionMenu({
    List<ActionModel>? actions,
    Widget? content,
    String? label,
    Color? bg,
    EdgeInsets? padding,
    bool hasScroll = false,
    double? height,
    BorderRadius? borderRadius,
  }) {
    Color background = bg ?? TColors.bg;

    showModalBottomSheet(
      useSafeArea: true,
      context: Get.context!,
      barrierColor: TColors.black.withOpacity(0.5),
      backgroundColor: background,
      elevation: 0,
      isScrollControlled: hasScroll || height != null,
      builder: (BuildContext context) {
        return UIActionMenu(
          actions: actions,
          content: content,
          label: label,
          padding: padding,
          borderRadius: borderRadius,
          hasScroll: hasScroll,
          height: height,
          bg: background,
        );
      },
    );
  }

  static void showToast(BuildContext context, String message, {bool isWarning = false}) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => UIToast(message, isWarning: isWarning),
    );

    Overlay.of(context, rootOverlay: true).insert(overlayEntry);
    Future.delayed(const Duration(seconds: 3), () => overlayEntry.remove());
  }
}
