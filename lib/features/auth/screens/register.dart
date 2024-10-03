import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/features/auth/controllers/screens/register.dart';
import 'package:tproject/features/auth/layouts/auth.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return AuthLayout(
      // Header
      title: 'Регистрация',
      text: 'Создайте аккаунт',

      // Content
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name input
            UIInput(
              'Имя',
              controller.nameInput,
              validate: [VRules.required(), VRules.max(25)],
            ),
            const SizedBox(height: 12),

            // Email input
            UIInput(
              'Email',
              controller.emailInput,
              type: TextInputType.emailAddress,
              validate: [VRules.required(), VRules.email()],
            ),
            const SizedBox(height: 12),

            // Password input
            UIInput(
              'Пароль',
              controller.passwordInput,
              isPassword: true,
              validate: [
                VRules.required(),
                VRules.min(6),
                VRules.max(70),
              ],
            ),
            const SizedBox(height: 24),

            // Submit button
            UIButton('Создать аккаунт', controller.register),
          ],
        ),
      ),
    );
  }
}
