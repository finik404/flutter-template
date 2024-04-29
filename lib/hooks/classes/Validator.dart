import 'package:flutter/material.dart';
import 'package:template/generated/l10n.dart';

/*
  Хук для валидации значений ----------------
 */
class Validator {
  // Схема (required)
  static String? required(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).errors_required;
    }
    return null;
  }

  // Схема (min)
  static String? min(BuildContext context, String? value, int length) {
    if (value == null || value.isEmpty) {
      return S.of(context).errors_required;
    } else if (value.length < length) {
      return S.of(context).errors_min(length);
    }
    return null;
  }

  // Схема (max)
  static String? max(BuildContext context, String? value, int length) {
    if (value != null && value.length > length) {
      return S.of(context).errors_max(length);
    }
    return null;
  }

  // Схема (email)
  static String? email(BuildContext context, String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (value == null || !regex.hasMatch(value)) {
      return S.of(context).errors_email;
    }
    return null;
  }

  // Схема (маска телефона)
  static String? phone(BuildContext context, String? value) {
    Pattern pattern = r'^\+7 \d{3} \d{3} \d{2} \d{2}$';
    RegExp regex = RegExp(pattern.toString());
    if (value == '') {
      return null;
    }
    if (!regex.hasMatch(value!)) {
      return S.of(context).errors_phone;
    }
    return null;
  }

  /*
    Функция комбинирования разных схем ----------------
   */
  static FormFieldValidator<String> validate(BuildContext context,
      List<String? Function(BuildContext, String?)> validators) {
    return (String? value) {
      for (var validator in validators) {
        var result = validator(context, value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}
