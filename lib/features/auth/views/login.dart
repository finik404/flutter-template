import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/features/auth/controllers/login.dart';
import 'package:tproject/features/auth/layouts/auth.dart';
import 'package:tproject/util/validators/validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return AuthLayout(
      label: 'Авторизация',

      // Content
      children: [
        Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email input
              UIInput(
                'Email',
                controller.emailInput,
                validate: const [TValidator.required, TValidator.email],
              ),
              const SizedBox(height: 20),

              // Password input
              UIInput(
                'Пароль',
                controller.passwordInput,
                validate: [TValidator.required, TValidator.min(6), TValidator.max(60)],
              ),
              const SizedBox(height: 12),

              // // Forgot password
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //   const SizedBox(),
              //   TextLink(S.of(context).forgot_password,
              //       size: 14, color: context.theme.secondary, onTap: () => navigate(context, const ResetScreen())),
              // ]),
              // const SizedBox(height: 30),

              // Submit button
              UIButton('submit', () => controller.onLogin())
            ],
          ),
        ),
      ],
    );
  }
}
