import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/common/widgets/Skeleton.dart';
import 'package:tproject/common/widgets/Text/HTML.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/common/widgets/Text/TextLink.dart';
import 'package:tproject/features/auth/controllers/login.dart';
import 'package:tproject/features/auth/layouts/auth.dart';
import 'package:tproject/features/auth/screens/password/password.dart';
import 'package:tproject/util/helpers/helper.dart';
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

              // Forgot password link
              UITextLink('Забыли пароль?', onTap: () => Get.to(const PasswordScreen())),
              const SizedBox(height: 30),

              // Submit button
              // UIButton('Войти', () => controller.onLogin()),
              
              // UIHtml( "<p>\r\n\t Дорогие клиенты! Декабрь — идеальное время для обновления вашей ванной комнаты или кухни с нашими потрясающими <a href=\'https://chatgpt.com\'>предложениями</a> на сантехнику!\r\n</p>\r\n<p>\r\n\t ???? Специальные скидки на смесители, душевые системы и санфаянс! ???? Бесплатная доставка и монтаж при покупке сантехники! ???? Подарки к каждому заказу — дарим практичные аксессуары для ванной!\r\n</p>\r\n<p>\r\n\t Не упустите шанс обновить интерьер своего дома и добавить в него удобство и стиль! Посетите наши магазины или оформите заказ онлайн уже сегодня!\r\n</p>\r\n<p>\r\n\t Сделайте ваш декабрь ярким и комфортным с нашей сантехникой от [название вашей компании]! Акция действует только до конца месяца!\r\n</p>\r\n<p>\r\n <br>\r\n</p>\r\n<p>\r\n\t Спешите — предложение ограничено! Создайте уют и функциональность в вашем доме вместе с нами!\r\n</p>"),
            ],
          ),
        ),
      ],
    );
  }
}
