import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tproject/common/layouts/base.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/features/tabs/controllers/tabs.dart';
import 'package:tproject/util/constants/colors.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabsController());

    return BaseLayout(
      padding: EdgeInsets.zero,
      child: PersistentTabView(
        // Controller
        controller: controller.controller,

        // Tabs
        tabs: [
          for (int i = 0; i < controller.navItems.length; i++)
            PersistentTabConfig(
              screen: controller.navItems[i].screen,
              item: ItemConfig(
                inactiveForegroundColor: context.theme.colorScheme.primary,
                activeForegroundColor: context.theme.primaryColor,

                // Icon
                icon: Obx(
                  () => UIIcon(
                    controller.navItems[i].icon,
                    size: 18,
                    color: controller.activeTab.value == i ? context.theme.primaryColor : context.theme.colorScheme.primary,
                  ),
                ),

                // Label
                title: controller.navItems[i].label,
                textStyle: const TextStyle(fontSize: 14),
              ),
            ),
        ],

        // onChange
        onTabChanged: (index) => controller.changeTab(index),

        // Options
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        screenTransitionAnimation: const ScreenTransitionAnimation(curve: Curves.ease, duration: Duration(milliseconds: 200)),

        // Styles
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          height: 67,
          navBarConfig: navBarConfig,
          navBarDecoration: const NavBarDecoration(
            color: TColors.bg,
            padding: EdgeInsets.all(12),
            border: Border(top: BorderSide(color: TColors.bottomSheetBorder)),
          ),
        ),
      ),
    );
  }
}
