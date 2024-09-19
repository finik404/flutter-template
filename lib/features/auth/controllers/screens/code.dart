import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/features/auth/screens/password/new_password.dart';
import 'package:tproject/util/http/http.dart';

class CodeController extends GetxController {
  static CodeController get instance => Get.find();

  // Variables ----------------
  final TextEditingController codeInput = TextEditingController();
  String codeErrors = '';
  String errors = '';

  // Methods ----------------
  Future<void> check() async {
    // Validate code
    if (codeInput.text.isEmpty) {
      codeErrors = 'Введите код доступа';
      return;
    }
    if (codeInput.text.length != 4) {
      codeErrors = 'Код должен быть 4-значным';
      return;
    }

    // Request
    final response = await THttp.fetch('/code', method: HttpMethods.post, body: {
      'code': codeInput.text,
    });

    if (!response.isError) {
      // Clear errors
      errors = '';

      // Navigate
      Get.to(NewPasswordScreen(code: codeInput.text));
    }

    // Save errors
    else {
      dynamic error = response.errors?['messages'];

      errors = error;
    }
  }
}
