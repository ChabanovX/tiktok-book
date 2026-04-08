import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/reading_speed.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppReadingSpeedController extends ChangeNotifier {
  static const _wpmPreferenceKey = 'app.reading.wpm';

  SharedPreferences? _preferences;
  int _wpm = defaultReadingWpm;

  int get wpm => _wpm;

  Future<void> loadSavedWpm() async {
    final preferences = await _getPreferences();
    _wpm = _sanitizeWpm(preferences.getInt(_wpmPreferenceKey));
  }

  void setWpm(int wpm) {
    final resolvedWpm = _sanitizeWpm(wpm);
    if (_wpm == resolvedWpm) {
      return;
    }

    _wpm = resolvedWpm;
    notifyListeners();
    unawaited(_persistWpm(resolvedWpm));
  }

  Future<SharedPreferences> _getPreferences() async {
    return _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> _persistWpm(int wpm) async {
    final preferences = await _getPreferences();
    await preferences.setInt(_wpmPreferenceKey, wpm);
  }

  int _sanitizeWpm(int? wpm) {
    if (wpm == null || !isSupportedReadingWpm(wpm)) {
      return defaultReadingWpm;
    }

    return wpm;
  }
}

final appReadingSpeedController = AppReadingSpeedController();
