import 'package:flutter/material.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/features/auth/screens/password/code.dart';

class PasswordController extends GetxController {
  static PasswordController get instance => Get.find();

  // # --------------- Variables --------------- #

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  final RxBool isLoading = false.obs;

  // # --------------- Methods --------------- #

  // receive ----------------
  Future<void> receive() async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    // Check network connection
    bool isConnected = await NetworkController.instance.checkNetwork();
    if (!isConnected) return;

    // Set loading
    isLoading.value = true;

    // Request
    final response = await THttp.fetch('/forgot', method: HttpMethods.post, body: {
      'email': emailInput.text,
    });
    if (!response.isError) {
      // Navigate
      to(PasswordCodeScreen(email: emailInput.text));
    }

    // Remove loading
    isLoading.value = false;
  }
}
