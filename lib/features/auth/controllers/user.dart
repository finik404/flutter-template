import 'package:tproject/util/exports.dart';
import 'package:tproject/features/auth/models/user.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // # --------------- Variables --------------- #

  final Rxn<UserModel> user = Rxn();

  // # --------------- Methods --------------- #

  // setUser ----------------
  void setUser(UserModel value) {
    user.value = value;
  }

  // removeUser ----------------
  void removeUser() {
    user.value = null;
  }

  // updateUser ----------------
  void updateUser({
    required String name,
    required String email,
  }) {
    user.value = user.value?.copyWith(
      name: name,
      email: email,
    );
  }
}
