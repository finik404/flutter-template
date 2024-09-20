import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tproject/util/constants/colors.dart';

import 'util/http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Local storage
  await GetStorage.init();

  // Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // StatusBar and navigationBar colors
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: TColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // runApp
  runApp(const App());
}
