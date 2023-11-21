import 'package:flutter/material.dart';
import 'package:template/components/UI/Text.dart';

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
    return const Scaffold(
      body: Center(
        child: CText('Home Screen'),
      ),
    );
  }
}
