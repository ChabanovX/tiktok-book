import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/pages/main_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildLightTheme(),
      home: const MainScreen(),
    );
  }

  ThemeData _buildLightTheme() {
    final appTheme = AppTheme.light();
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      primaryColor: appTheme.primaryColor,
      colorScheme: ColorScheme.light(
        primary: appTheme.primaryColor,
        secondary: appTheme.secondaryColor,
        surface: appTheme.backgroundColor,
      ),
      
      textTheme: TextTheme(
        displayLarge: appTheme.titleTextStyle,
        displayMedium: appTheme.appBarTitleTextStyle,
        bodyLarge: appTheme.mainTextStyle,
        bodyMedium: appTheme.subTextStyle,
        labelLarge: appTheme.buttonTextStyle,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: appTheme.backgroundColor2,
        titleTextStyle: appTheme.appBarTitleTextStyle,
        foregroundColor: appTheme.primaryColor,
        elevation: 0,
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.primaryColor,
          foregroundColor: Colors.white,
          textStyle: appTheme.buttonTextStyle,
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: appTheme.primaryColor,
          textStyle: appTheme.buttonTextStyle,
        ),
      ),
      
      scaffoldBackgroundColor: appTheme.backgroundColor,
      
      extensions: [appTheme],
    );
  }
}
