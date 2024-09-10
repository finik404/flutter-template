import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wordwise/core/_exports.dart';
import 'package:wordwise/features/auth/layouts/_index.dart';
import 'package:wordwise/hooks/SocialAuthService.dart';

/*
  Login Layout ----------------
 */
class LoginLayout extends StatelessWidget {
  // Variables ----------------
  final Widget child;
  final String label;
  final String text;
  final bool? isAuth;
  final double? labelWidth;
  final double? textWidth;

  // Props ----------------
  const LoginLayout({
    super.key,
    required this.label,
    required this.text,
    required this.child,
    this.isAuth,
    this.labelWidth,
    this.textWidth,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      label: label,
      text: text,
      isAuth: isAuth,
      labelWidth: labelWidth,
      textWidth: textWidth,
      children: [
        // Content
        child,

        // Google btn
        const SizedBox(height: 14),
        Center(child: CText(S.of(context).or, size: 14, color: context.textColor)),
        const SizedBox(height: 14),
        Btn(
          S.of(context).google_sign_in,
          () => loginWithGoogle(context),
          bg: context.theme.primaryContainer,
          textColor: context.theme.primary,
          iconWidget: Container(
              margin: const EdgeInsets.only(right: 12),
              child: SvgPicture.asset('assets/icons/google.svg', color: context.theme.primary, width: 17, height: 17)),
        ),
      ],
    );
  }

  // Methods ----------------
  Future<void> loginWithGoogle(BuildContext context) async {
    try {
      final user = await SocialAuthService.loginWithGoogle();
      if (user != null) {
        print('user ${user.toString()}');
      }
    } on FirebaseAuthException catch (error) {
      print(error.message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message ?? 'Something wrong')));
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }
}
