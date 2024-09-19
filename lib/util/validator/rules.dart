import 'package:flutter/cupertino.dart';

class VRules {
  VRules._();

  // Required
  static Function(String?) required({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return message ?? "Это поле не может быть пустым";
      }
      return null;
    };
  }

  // Min
  static Function(String?) min(int length, {String? message}) {
    return (String? value) {
      if (value != null && value.length < length) {
        return message ?? "Поле должно быть не менее $length символов";
      }
      return null;
    };
  }

  // Max
  static Function(String?) max(int length, {String? message}) {
    return (String? value) {
      if (value != null && value.length > length) {
        return message ?? "Поле не может быть более $length символов";
      }
      return null;
    };
  }

  // Email
  static Function(String?) email({String? message}) {
    return (String? value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern.toString());
      if (value == null || !regex.hasMatch(value)) {
        return message ?? "Некорректный адрес электронной почты";
      }
      return null;
    };
  }

  // Password
  static Function(String?) password({
    bool required = true,
    bool requireDigits = true,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireSpecialCharacter = true,
    int? min = 8,
    int? max,
  }) {
    return (String? value) {
      if (value != null) {
        if (required || value.trim().isEmpty) {
          return "Пароль не может быть пустым";
        }
        if (min != null && value.trim().length < min) {
          return "Пароль должен содержать минимум $min символов";
        }
        if (max != null && value.trim().length > max) {
          return "Пароль не должен превышать $max символов";
        }
        if (requireDigits && !value.trim().contains(RegExp(r'[0-9]'))) {
          return "Пароль должен содержать хотя бы одну цифру";
        }
        if (requireUppercase && !value.trim().contains(RegExp(r'[A-Z]'))) {
          return "Пароль должен содержать хотя бы одну заглавную букву";
        }
        if (requireLowercase && !value.trim().contains(RegExp(r'[a-z]'))) {
          return "Пароль должен содержать хотя бы одну строчную букву";
        }
        if (requireSpecialCharacter && !value.trim().contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          return "Пароль должен содержать хотя бы один специальный символ";
        }
      }
      return null;
    };
  }

  static Function(String?) confirmPassword(TextEditingController password, {String? message}) {
    return (String? value) {
      if (value != null && value.trim() != password.text) {
        return message ?? "Пароли не совпадают";
      }
      return null;
    };
  }
}
