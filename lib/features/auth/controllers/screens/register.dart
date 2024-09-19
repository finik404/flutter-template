import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/features/auth/models/user.dart';
import 'package:tproject/util/http/http.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  String errors = '';

  // Methods ----------------
  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      // Request
      final response = await THttp.fetch('/register', method: HttpMethods.post, body: {
        'name': nameInput.text,
        'email': emailInput.text,
        'password': passwordInput.text,
      });

      if (!response.isError) {
        // Clear errors
        errors = '';

        // Data
        UserModel data = UserModel.fromJson(response.data);

        // Save auth token
        final storage = GetStorage();
        if (data.token != null) storage.write('auth_token', data.token!);

        // Save user to store

        // Navigate
        // Get.offAll(HomeScreen());
      }

      // Save errors
      else {
        dynamic error = response.errors?['messages'];

        if (response.errors?['messages']?['credentials_incorrect']?[0] == 'The provided credentials are incorrect.') {
          error = 'Неправельные данные';
        }
        if (response.errors?['messages']?['email']?[0] == 'The email has already been taken.') {
          error = 'Данная почта уже используется';
        }

        errors = error;
      }
    }
  }
}
