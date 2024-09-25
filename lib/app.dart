import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tproject/features/splash/screens/splash.dart';
import 'package:tproject/languages/languages.dart';
import 'package:tproject/util/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // No debug banner
      debugShowCheckedModeBanner: false,

      // No Stretch Effect on Scroll
      scrollBehavior: CustomScrollBehavior(),

      // Theme settings
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,

      // Localization
      locale: const Locale('ru'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: Languages.all,

      // Home screen
      home: const Splash(),
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
