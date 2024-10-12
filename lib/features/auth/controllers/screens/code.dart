import 'package:flutter/material.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/features/auth/screens/password/new_password.dart';

class CodeController extends GetxController {
  static CodeController get instance => Get.find();

  // # --------------- Variables --------------- #

  final TextEditingController codeInput = TextEditingController();
  final RxBool isLoading = false.obs;

  // # --------------- Methods --------------- #

  // check ----------------
  Future<void> check() async {
    // Validate
    // if (!validate()) return;

    // Check network connection
    bool isConnected = await NetworkController.instance.checkNetwork();
    if (!isConnected) return;

    // Request
    final response = await THttp.fetch('/code', method: HttpMethods.post, body: {
      'code': codeInput.text,
    });
    if (response.isError) return;

    // Clear errors
    // codeErrors = '';

    // Navigate
    to(NewPasswordScreen(code: codeInput.text));
  }
}
