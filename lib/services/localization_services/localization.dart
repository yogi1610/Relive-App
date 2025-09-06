import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

enum AppLanguage { hebrew, english, arabic }

class AppLocalization {
  static const _languageKey = "language";

  static const Map<AppLanguage, String> languageCodes = {
    AppLanguage.hebrew: "he",
    AppLanguage.english: "en",
    AppLanguage.arabic: "ar",
  };

  static const Map<String, String> _countryCodes = {
    "he": "HEB",
    "en": "US",
    "ar": "AR",
  };

  static List<String> get languageNames => ["Hebrew", "English", "Arabic"];

  static Future<void> setLanguage(AppLanguage language,
      BuildContext context) async {
    final languageCode = languageCodes[language] ?? "he";
    final countryCode = _countryCodes[languageCode] ?? "HEB";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);

    if (context.mounted) {
      context.setLocale(Locale(languageCode, countryCode));
    }
  }

  static Future<Locale> getSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? "he";
    final countryCode = _countryCodes[languageCode] ?? "HEB";
    return Locale(languageCode, countryCode);
  }

  static AppLanguage getLanguageFromCode(String code) {
    switch (code) {
      case "en":
        return AppLanguage.english;
      case "ar":
        return AppLanguage.arabic;
      case "he":
      default:
        return AppLanguage.hebrew;
    }
  }

  static AppLanguage getLanguageFromLocale(Locale locale) {
    return getLanguageFromCode(locale.languageCode);
  }
}