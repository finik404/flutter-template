import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tproject/features/home/screens/home.dart';
import 'package:tproject/features/tabs/models/item.dart';

class TabsController extends GetxController {
  static TabsController get instance => Get.find();

  // # --------------- Variables --------------- #

  final PersistentTabController controller = PersistentTabController();
  Rx<int> activeTab = 0.obs;
  List<TabNavModel> navItems = [
    TabNavModel('Заказы', FontAwesomeIcons.cartShopping, const HomeScreen()),
    TabNavModel('Товары', FontAwesomeIcons.boxesStacked, const HomeScreen()),
    TabNavModel('Клиенты', FontAwesomeIcons.solidUser, const HomeScreen()),
    TabNavModel('Меню', FontAwesomeIcons.bars, const HomeScreen()),
  ];

  // # --------------- Methods --------------- #

  // changeTab ----------------
  void changeTab(int index) {
    activeTab.value = index;
  }

  // navToTab ----------------
  void navToTab(int index) {
    activeTab.value = index;
    controller.jumpToTab(index);
  }
}
