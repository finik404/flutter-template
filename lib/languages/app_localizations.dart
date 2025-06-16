import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'languages/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kk'),
    Locale('ru')
  ];

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @errors_required.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty'**
  String get errors_required;

  /// No description provided for @errors_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get errors_email;

  /// No description provided for @errors_min.
  ///
  /// In en, this message translates to:
  /// **'The field must be at least {length} characters'**
  String errors_min(Object length);

  /// No description provided for @errors_max.
  ///
  /// In en, this message translates to:
  /// **'The field cannot exceed {length} characters'**
  String errors_max(Object length);

  /// No description provided for @errors_password_confirm.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get errors_password_confirm;

  /// No description provided for @errors_password_required.
  ///
  /// In en, this message translates to:
  /// **'Enter the password'**
  String get errors_password_required;

  /// No description provided for @errors_password_min.
  ///
  /// In en, this message translates to:
  /// **'The password must contain a minimum of {length} characters'**
  String errors_password_min(Object length);

  /// No description provided for @errors_password_max.
  ///
  /// In en, this message translates to:
  /// **'The password must not exceed {length} characters'**
  String errors_password_max(Object length);

  /// No description provided for @errors_password_digit.
  ///
  /// In en, this message translates to:
  /// **'The password must contain at least one digit'**
  String get errors_password_digit;

  /// No description provided for @errors_password_letter.
  ///
  /// In en, this message translates to:
  /// **'The password must contain at least one lowercase letter'**
  String get errors_password_letter;

  /// No description provided for @errors_password_upper_letter.
  ///
  /// In en, this message translates to:
  /// **'The password must contain at least one uppercase letter'**
  String get errors_password_upper_letter;

  /// No description provided for @errors_password_symbol.
  ///
  /// In en, this message translates to:
  /// **'The password must contain at least one special character'**
  String get errors_password_symbol;

  /// No description provided for @errors_email_unique.
  ///
  /// In en, this message translates to:
  /// **'This email is already in use'**
  String get errors_email_unique;

  /// No description provided for @errors_auth.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get errors_auth;

  /// No description provided for @errors_image_size.
  ///
  /// In en, this message translates to:
  /// **'File size must not exceed {size} MB'**
  String errors_image_size(Object size);

  /// No description provided for @errors_image_type.
  ///
  /// In en, this message translates to:
  /// **'Invalid image format. Acceptable formats: PNG, JPEG, JPG'**
  String get errors_image_type;

  /// No description provided for @errors_network.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errors_network;

  /// No description provided for @errors_network_text.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again'**
  String get errors_network_text;

  /// No description provided for @errors_code.
  ///
  /// In en, this message translates to:
  /// **'Enter the recovery code'**
  String get errors_code;

  /// No description provided for @errors_code_length.
  ///
  /// In en, this message translates to:
  /// **'The code must be 4-digit'**
  String get errors_code_length;

  /// No description provided for @errors_auth_code.
  ///
  /// In en, this message translates to:
  /// **'Invalid recovery code'**
  String get errors_auth_code;

  /// No description provided for @errors_phone.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get errors_phone;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'kk': return AppLocalizationsKk();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
