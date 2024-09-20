import 'package:flutter/material.dart';
import 'package:tproject/common/layouts/base.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      child: Center(child: Text('Home')),
    );
  }
}
