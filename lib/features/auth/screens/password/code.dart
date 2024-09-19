import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/features/auth/controllers/code.dart';
import 'package:tproject/features/auth/layouts/auth.dart';
import 'package:tproject/util/helpers/helper.dart';

class PasswordCodeScreen extends StatelessWidget {
  final String email;

  const PasswordCodeScreen({
    super.key,
    required this.email,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CodeController());

    return AuthLayout(
      // Header
      title: 'Восстановление',
      text: 'В течение 10 минут вы получите письмо с кодом на почту ${THelper.hideEmail(email)}. Введите код в поле ниже для восстановления доступа',

      // Errors
      errors: controller.errors,

      // Content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Code
          // InputCode(change: (value) => setState(() => code = value), submit: controller.check),

          // Errors
          if (controller.error.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: UIText(controller.error, color: Colors.redAccent, size: 12))
              ],
            ),
          const SizedBox(height: 30),

          // Submit button
          UIButton('Продолжить', controller.check),
        ],
      ),
    );
  }
}
