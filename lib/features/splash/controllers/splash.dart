import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/features/auth/screens/login.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  // Variables ----------------
  @override
  void onReady() {
    super.onReady();
    initData();
  }

  // Variables ----------------

  // Methods ----------------
  Future<void> initData() async {
    Get.offAll(const LoginScreen());
  }
}
