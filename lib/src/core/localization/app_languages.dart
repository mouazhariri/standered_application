import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:standered_application/src/application/di/injection.dart';
import 'package:standered_application/src/infrastructure/storage/locale_storage.dart';

abstract class AppLanguages {
  static Locale curreentLocal = AppLocales.defualtLocale;
  static setLocale(BuildContext context, Locale locale) async {
    EasyLocalization.of(context)!.setLocale(locale);
    curreentLocal = locale;
    await sl<LocaleStorage>().saveUserSettings(
        sl<LocaleStorage>().userSettings.copyWith(locale: locale));
  }

  static Locale get getCurrentLocale {
    return curreentLocal;
  }

  static bool get isArabic =>
      sl.get<LocaleStorage>().userSettings.locale == AppLocales.arabicLocale;
  static bool get isEnglish =>
      sl.get<LocaleStorage>().userSettings.locale == AppLocales.englishLocale;
  static get createSupportedLocals => const [
        AppLocales.englishLocale, // English
        AppLocales.arabicLocale, // Arabic
      ];
  static List<String> get localeNames => const [
        'English',
        'العربية',
      ];
}

class AppLocales {
  static const Locale arabicLocale = Locale('ar');
  static const Locale englishLocale = Locale('en');
  static const Locale defualtLocale = Locale('en');
}
