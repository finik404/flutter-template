import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/constants/models.dart';
import 'package:tproject/util/http/http.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController phoneInput = TextEditingController();
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
  Future<void> onLogin() async {
    if (formKey.currentState!.validate()) {}
  }
}
