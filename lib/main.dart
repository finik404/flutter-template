import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/app.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/helpers/device.dart';
import 'package:tproject/util/helpers/network/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only vertical device orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Local storage
  await GetStorage.init();

  // Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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

  // runApp
  runApp(const App());

  // Network checker
  NetworkBinding.init();
}
