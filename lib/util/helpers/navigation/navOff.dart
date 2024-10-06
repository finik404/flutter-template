import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

void navOff(BuildContext context, Widget screen, {bool withNavBar = true}) {
  if (withNavBar) {
    pushReplacementWithNavBar(context, MaterialPageRoute(builder: (context) => screen));
  } else {
    pushReplacementWithoutNavBar(context, MaterialPageRoute(builder: (context) => screen));
  }
}
