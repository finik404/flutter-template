import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/http/http.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  // Methods ----------------
  Future<void> onRegister() async {
    if (formKey.currentState!.validate()) {}
  }
}
