import 'package:flutter/material.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/features/auth/screens/password/new_password.dart';

class CodeController extends GetxController {
  static CodeController get instance => Get.find();

  // Variables ----------------
  final TextEditingController codeInput = TextEditingController();
  String codeErrors = '';
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
    if (!validate()) return;

    // Check network connection
    bool isConnected = await NetworkController.instance.checkNetwork();
    if (!isConnected) return;

    // Request
    final response = await THttp.fetch('/code', method: HttpMethods.post, body: {
      'code': codeInput.text,
    });
    if (response.isError) return;

    // Clear errors
    codeErrors = '';

    // Navigate
    to(NewPasswordScreen(code: codeInput.text));
  }

  bool validate() {
    if (codeInput.text.isEmpty) {
      codeErrors = L.of(Get.context!).errors_code;
    }
    if (codeInput.text.length != 4) {
      codeErrors = L.of(Get.context!).errors_code_length;
    }
    return codeErrors.isEmpty;
  }

  // onClose ----------------
  @override
  void onClose() {
    super.onClose();
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
  }
}
