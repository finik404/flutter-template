import 'package:flutter/material.dart';
import 'package:template/components/UI/Text.dart';
import 'package:template/layouts/main.dart';

/*
  Home Screen ----------------
 */
class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

/*
  State Component ----------------
 */
class HomeScreenState extends State<HomeScreen> {
  // Variables ----------------

  // Builder ----------------
  Widget build(BuildContext context) {
    return MainLayout(
      Center(
        child: CText('Home Screen'),
      ),
    );
  }
}
