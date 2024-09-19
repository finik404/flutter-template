import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/features/auth/screens/password/code.dart';
import 'package:tproject/util/http/http.dart';

class PasswordController extends GetxController {
  static PasswordController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  final String errors = '';

  // Methods ----------------
  Future<void> receive() async {
    if (formKey.currentState!.validate()) {
      Get.to(PasswordCodeScreen(email: emailInput.text));
    }
  }
}
