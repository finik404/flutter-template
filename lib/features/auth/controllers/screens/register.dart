import 'package:flutter/material.dart';
import 'package:tproject/features/tabs/screens/tabs.dart';
import 'package:tproject/util/exports.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/features/auth/controllers/user.dart';
import 'package:tproject/features/auth/models/user.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // # --------------- Variables --------------- #

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final RxBool isLoading = false.obs;

  // # --------------- Methods --------------- #

  // register ----------------
  Future<void> register() async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    // Check network connection
    bool isConnected = await NetworkController.instance.checkNetwork();
    if (!isConnected) return;

    // Set loading
    isLoading.value = true;

    // Request
    final response = await THttp.fetch('/register', method: HttpMethods.post, body: {
      'name': nameInput.text,
      'email': emailInput.text,
      'password': passwordInput.text,
    });
    if (!response.isError) {
      // Data
      UserModel user = UserModel.fromJson(response.data);

      // Save auth token
      final storage = GetStorage();
      if (user.token != null) storage.write('auth_token', user.token!);

      // Save user to store
      UserController.instance.setUser(user);

      // Navigate
      toOff(const Tabs());
    }

    // Remove loading
    isLoading.value = false;
  }
}
