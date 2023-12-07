import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  Main Layout ----------------
 */
class MainLayout extends StatelessWidget {
  // Variables ----------------
  final Widget content;
  final Color bg;
  final EdgeInsets? padding;

  // Props ----------------
  const MainLayout(
    this.content, {
    Key? key,
    this.bg = AppColors.white,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: padding == null
            ? content
            : Padding(
                padding: padding!,
                child: content,
              ),
      ),
    );
  }
}
