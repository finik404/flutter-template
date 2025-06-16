// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get error => 'Ошибка';

  @override
  String get errors_required => 'Это поле не может быть пустым';

  @override
  String get errors_email => 'Некоректная электронная почта';

  @override
  String errors_min(Object length) {
    return 'Поле должно быть не менее $length символов';
  }

  @override
  String errors_max(Object length) {
    return 'Поле не может быть более $length символов';
  }

  @override
  String get errors_password_confirm => 'Пароли не совпадают';

  @override
  String get errors_password_required => 'Введите пароль';

  @override
  String errors_password_min(Object length) {
    return 'Пароль должен содержать минимум $length символов';
  }

  @override
  String errors_password_max(Object length) {
    return 'Пароль не должен превышать $length символов';
  }

  @override
  String get errors_password_digit => 'Пароль должен содержать хотя бы одну цифру';

  @override
  String get errors_password_letter => 'Пароль должен содержать хотя бы одну строчную букву';

  @override
  String get errors_password_upper_letter => 'Пароль должен содержать хотя бы одну заглавную букву';

  @override
  String get errors_password_symbol => 'Пароль должен содержать хотя бы один специальный символ';

  @override
  String get errors_email_unique => 'Данная почта уже используется';

  @override
  String get errors_auth => 'Неверная почта или пароль';

  @override
  String errors_image_size(Object size) {
    return 'Размер файла не должен превышать $size мб';
  }

  @override
  String get errors_image_type => 'Недопустимый формат изображения. Допустимые форматы: PNG, JPEG, JPG';

  @override
  String get errors_network => 'Нет подключения к интернету';

  @override
  String get errors_network_text => 'Пожалуйста, проверьте ваше интернет-соединение и попробуйте снова';

  @override
  String get errors_code => 'Введите код восстановелния';

  @override
  String get errors_code_length => 'Код должен быть 4-значным';

  @override
  String get errors_auth_code => 'Неверный код восстановления';

  @override
  String get errors_phone => 'Неверный формат номера телефона';
}
