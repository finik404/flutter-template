import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_letmetalk/components/UI/Text.dart';
import 'package:flutter_letmetalk/constants/colors.dart';


/*
  Auth Layout ----------------
 */
class AuthLayout extends StatelessWidget {
  // Variables ----------------
  final Widget child;
  final List<Widget> text;

  // Props ----------------
  const AuthLayout(
    this.child, {
    required this.text,
    Key? key,
  }) : super(key: key);


  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CText(
              'LetMeTalk',
              size: 46,
              weight: FontWeight.bold,
              color: AppColors.blue,
            ),
            const SizedBox(height: 10),

            // Text Content
            Row(mainAxisAlignment: MainAxisAlignment.center, children: text),
            const SizedBox(height: 25),

            // Child --------------
            Container(child: child),
          ]),
        ),
      ),
    );
  }
}
