import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/layouts/base.dart';
import 'package:tproject/features/splash/controllers/splash.dart';
import 'package:tproject/util/constants/images.dart';
import 'package:tproject/util/extensions/media.dart';
import 'package:tproject/util/extensions/theme.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return BaseLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(TImages.appIcon, width: context.screenWidth * 0.4),
            SizedBox(height: context.screenHeight * 0.07),
            SizedBox(height: 30, width: 30, child: CircularProgressIndicator(color: context.primaryColor, strokeWidth: 2)),
          ],
        ),
      ),
    );
  }
}
