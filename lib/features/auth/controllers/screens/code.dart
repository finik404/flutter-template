import 'package:flutter/material.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/features/auth/screens/password/new_password.dart';

class CodeController extends GetxController {
  static CodeController get instance => Get.find();

  // # --------------- Variables --------------- #

  final TextEditingController codeInput = TextEditingController();
  final int codeCount = 4;
  Rx<String> codeErrors = ''.obs;
  final RxBool isLoading = false.obs;

  // # --------------- Methods --------------- #

  // check ----------------
  Future<void> check() async {
    // Validate
    if (!validate()) return;

    // Check network connection
    bool isConnected = await NetworkController.instance.checkNetwork();
    if (!isConnected) return;

    // Set loading
    isLoading.value = true;

    // Clear errors
    codeErrors.value = '';

    // Request
    final response = await THttp.fetch('/code', method: HttpMethods.post, body: {
      'code': codeInput.text,
    });
    if (!response.isError) {
      // Navigate
      to(NewPasswordScreen(code: codeInput.text));
    }

    // Remove loading
    isLoading.value = false;
  }

  bool validate() {
    if (codeInput.text.isEmpty) {
      codeErrors.value = L.of(Get.context!).errors_code;
      return false;
    }
    if (codeInput.text.length != codeCount) {
      codeErrors.value = L.of(Get.context!).errors_code_length;
      return false;
    }
    return true;
  }
}
