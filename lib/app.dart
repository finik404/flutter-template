import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

/*
  App ----------------
 */
class App extends StatelessWidget {
  const App({super.key});

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // No debug banner
      debugShowCheckedModeBanner: false,
      // No Stretch effect on scroll
      scrollBehavior: CustomScrollBehavior(),

      // Theme settings
      theme: ,
    );
  }
}
