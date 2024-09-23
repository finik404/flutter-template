import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/helpers/device.dart';

class TabsController extends GetxController {
  static TabsController get instance => Get.find();

  // Variables ----------------
  final PersistentTabController controller = PersistentTabController();
  Rx<int> activeTab = 0.obs;

  // onReady ----------------
  @override
  void onReady() {
    super.onReady();
    TDevice.setBottomNavigationColor(TColors.bottomSheet);
  }

  // Methods ----------------
  void changeTab(int index) {
    activeTab.value = index;
  }
}
