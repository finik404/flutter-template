import 'package:get/get.dart';
import 'package:tproject/features/auth/controllers/user.dart';
import 'package:tproject/features/auth/models/user.dart';
import 'package:tproject/features/auth/screens/login.dart';
import 'package:tproject/features/tabs/screens/tabs.dart';
import 'package:tproject/util/http/http.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  // # --------------- Variables --------------- #

  // # --------------- onReady --------------- #

  @override
  void onReady() {
    super.onReady();
    Get.offAll(const Tabs());
    // checkAuth();
  }

  // # --------------- Methods --------------- #

  // showSplash ----------------
  Future<void> showSplash() async {
    // Start time
    final startTime = DateTime.now();

    // Base callbacks
    final response = await checkAuth();

    // Check last time
    final elapsedTime = DateTime.now().difference(startTime).inMilliseconds;
    if (elapsedTime < 2000) {
      await Future.delayed(Duration(milliseconds: 2000 - elapsedTime));
    }

    // Navigate
    navigate(response);
  }

  // checkAuth ----------------
  Future<ResponseModel> checkAuth() async {
    // Check auth
    final response = await THttp.fetch('/account', hasWarning: false);

    if (!response.isError) {
      // Save to store
      UserController.instance.setUser(UserModel.fromJson(response.data));
    }

    return response;
  }

  // navigate ----------------
  Future<void> navigate(ResponseModel response) async {
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
