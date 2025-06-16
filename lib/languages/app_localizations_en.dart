// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get error => 'Error';

  @override
  String get errors_required => 'This field cannot be empty';

  @override
  String get errors_email => 'Invalid email address';

  @override
  String errors_min(Object length) {
    return 'The field must be at least $length characters';
  }

  @override
  String errors_max(Object length) {
    return 'The field cannot exceed $length characters';
  }

  @override
  String get errors_password_confirm => 'Passwords do not match';

  @override
  String get errors_password_required => 'Enter the password';

  @override
  String errors_password_min(Object length) {
    return 'The password must contain a minimum of $length characters';
  }

  @override
  String errors_password_max(Object length) {
    return 'The password must not exceed $length characters';
  }

  @override
  String get errors_password_digit => 'The password must contain at least one digit';

  @override
  String get errors_password_letter => 'The password must contain at least one lowercase letter';

  @override
  String get errors_password_upper_letter => 'The password must contain at least one uppercase letter';

  @override
  String get errors_password_symbol => 'The password must contain at least one special character';

  @override
  String get errors_email_unique => 'This email is already in use';

  @override
  String get errors_auth => 'Invalid email or password';

  @override
  String errors_image_size(Object size) {
    return 'File size must not exceed $size MB';
  }

  @override
  String get errors_image_type => 'Invalid image format. Acceptable formats: PNG, JPEG, JPG';

  @override
  String get errors_network => 'No internet connection';

  @override
  String get errors_network_text => 'Please check your internet connection and try again';

  @override
  String get errors_code => 'Enter the recovery code';

  @override
  String get errors_code_length => 'The code must be 4-digit';

  @override
  String get errors_auth_code => 'Invalid recovery code';

  @override
  String get errors_phone => 'Invalid phone number format';
}
