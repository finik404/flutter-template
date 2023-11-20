import 'package:flutter/material.dart';
import 'package:flutter_letmetalk/constants/colors.dart';

/*
  Loading Screen ----------------
 */
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.blue,
        ),
      ),
    );
    ;
  }
}
