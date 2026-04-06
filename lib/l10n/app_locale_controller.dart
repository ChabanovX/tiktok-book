import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rsvp_flutter_app/l10n/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocaleController extends ChangeNotifier {
  static const _localePreferenceKey = 'app.locale';

  SharedPreferences? _preferences;
  Locale? _locale;

  Locale? get locale => _locale;

  Future<void> loadSavedLocale() async {
    final preferences = await _getPreferences();
    _locale = _localeFromStoredValue(preferences.getString(_localePreferenceKey));
  }

  void setLocale(Locale? locale) {
    if (_locale == locale) {
      return;
    }

    _locale = locale;
    notifyListeners();
    unawaited(_persistLocale(locale));
  }

  void useSystemLocale() => setLocale(null);

  Future<SharedPreferences> _getPreferences() async {
    return _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> _persistLocale(Locale? locale) async {
    final preferences = await _getPreferences();

    if (locale == null) {
      await preferences.remove(_localePreferenceKey);
      return;
    }

    await preferences.setString(_localePreferenceKey, locale.toLanguageTag());
  }

  Locale? _localeFromStoredValue(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    for (final supportedLocale in AppLocalizations.supportedLocales) {
      if (supportedLocale.toLanguageTag() == value || supportedLocale.languageCode == value) {
        return supportedLocale;
      }
    }

    return null;
  }
}

final appLocaleController = AppLocaleController();
