import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/features/auth/controllers/user.dart';
import 'package:tproject/features/auth/models/user.dart';
import 'package:tproject/features/tabs/screens/tabs.dart';
import 'package:tproject/util/exports.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // # --------------- Variables --------------- #

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController phoneInput = TextEditingController();
  final RxBool isLoading = false.obs;

  final List<ItemModel> selectItems = [
    ItemModel('value1', 'label1'),
    ItemModel('value2', 'label2'),
    ItemModel('value3', 'label3'),
  ];
  late ItemModel select;

  // # --------------- onInit --------------- #

  @override
  void onInit() {
    super.onInit();
    select = selectItems[0];
  }

  // # --------------- Methods --------------- #

  // login ----------------
  Future<void> login() async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    // Check network connection
    bool isConnected = await NetworkController.instance.checkNetwork();
    if (!isConnected) return;

    // Set loading
    isLoading.value = true;

    // Request
    final response = await THttp.fetch('/login', method: HttpMethods.post, body: {
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
