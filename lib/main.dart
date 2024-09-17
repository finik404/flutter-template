import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tproject/app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'util/http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Local storage
  await GetStorage.init();

  // Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // runApp
  runApp(const App());
}
