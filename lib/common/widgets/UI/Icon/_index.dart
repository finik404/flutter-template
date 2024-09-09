import 'package:flutter/material.dart';
import 'package:talktime/config/constants/colors.dart';

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
    super.key,
    this.size,
    this.color,
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
