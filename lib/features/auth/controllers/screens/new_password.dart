import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/features/auth/controllers/user.dart';
import 'package:tproject/features/auth/models/user.dart';
import 'package:tproject/features/home/screens/home/home.dart';
import 'package:tproject/util/helpers/network/controller.dart';
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
    if (formKey.currentState!.validate()) {
      // Check network connection
      bool isConnected = await NetworkController.instance.checkNetwork();
      if (!isConnected) return;

      // Request
      final response = await THttp.fetch('/restore', method: HttpMethods.post, body: {
        'password': passwordInput.text,
      });

      if (!response.isError) {
        // Clear errors
        errors = '';

        // Save to store
        UserController.instance.setUser(UserModel.fromJson(response.data));

        // Navigate
        Get.offAll(const HomeScreen());
      }

      // Save errors
      else {
        dynamic error = response.errors?['messages'];

        errors = error;
      }
    }
  }
}
