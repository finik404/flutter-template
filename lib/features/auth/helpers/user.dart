import 'package:tproject/features/auth/controllers/user.dart';
import 'package:tproject/features/auth/models/user.dart';

class UserHelper {
  static bool get hasUser => UserController.instance.user.value != null;

  static UserModel? get user => UserController.instance.user.value;

  static int? get userId => UserController.instance.user.value?.id;
}
