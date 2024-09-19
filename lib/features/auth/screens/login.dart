import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/features/auth/controllers/login.dart';
import 'package:tproject/features/auth/layouts/auth.dart';
import 'package:tproject/features/auth/screens/password/password.dart';
import 'package:tproject/features/auth/screens/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return AuthLayout(
      title: 'Войти в аккаунт',
      textWidget: UITexts(
        [
          TextModel('Авторизуйтесь или '),
          TextModel(
            'cоздайте аккаунт',
            onTap: () => Get.to(const RegisterScreen()),
          ),
        ],
        size: 18,
      ),

      // Content
      child: Form(
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
            ),
            const SizedBox(height: 12),

            // Forgot password link
            UITextLink('Забыли пароль?', onTap: () => Get.to(const PasswordScreen())),
            const SizedBox(height: 30),

            // Submit button
            UIButton('Войти', controller.onLogin),

            const SizedBox(height: 25),

            UISelect(
              controller.select,
              (value) => controller.select = value,
              items: controller.selectItems,
            ),
          ],
        ),
      ),
    );
  }
}
