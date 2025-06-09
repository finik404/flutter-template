import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tproject/app.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/private.dart';
import 'package:tproject/util/helpers/device.dart';
import 'package:tproject/util/helpers/network/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only vertical device orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // StatusBar and navigationBar colors
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: TDevice.isIOS() ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: TDevice.isIOS() ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: TColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Local storage
  await GetStorage.init();

  // Check is real device
  final isSimulator = await TDevice.isSimulator();
  final isIOSSimulator = await TDevice.isIOSSimulator();

  // FCM
  if (!isIOSSimulator) {
    // await PushNotificationHelper.initialized();
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  // AppMetrica
  // await AppMetrica.activate(const AppMetricaConfig(TPrivates.appMetricaKey));

  true ?? isSimulator
      // runApp
      ? runApp(const App())

      // Error tracking
      : SentryFlutter.init(
          (options) {
            options.dsn = TPrivates.bugTrackerDsn;
            options.environment = 'production';
            options.tracesSampleRate = 1.0;
          },
          appRunner: () => runApp(const App()),
        );

  // Network checker
  NetworkBinding.init();
}
