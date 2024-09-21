import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:tproject/generated/l10n.dart';

class VRules {
  VRules._();

  // Required
  static Function(String?) required({String? message}) {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        // return message ?? S.of(Get.context!).errors_required;
      }
      return null;
    };
  }

  // Min
  static Function(String?) min(int length, {String? message}) {
    return (String? value) {
      if (value != null && value.length < length) {
        // return message ?? S.of(Get.context!).errors_min(length);
      }
      return null;
    };
  }

  // Max
  static Function(String?) max(int length, {String? message}) {
    return (String? value) {
      if (value != null && value.length > length) {
        // return message ?? S.of(Get.context!).errors_max(length);
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
        // return message ?? S.of(Get.context!).errors_email;
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
          // return S.of(Get.context!).errors_password_required;
        }
        if (min != null && value.trim().length < min) {
          // return S.of(Get.context!).errors_password_min(min);
        }
        if (max != null && value.trim().length > max) {
          // return S.of(Get.context!).errors_password_max(max);
        }
        if (requireDigits && !value.trim().contains(RegExp(r'[0-9]'))) {
          // return S.of(Get.context!).errors_password_digit;
        }
        if (requireUppercase && !value.trim().contains(RegExp(r'[A-Z]'))) {
          // return S.of(Get.context!).errors_password_upper_letter;
        }
        if (requireLowercase && !value.trim().contains(RegExp(r'[a-z]'))) {
          // return S.of(Get.context!).errors_password_letter;
        }
        if (requireSpecialCharacter && !value.trim().contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          // return S.of(Get.context!).errors_password_symbol;
        }
      }
      return null;
    };
  }

  static Function(String?) confirmPassword(TextEditingController password, {String? message}) {
    return (String? value) {
      if (value != null && value.trim() != password.text) {
        // return message ?? S.of(Get.context!).errors_password_confirm;
      }
      return null;
    };
  }
}
