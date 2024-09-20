import 'package:get/get.dart';
import 'package:tproject/features/auth/models/user.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Variables ----------------
  UserModel? user;

  // Methods ----------------
  void setUser(UserModel value) {
    user = value;
  }

  void removeUser() {
    user = null;
  }
}
