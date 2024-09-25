import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tproject/common/layouts/base.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/features/home/screens/home/home.dart';
import 'package:tproject/features/tabs/controllers/tabs.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabsController());
    final List<Widget> screens = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];

    // TabItem
    PersistentTabConfig tabItem(String icon, String label, int index, {int? count}) => PersistentTabConfig(
          screen: screens[index],
          item: ItemConfig(
            inactiveForegroundColor: context.theme.colorScheme.primary,
            activeForegroundColor: context.theme.primaryColor,

            // Icon
            icon: Obx(
              () => UIIcon(
                icon,
                size: 18,
                color: controller.activeTab.value == index ? context.theme.primaryColor : context.theme.colorScheme.primary,
              ),
            ),

            // Label
            title: label,
            textStyle: const TextStyle(fontSize: 14),
          ),
        );

    return BaseLayout(
      padding: EdgeInsets.zero,
      child: PersistentTabView(
        // Controller
        controller: controller.controller,

        // Tabs
        tabs: [
          tabItem(TIcons.home, 'Главная', 0),
          tabItem(TIcons.cart, 'Корзина', 1),
          tabItem(TIcons.user, 'Профиль', 2),
          tabItem(TIcons.menu, 'Меню', 3),
        ],

        // onChange
        onTabChanged: (index) => controller.changeTab(index),

        // Options
        navBarHeight: 65,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        screenTransitionAnimation: const ScreenTransitionAnimation(curve: Curves.ease, duration: Duration(milliseconds: 200)),

        // Styles
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: const NavBarDecoration(
            color: TColors.bottomSheet,
            padding: EdgeInsets.all(12),
            border: Border(top: BorderSide(color: TColors.bottomSheetBorder)),
          ),
        ),
      ),
    );
  }
}
