import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/http/http.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController phoneInput = TextEditingController();

  // Methods ----------------
  Future<void> onLogin() async {
    final response = await THttp.fetch('/account');
    // if (formKey.currentState!.validate()) {}
  }
}
