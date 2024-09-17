import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tproject/features/splash/screens/splash.dart';
import 'package:tproject/util/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // No debug banner
      debugShowCheckedModeBanner: false,

      // Theme settings
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,

      // Home screen
      home: const Splash(),
    );
  }
}