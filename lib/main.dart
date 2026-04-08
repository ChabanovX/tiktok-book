import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/app.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/theme/app_theme_controller.dart';
import 'package:rsvp_flutter_app/l10n/app_locale_controller.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

  setupServiceLocator();
  await Future.wait([
    appLocaleController.loadSavedLocale(),
    appThemeController.loadSavedThemeMode(),
  ]);

  binding.allowFirstFrame();
  runApp(const MainApp());
}

void setupServiceLocator() {
  configureDeps();
}
