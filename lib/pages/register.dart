import 'dart:io';

import 'package:flutter/material.dart';
import 'package:template/components/UI/Btn.dart';
import 'package:template/components/UI/Input.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/components/UI/TextLink.dart';
import 'package:template/constants/colors.dart';
import 'package:template/hooks/useFetch.dart';
import 'package:template/hooks/Validator.dart';
import 'package:template/layouts/auth.dart';
import 'package:template/pages/loading.dart';
import 'package:template/store/slices/account.dart';
import 'package:template/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
  Register Screen ----------------
 */
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

/*
  State Screen ----------------
 */
class RegisterScreenState extends State<RegisterScreen> {
  // Variables ----------------
  final TextEditingController nameValue = TextEditingController();
  final TextEditingController emailValue = TextEditingController();
  final TextEditingController passwordValue = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    checkAuth();
  }

  /*
    Methods ----------------
   */
  // Проверка аутенцикации пользователя
  void checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final store = StoreProvider.of<AppState>(context);

    // Проверка аунтефикации пользователя
    final data = await useFetch('/account');

    // Проверка настроек приложения
    final lang = prefs.getString('lang');

    // Установить настройки приложения
    if (lang != null) {
      store.dispatch(ChangeLang(lang == 'ru' ? Locale('ru') : Locale('en')));
    }

    // Если пользователь в первый раз, то получить язык системы
    if (lang == null) {
      String systemLanguage = Platform.localeName;

      systemLanguage == 'ru_RU'
          ? store.dispatch(ChangeLang(Locale('ru')))
          : store.dispatch(ChangeLang(Locale('en')));
    }

    if (data != null) {
      // Убрать загрузку
      setState(() {
        isLoading = false;
      });

      // Сохранить данные пользователя в хранилище
      store.dispatch(AddUserData(data));

      // Перенаправить пользователя
      await Navigator.pushNamed(context, '/home');
    } else {
      // Убрать загрузку
      setState(() {
        isLoading = false;
      });
    }
  }

  // Регистрация пользователя
  void onRegister(BuildContext context) async {
    // Проверка валидации формы
    if (formKey.currentState!.validate()) {
      // Dto
      final dto = {
        'first_name': nameValue.text,
        'email': emailValue.text,
        'password': passwordValue.text,
      };

      try {
        // Отправляем запрос
        final data = await useFetch('/account/register',
            method: 'POST', body: dto, context: context);

        // Сохраняем токен авторизации
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', data['token']);

        // Сохраняем данные пользователя в хранилище
        final store = StoreProvider.of<AppState>(context);
        store.dispatch(AddUserData(data));

        // Перенаправляем пользователя
        Navigator.pushNamed(context, '/home');
      } catch (err) {
        // Сохраняем ошибки
        setState(() {
          error = err.toString();
        });
      }
    }
  }

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    // Если загрузка
    if (isLoading) {
      return const LoadingScreen();
    }

    // Если нет загрузки
    else {
      return AuthLayout(
          Form(
            key: formKey,
            child: Column(
              children: [
                // Ошибки запроса
                if (error.isNotEmpty)
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: CText(
                      error,
                      size: 14,
                      color: AppColors.red,
                    ),
                  ),
                Input('Имя', nameValue,
                    validator: (value) => Validator.required(context, value)),
                const SizedBox(height: 15),
                Input(
                  'E-mail',
                  emailValue,
                  textType: TextInputType.emailAddress,
                  validator: Validator.validate(context, [
                    Validator.required,
                    Validator.email,
                  ]),
                ),
                const SizedBox(height: 15),
                Input(
                  'Пароль',
                  passwordValue,
                  type: InputType.password,
                  validator: (value) => Validator.min(context, value, 6),
                ),
                const TextLink('У меня уже есть аккаунт', link: '/login'),
                const SizedBox(height: 25),
                Btn('Зарегистрироваться', () => onRegister(context)),
              ],
            ),
          ),
          text: const [
            CText(
              'Создать аккаунт',
              size: 20,
            )
          ]);
    }
  }

  // Dispose ----------------
  @override
  void dispose() {
    nameValue.dispose();
    emailValue.dispose();
    passwordValue.dispose();
    super.dispose();
  }
}
