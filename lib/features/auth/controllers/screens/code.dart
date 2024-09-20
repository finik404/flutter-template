import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/features/auth/screens/password/new_password.dart';
import 'package:tproject/util/http/http.dart';

class CodeController extends GetxController {
  static CodeController get instance => Get.find();

  // Variables ----------------
  final TextEditingController codeInput = TextEditingController();
  String codeErrors = '';
  String errors = '';
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  // onInit ----------------
  @override
  void onInit() {
    super.onInit();
    controllers = List.generate(4, (_) => TextEditingController());
    focusNodes = List.generate(4, (_) => FocusNode());
  }

  // Methods ----------------
  void onChange(BuildContext context, String value, int index) {
    String otp = controllers.map((controller) => controller.text).join();

    if (value.isNotEmpty) {
      print('value ${value}');
      
      codeInput.text = otp;

      controllers[index].text = value;

      if (index < 3) {
        FocusScope.of(context).nextFocus();
      } else {
        FocusScope.of(context).unfocus();
        check();
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).previousFocus();
      }
    }
  }

  Future<void> check() async {
    // Validate
    validate();

    if (codeErrors.isNotEmpty) {
      // Request
      final response = await THttp.fetch('/code', method: HttpMethods.post, body: {
        'code': codeInput.text,
      });

      if (!response.isError) {
        // Clear errors
        errors = '';
        codeErrors = '';

        // Navigate
        Get.to(NewPasswordScreen(code: codeInput.text));
      }

      // Save errors
      else {
        dynamic error = response.errors?['messages'];

        errors = error;
      }
    }
  }

  void validate() {
    if (codeInput.text.isEmpty) {
      codeErrors = 'Введите код доступа';
    }
    if (codeInput.text.length != 4) {
      codeErrors = 'Код должен быть 4-значным';
    }
  }

  // onClose ----------------
  // @override
  // void onClose() {
  //   super.onClose();
  //   for (var controller in controllers) {
  //     controller.dispose();
  //   }
  //   for (var node in focusNodes) {
  //     node.dispose();
  //   }
  // }
}
