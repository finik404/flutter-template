import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/features/auth/controllers/screens/password.dart';
import 'package:tproject/features/auth/layouts/auth.dart';
import 'package:tproject/util/constants/sizes.dart';
import 'package:tproject/util/validator/rules.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordController());

    return AuthLayout(
      // Header
      title: 'Восстановление доступа',

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
              type: TextInputType.emailAddress,
              validate: [VRules.required(), VRules.email()],
              autofocus: true,
              onSubmit: controller.receive,
            ),
            const SizedBox(height: 16),

            // Submit button
            UIButton('Сбросить пароль', controller.receive),
          ],
        ),
      ),
    );
  }
}
