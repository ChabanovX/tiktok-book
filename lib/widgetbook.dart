import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/widgetbook.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = buildLightTheme();
    final widgetbookLightTheme = WidgetbookTheme<ThemeData>(
      name: 'Light',
      data: lightTheme,
    );

    return Widgetbook.material(
      lightTheme: lightTheme,
      themeMode: ThemeMode.light,
      addons: [
        MaterialThemeAddon(
          themes: [widgetbookLightTheme],
          initialTheme: widgetbookLightTheme,
        ),
      ],
      directories: directories,
    );
  }
}
