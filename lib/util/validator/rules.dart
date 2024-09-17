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
}
