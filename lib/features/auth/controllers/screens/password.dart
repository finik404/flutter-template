import 'package:flutter/material.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/features/auth/screens/password/code/code.dart';

class PasswordController extends GetxController {
  static PasswordController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();

  // Methods ----------------
  Future<void> receive() async {
    Get.to(PasswordCodeScreen(email: emailInput.text));

    // Validate form
    if (!formKey.currentState!.validate()) return;

    // Check network connection
    bool isConnected = await NetworkController.instance.checkNetwork();
    if (!isConnected) return;

    // Request
    final response = await THttp.fetch('/forgot', method: HttpMethods.post, body: {
      'email': emailInput.text,
    });
    if (response.isError) return;

    // Navigate
   to(PasswordCodeScreen(email: emailInput.text));
  }
}
