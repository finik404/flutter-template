import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
