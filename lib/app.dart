import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tproject/features/splash/screens/splash.dart';
import 'package:tproject/generated/l10n.dart';
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

      // Localization
      locale: const Locale('ru'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Languages
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
        Locale('kz'),
      ],

      // Home screen
      home: const Splash(),
    );
  }
}
