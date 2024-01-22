import 'package:flutter/material.dart';
import 'package:template/components/UI/Icon.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/colors.dart';

/*
  Warning Component ----------------
 */
class Warning extends StatelessWidget {
  // Variables ----------------
  final List<String>? items;
  final String? text;

  // Props ----------------
  const Warning({
    this.items,
    this.text,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
            color: AppColors.red, borderRadius: BorderRadius.circular(4)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              children: [
                SizedBox(height: 4),
                CIcon('f321', color: AppColors.red),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: items != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items!
                          .map((item) => CText(item, color: AppColors.red))
                          .toList())
                  : CText(text!),
            ),
          ],
        ));
  }
}
