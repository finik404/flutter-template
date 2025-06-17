import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/common/layouts/main/main.dart';
import 'package:tproject/features/home/controllers/home.dart';
import 'package:tproject/util/helpers/dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return MainLayout(
      label: 'Home',
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        UIButton('label', () => TDialog.showConfirm('title')),
        UIButton('label', () => TDialog.showConfirm('title', text: 'text'))

      ]),
    );
  }
}
