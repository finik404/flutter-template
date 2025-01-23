import 'package:flutter/material.dart';
import 'package:tproject/features/tabs/screens/tabs.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/features/auth/controllers/user.dart';
import 'package:tproject/features/auth/models/user.dart';

class NewPasswordController extends GetxController {
  static NewPasswordController get instance => Get.find();

  // # --------------- Variables --------------- #

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController repeatPasswordInput = TextEditingController();
  final RxBool isLoading = false.obs;

  // # --------------- Methods --------------- #

  // restore ----------------
  Future<void> restore() async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    // Check network connection
    bool isConnected = await NetworkController.instance.checkNetwork();
    if (!isConnected) return;

    // Set loading
    isLoading.value = true;

    // Request
    final response = await THttp.fetch('/restore', method: HttpMethods.post, body: {
      'password': passwordInput.text,
    });
    if (!response.isError) {
      // Save to store
      UserController.instance.setUser(UserModel.fromJson(response.data));

      // Navigate
      toOff(const Tabs());
    }

    // Remove loading
    isLoading.value = false;
  }
}
