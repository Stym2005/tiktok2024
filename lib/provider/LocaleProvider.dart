import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  static const String _localeKey = 'app_locale';
  Locale _locale = const Locale('th'); // Default locale

  Locale get locale => _locale;

  // Load the locale from SharedPreferences
  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey);
    if (localeCode != null) {
      _locale = Locale(localeCode);
    }
    notifyListeners();
  }

  // Method to set a new locale
  Future<void> setLocale(Locale newLocale) async {
    if (_locale.languageCode != newLocale.languageCode) {
      _locale = newLocale;
      notifyListeners();
      // Save the new locale to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, newLocale.languageCode);
    }
  }
}
