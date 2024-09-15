import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Dialogs/Confirm.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/options.dart';

class TDialog {
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
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
      barrierColor: TOptions.confirmBarrierColor,
      builder: (BuildContext context) {
        return UIConfirm(title, text: text, width: width, close: close);
      },
    );
  }
}
