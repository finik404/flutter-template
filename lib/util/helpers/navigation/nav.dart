import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

void nav(BuildContext context, Widget screen, {bool withNavBar = true, Object? args, PageTransitionAnimation? animation}) => pushScreen(
      context,
      screen: screen,
      settings: RouteSettings(arguments: args),
      withNavBar: withNavBar,
      pageTransitionAnimation: animation ?? PageTransitionAnimation.cupertino,
    );
