import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/http/http.dart';

class NewPasswordController extends GetxController {
  static NewPasswordController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController repeatPasswordInput = TextEditingController();
  String errors = '';

  // Methods ----------------
  Future<void> restore() async {
    if (formKey.currentState!.validate()) {}
  }
}
