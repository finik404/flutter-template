class VRules {
  VRules._();

  // Required
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return "Это поле не может быть пустым";
    }
    return null;
  }

  // Min
  static Function(String?) min(int length) {
    return (String? value) {
      if (value != null && value.length < length) {
        return "Поле должно быть не менее $length символов";
      }
      return null;
    };
  }

  // Max
  static Function(String?) max(int length) {
    return (String? value) {
      if (value != null && value.length > length) {
        return "Поле не может быть более $length символов";
      }
      return null;
    };
  }

  // Email
  static String? email(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (value == null || !regex.hasMatch(value)) {
      return "Некорректный адрес электронной почты";
    }
    return null;
  }

  // Password
  static String? password(
    String? value, {
    bool required = true,
    bool requireDigits = true,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireSpecialCharacter = true,
    int? min = 8,
    int? max,
  }) {
    if (value != null) {
      if (required && value.isEmpty) {
        return "Пароль не может быть пустым";
      }
      if (min != null && value.length < min) {
        return "Пароль должен содержать минимум $min символов";
      }
      if (max != null && value.length > max) {
        return "Пароль не должен превышать $max символов";
      }
      if (requireDigits && !value.contains(RegExp(r'[0-9]'))) {
        return "Пароль должен содержать хотя бы одну цифру";
      }
      if (requireUppercase && !value.contains(RegExp(r'[A-Z]'))) {
        return "Пароль должен содержать хотя бы одну заглавную букву";
      }
      if (requireLowercase && !value.contains(RegExp(r'[a-z]'))) {
        return "Пароль должен содержать хотя бы одну строчную букву";
      }
      if (requireSpecialCharacter && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        return "Пароль должен содержать хотя бы один специальный символ";
      }
    }
    return null;
  }
}
