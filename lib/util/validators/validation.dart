class TValidator {
  // Схема для проверки значения
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return "Вы не выбрали изображение";
    }
    return null;
  }

  // Схема для проверки значения не меньше заданного
  static String? min(String? value, int length) {
    if (value == null || value.isEmpty) {
      return "Это поле не может быть пустым";
    }
    return null;
  }

  // Схема для проверки значения не больше заданного
  static String? max(String? value, int length) {
    if (value != null && value.length > length) {
      return "Не может быть более ${length} символов";
    }
    return null;
  }

  // Схема для проверки значения на валидность email
  static String? email(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (value == null || !regex.hasMatch(value)) {
      return "Введите корректный адрес электронной почты";
    }
    return null;
  }

  // Схема для проверки значения на валидность email
  static String? address(String? value) {
    Pattern pattern = r'^(http|https):\/\/[^\s$.?#].[^\s]*$';
    RegExp regex = RegExp(pattern.toString());
    if (value == null || !regex.hasMatch(value)) {
      return 'Неверный адресс';
    }
    return null;
  }

  // Схема для проверки значения на валидность email или нескольких email через запятую
  static String? emails(String? value) {
    if (value == null || value.isEmpty) {
      return "Это поле не может быть пустым";
    }

    // Разбиваем введенные значения по запятой
    List<String> emailsList = value.split(',');

    // Проверяем каждый email в списке
    for (var email in emailsList) {
      email = email.trim(); // Удаляем возможные пробелы
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern.toString());

      // Если хотя бы один email невалиден, возвращаем ошибку
      if (!regex.hasMatch(email)) {
        return "Введите действительный адрес электронной почты";
      }
    }

    return null;
  }
}