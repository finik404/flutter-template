import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  Balance Component ----------------
 */
class Balance extends StatelessWidget {
  // Variables ----------------
  final String amount;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final double? height;

  // Props ----------------
  const Balance(
    this.amount, {
    this.size = 16,
    this.weight = FontWeight.normal,
    this.color = AppColors.black,
    this.height,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    String currency = '';
    String value = '';

    if (amount.isNotEmpty) {
      currency = amount.substring(amount.length - 1);
      value = amount.substring(0, amount.length - 1);
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontFamily: 'Circe',
        ),
        children: [
          TextSpan(
              text: value,
              style: TextStyle(
                fontSize: size,
                color: color,
                fontWeight: weight,
                fontFamily: 'Circe',
                height: height,
              )),
          TextSpan(
            text: currency,
            style: TextStyle(
              fontSize: size,
              color: color,
              height: height,
              fontWeight: weight,
              fontFamily: Theme.of(context).platform == TargetPlatform.iOS
                  ? '.SF UI Display'
                  : 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}