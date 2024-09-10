import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wordwise/core/_exports.dart';

/*
  AuthLogo Component ----------------
 */
class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Hero(
            tag: 'logo',
            child: Stack(clipBehavior: Clip.none, children: [
              Padding(
                  padding: const EdgeInsets.only(left: 76, top: 45),
                  child: SvgPicture.asset('assets/img/logo_text.svg', color: context.primaryColor, height: 30)),
              Positioned(
                left: -13,
                child: SvgPicture.asset(Colors, color: context.primaryColor, height: 80),
              ),
            ])),
      ),
      const SizedBox(height: 80),
    ]);
  }
}
