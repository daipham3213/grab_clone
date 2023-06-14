import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Language {
  final String code;
  final String locale;
  final String language;

  Language({
    required this.code,
    required this.locale,
    required this.language,
  });
}

class AppLocale {
  final Locale locale;
  late Map<String, String> localizedStrings;

  static List<Language> supportedLanguages = [
    Language(code: 'US', locale: 'en', language: 'English'),
    Language(code: 'VN', locale: 'vi', language: 'Tiếng Việt'),

  ];

  static const LocalizationsDelegate<AppLocale> delegate =
      _AppLocalizationsDelegate();

  AppLocale(this.locale);

  static AppLocale of(BuildContext context) {
    return Localizations.of<AppLocale>(context, AppLocale)!;
  }

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/locale/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    localizedStrings = jsonMap.map((key, value) {
      return MapEntry(
          key, value.toString().replaceAll(r"\'", "'").replaceAll(r"\t", " "));
    });

    return true;
  }

  String translate(String key) {
    return localizedStrings[key]!;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocale> {
  static const String tag = "AppLocale";
  static const supportedLang = ["en", "vi"];

  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return _AppLocalizationsDelegate.supportedLang
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale localizations = AppLocale(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
