import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/features/auth/controllers/user.dart';
import 'package:tproject/features/auth/models/user.dart';
import 'package:tproject/features/home/screens/home/home.dart';
import 'package:tproject/languages/L.dart';
import 'package:tproject/util/helpers/network/controller.dart';
import 'package:tproject/util/http/http.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController phoneInput = TextEditingController();
  String errors = '';

  final List<SelectItemModel> selectItems = [
    SelectItemModel('value1', 'label1'),
    SelectItemModel('value2', 'label2'),
    SelectItemModel('value3', 'label3'),
  ];
  late SelectItemModel select;

  @override
  void onInit() {
    super.onInit();
    select = selectItems[0];
  }

  // Methods ----------------
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      // Check network connection
      bool isConnected = await NetworkController.instance.checkNetwork();
      if (!isConnected) return;

      // Request
      final response = await THttp.fetch('/login', method: HttpMethods.post, body: {
        'email': emailInput.text,
        'password': passwordInput.text,
      });

      if (!response.isError) {
        // Clear errors
        errors = '';

        // Data
        UserModel user = UserModel.fromJson(response.data);

        // Save auth token
        final storage = GetStorage();
        if (user.token != null) storage.write('auth_token', user.token!);

        // Save user to store
        UserController.instance.setUser(user);

        // Navigate
        Get.offAll(const HomeScreen());
      }

      // Save errors
      else {
        dynamic error = response.errors?['messages'];

        if (response.errors?['messages']?['credentials_incorrect']?[0] == 'The provided credentials are incorrect.') {
          error = L.of(Get.context!).errors_auth;
        }
        if (response.errors?['messages']?['email']?[0] == 'The email has already been taken.') {
          error = L.of(Get.context!).errors_email_unique;
        }

        errors = error;
      }
    }
  }
}
