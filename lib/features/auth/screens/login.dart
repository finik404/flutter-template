import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/common/widgets/Dialogs/ActionMenu.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/common/widgets/Inputs/PhoneInput.dart';
import 'package:tproject/common/widgets/Inputs/SearchInput.dart';
import 'package:tproject/common/widgets/Inputs/Textarea.dart';
import 'package:tproject/common/widgets/Text/TextLink.dart';
import 'package:tproject/features/auth/controllers/login.dart';
import 'package:tproject/features/auth/layouts/auth.dart';
import 'package:tproject/features/auth/screens/password/password.dart';
import 'package:tproject/generated/l10n.dart';
import 'package:tproject/util/constants/icons.dart';
import 'package:tproject/util/helpers/dialog.dart';
import 'package:tproject/util/validators/rules.dart';

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
              UIButton('Войти', () => TDialog.showActionMenu(actions:
              [
              ActionModel(label: 'Action 1', icon: TIcons.reset, onTap: () => null),
              ]),),

              const SizedBox(height: 25),
              UITextArea(
                'Сообщение',
                controller.passwordInput,
              ),

              const SizedBox(height: 25),

              UIPhoneInput(
                'phone',
                controller.phoneInput,
              ),

              // UIHtml( "<p>\r\n\t Дорогие клиенты! Декабрь — идеальное время для обновления вашей ванной комнаты или кухни с нашими потрясающими <a href=\'https://chatgpt.com\'>предложениями</a> на сантехнику!\r\n</p>\r\n<p>\r\n\t ???? Специальные скидки на смесители, душевые системы и санфаянс! ???? Бесплатная доставка и монтаж при покупке сантехники! ???? Подарки к каждому заказу — дарим практичные аксессуары для ванной!\r\n</p>\r\n<p>\r\n\t Не упустите шанс обновить интерьер своего дома и добавить в него удобство и стиль! Посетите наши магазины или оформите заказ онлайн уже сегодня!\r\n</p>\r\n<p>\r\n\t Сделайте ваш декабрь ярким и комфортным с нашей сантехникой от [название вашей компании]! Акция действует только до конца месяца!\r\n</p>\r\n<p>\r\n <br>\r\n</p>\r\n<p>\r\n\t Спешите — предложение ограничено! Создайте уют и функциональность в вашем доме вместе с нами!\r\n</p>"),
            ],
          ),
        ),
      ],
    );
  }
}
