import 'package:flutter/material.dart';
import 'package:talktime/config/constants/colors.dart';
import 'package:talktime/core/extensions/theme.dart';

/*
  Refresh Component ----------------
 */
class Refresh extends StatelessWidget {
  // Variables ----------------
  final Widget child;
  final Function() onRefresh;

  // Props ----------------
  const Refresh({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await onRefresh();
      },
      color: context.primaryColor,
      backgroundColor: AppColors.white,
      child: child,
    );
  }
}
