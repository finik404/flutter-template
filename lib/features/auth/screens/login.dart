import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/features/auth/controllers/login.dart';
import 'package:tproject/features/auth/layouts/auth.dart';
import 'package:tproject/features/auth/screens/password/password.dart';

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
                validate: const [VRules.required, VRules.email],
                type: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Password input
              UIInput(
                'Пароль',
                controller.passwordInput,
                validate: [VRules.required, VRules.min(6)],
                maxLength: 10,
              ),
              const SizedBox(height: 12),

              // Forgot password link
              UITextLink('Забыли пароль?', onTap: () => Get.to(const PasswordScreen())),
              const SizedBox(height: 30),

              // Submit button
              UIButton('Войти', controller.onLogin),
            ],
          ),
        ),
      ],
    );
  }
}
