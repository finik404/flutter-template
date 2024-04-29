import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  Icon Component ----------------
 */
class CIcon extends StatelessWidget {
  // Variables ----------------
  final String code;
  final double? size;
  final Color? color;

  // Props ----------------
  const CIcon(
    this.code, {
    this.size,
    this.color,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(int.parse('0x$code'), fontFamily: 'FontAwesome'),
      size: size ?? 22,
      color: color ?? AppColors.black,
    );
  }
}
