import 'package:tproject/util/exports.dart';
import 'package:tproject/util/helpers/checkUpdate.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // # --------------- Variables --------------- #

  // # --------------- onReady --------------- #

  @override
  void onReady() {
    super.onReady();
    checkUpdate();
  }

// # --------------- Methods --------------- #
}
