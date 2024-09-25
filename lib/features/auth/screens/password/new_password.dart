import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/features/auth/controllers/screens/new_password.dart';
import 'package:tproject/features/auth/layouts/auth.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({
    super.key,
    required this.code,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewPasswordController());

    return AuthLayout(
      // Header
      title: 'Восстановление',
      text: 'Введите новый пароль, он должен состоять минимум из 6 символов',

      // Content
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Password input
            UIInput(
              'Новый пароль',
              controller.passwordInput,
              isPassword: true,
              validate: [
                VRules.required(),
                VRules.min(6),
                VRules.max(70),
              ],
            ),
            const SizedBox(height: TSizes.spaceSm),

            // Repeat password input
            UIInput(
              'Повторите пароль',
              controller.repeatPasswordInput,
              isPassword: true,
              validate: [
                VRules.required(),
                VRules.confirmPassword(controller.repeatPasswordInput),
              ],
            ),
            const SizedBox(height: TSizes.spaceMd),

            // Submit button
            UIButton('Войти с новым паролем', controller.restore),
          ],
        ),
      ),
    );
  }
}
