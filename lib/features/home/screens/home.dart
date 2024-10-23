import 'package:flutter/material.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      label: 'Home',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: []),
    );
  }
}
