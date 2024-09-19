import 'package:get/get.dart';
import 'package:tproject/features/auth/models/user.dart';
import 'package:tproject/features/auth/screens/login.dart';
import 'package:tproject/util/http/http.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  // Variables ----------------

  // Init ----------------
  @override
  void onReady() {
    super.onReady();
    // checkAuth();
  }

  // Methods ----------------
  Future<void> checkAuth() async {
    // Check auth
    final response = await THttp.fetch('/account');

    if (!response.isError) {
      // Save to store
      UserModel data = UserModel.fromJson(response.data);

      // Navigate to home
      // Get.offAll(const HomeScreen());
    } else {
      // Navigate to auth
      Get.offAll(const LoginScreen());
    }
  }
}
