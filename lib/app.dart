import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tproject/features/splash/screens/splash.dart';
// import 'package:tproject/generated/l10n.dart';
import 'package:tproject/util/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

      // Localization
      locale: const Locale('en', 'US'),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Languages
      supportedLocales: const [
        Locale('en', 'US'),
        // Locale('ru'),
        // Locale('kz'),
      ],

      // Home screen
      home: const Splash(),
    );
  }
}
