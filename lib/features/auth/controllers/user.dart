import 'package:tproject/util/exports.dart';
import 'package:tproject/features/auth/models/user.dart';
import 'package:tproject/features/auth/screens/login.dart';
import 'package:tproject/features/home/screens/home.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Variables ----------------
  UserModel? user;

  // onReady ----------------
  @override
  void onReady() {
    super.onReady();
    // checkAuth();

    Get.offAll(const LoginScreen());
  }

  // Methods ----------------
  Future<void> checkAuth() async {
    // Check auth
    final response = await THttp.fetch('/account');

    if (!response.isError) {
      // Save to store
      UserController.instance.setUser(UserModel.fromJson(response.data));

      // Navigate to home
      Get.offAll(const HomeScreen());
    } else {
      // Navigate to auth
      Get.offAll(const LoginScreen());
    }
  }

  // Methods ----------------
  void setUser(UserModel value) {
    user = value;
  }

  void removeUser() {
    user = null;
  }
}
