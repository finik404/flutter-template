// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get error => 'Қате';

  @override
  String get errors_required => 'Бұл өріс бос болуы мүмкін емес';

  @override
  String get errors_email => 'Қате электрондық пошта';

  @override
  String errors_min(Object length) {
    return 'Өріс кем дегенде $length таңбалар болуы керек';
  }

  @override
  String errors_max(Object length) {
    return 'Өріс бұдан артық болуы мүмкін емес $length таңбалар';
  }

  @override
  String get errors_password_confirm => 'Құпия сөздер бірдей емес';

  @override
  String get errors_password_required => 'Құпия сөзді енгізіңіз';

  @override
  String errors_password_min(Object length) {
    return 'Құпия сөзде ең аз $length таңбалар болуы керек';
  }

  @override
  String errors_password_max(Object length) {
    return 'Құпия сөз $length таңбаларынан аспауы керек';
  }

  @override
  String get errors_password_digit => 'Парольде кем дегенде бір сан болуы керек';

  @override
  String get errors_password_letter => 'Құпия сөзде кем дегенде бір кіші әріп болуы керек';

  @override
  String get errors_password_upper_letter => 'Құпия сөзде кем дегенде бір бас әріп болуы керек';

  @override
  String get errors_password_symbol => 'Құпия сөзде кем дегенде бір арнайы таңба болуы керек';

  @override
  String get errors_email_unique => 'Бұл пошта қазірдің өзінде қолданылады';

  @override
  String get errors_auth => 'Қате пошта немесе құпия сөз';

  @override
  String errors_image_size(Object size) {
    return 'Файл өлшемі $size МБ аспауы керек';
  }

  @override
  String get errors_image_type => 'Жарамсыз кескін пішімі. Жарамды форматтар: PNG, JPEG, JPG';

  @override
  String get errors_network => 'Интернет байланысы жоқ';

  @override
  String get errors_network_text => 'Интернет байланысын тексеріп, қайталап көріңіз';

  @override
  String get errors_code => 'қалпына келтіру кодын енгізіңіз';

  @override
  String get errors_code_length => 'Код 4 таңбалы болуы керек';

  @override
  String get errors_auth_code => 'Қалпына келтіру коды дұрыс емес';

  @override
  String get errors_phone => 'Телефон нөмірі пішімі жарамсыз';
}
