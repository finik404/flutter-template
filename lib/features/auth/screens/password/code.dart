import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/exports.dart';
import 'package:tproject/features/auth/controllers/screens/code.dart';
import 'package:tproject/features/auth/layouts/auth.dart';
import 'package:tproject/features/auth/widgets/InputCode.dart';
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

      // Content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Code
          const InputCode(),

          // Errors
          Obx(() {
            return controller.codeErrors.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: UIText(controller.codeErrors.value, color: TColors.error, size: 12),
                  )
                : Container();
          }),
          const SizedBox(height: 16),

          // Submit button
          Obx(
            () => UIDisabled(
              controller.isLoading.value,
              child: UIButton('Продолжить', controller.check),
            ),
          ),
        ],
      ),
    );
  }
}
