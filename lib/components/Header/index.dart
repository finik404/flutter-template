import 'package:flutter/material.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/colors.dart';

/*
  Header Component ----------------
 */
class Header extends StatelessWidget {
  // Variables ----------------

  // Props ----------------
  const Header({
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      color: AppColors.bg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [CText('Header')],
      ),
    );
  }
}
