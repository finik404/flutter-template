import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  Refresh Component ----------------
 */
class Refresh extends StatelessWidget {
  // Variables ----------------
  final Widget child;
  final Function() onRefresh;

  // Props ----------------
  const Refresh({
    required this.child,
    required this.onRefresh,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(),
      color: AppColors.blue,
      child: child,
    );
  }
}
