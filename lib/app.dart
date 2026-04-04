import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/navigation/app_router.dart';
import 'package:rsvp_flutter_app/core/navigation/navigation_service.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/pages/main_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/',
      theme: _buildLightTheme(),
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
