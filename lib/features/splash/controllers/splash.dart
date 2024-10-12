import 'package:get/get.dart';
import 'package:tproject/features/auth/controllers/user.dart';
import 'package:tproject/features/auth/models/user.dart';
import 'package:tproject/features/auth/screens/login.dart';
import 'package:tproject/features/tabs/screens/tabs.dart';
import 'package:tproject/util/http/http.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  // # --------------- Methods --------------- #

  // checkAuth ----------------
  Future<void> checkAuth() async {
    // Check auth
    final response = await THttp.fetch('/account');

    if (!response.isError) {
      // Save to store
      UserController.instance.setUser(UserModel.fromJson(response.data));

      // Navigate to home
      Get.offAll(const Tabs());
    } else {
      // Navigate to auth
      Get.offAll(const LoginScreen());
    }
  }
}
