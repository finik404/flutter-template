import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/features/auth/screens/password/code/code.dart';
import 'package:tproject/util/helpers/network/controller.dart';
import 'package:tproject/util/http/http.dart';

class PasswordController extends GetxController {
  static PasswordController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  String errors = '';

  // Methods ----------------
  Future<void> receive() async {
    Get.to(PasswordCodeScreen(email: emailInput.text));

    if (formKey.currentState!.validate()) {
      // Check network connection
      bool isConnected = await NetworkController.instance.checkNetwork();
      if (!isConnected) return;

      // Request
      final response = await THttp.fetch('/forgot', method: HttpMethods.post, body: {
        'email': emailInput.text,
      });

      if (!response.isError) {
        // Clear errors
        errors = '';

        // Navigate
        Get.to(PasswordCodeScreen(email: emailInput.text));
      }

      // Save errors
      else {
        dynamic error = response.errors?['messages'];

        if (response.errors?['messages']?['email']?[0] == 'The email has already been taken.') {
          error = 'Данная почта уже используется';
        }

        errors = error;
      }
    }
  }
}
