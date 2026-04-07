import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeController extends ChangeNotifier {
  static const _themeModePreferenceKey = 'app.themeMode';

  SharedPreferences? _preferences;
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadSavedThemeMode() async {
    final preferences = await _getPreferences();
    _themeMode = _themeModeFromStoredValue(preferences.getString(_themeModePreferenceKey));
  }

  void setThemeMode(ThemeMode themeMode) {
    if (_themeMode == themeMode) {
      return;
    }

    _themeMode = themeMode;
    notifyListeners();
    unawaited(_persistThemeMode(themeMode));
  }

  Future<SharedPreferences> _getPreferences() async {
    return _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> _persistThemeMode(ThemeMode themeMode) async {
    final preferences = await _getPreferences();
    await preferences.setString(_themeModePreferenceKey, themeMode.name);
  }

  ThemeMode _themeModeFromStoredValue(String? value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }
}

final appThemeController = AppThemeController();
