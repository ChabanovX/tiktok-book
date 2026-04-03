import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme.tailor.dart';

@TailorMixin()
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {
  const AppTheme({
    required this.backgroundColor,
<<<<<<< HEAD
<<<<<<< HEAD
    required this.backgroundColor2,
    required this.primaryColor,
    required this.secondaryColor,
    required this.titleTextStyle,
    required this.appBarTitleTextStyle,
    required this.mainTextStyle,
    required this.subTextStyle,
    required this.buttonTextStyle,
    required this.backgroundColor2,
    required this.buttonTextStyle ,
  });

  factory AppTheme.light() {
    return const AppTheme(
      backgroundColor: Color.fromRGBO(237, 239, 252, 1),
      backgroundColor2: Color.fromRGBO(250, 250, 254, 1),
      primaryColor: Color.fromRGBO(0, 67, 200, 1),
      secondaryColor: Color.fromRGBO(0, 87, 255, 1),
      titleTextStyle: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(25, 28, 29, 1),
        fontFamily: 'SpaceGrotesk',
      ),
      appBarTitleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(15, 23, 42, 1),
        fontFamily: 'SpaceGrotesk',
      ),
      mainTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(25, 28, 29, 1),
        fontFamily: 'SpaceGrotesk',
      ),
      subTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(25, 28, 29, 1),
        fontFamily: 'Manrope',
      ),
      buttonTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(0, 67, 200, 1),
        fontFamily: 'Manrope',
      ),
    );
  }

  @override
  final Color backgroundColor;
  @override
  final Color backgroundColor2;
  @override
  final Color primaryColor;
  @override
  final Color secondaryColor;
  @override
  final TextStyle titleTextStyle;
  @override
  final TextStyle appBarTitleTextStyle;
  @override
  final TextStyle mainTextStyle;
  @override
  final TextStyle subTextStyle;
  @override
  final TextStyle buttonTextStyle;
}

ThemeData buildLightTheme() {
  final appTheme = AppTheme.light();

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: appTheme.primaryColor,
    scaffoldBackgroundColor: appTheme.backgroundColor,
    canvasColor: appTheme.backgroundColor,
    cardColor: appTheme.backgroundColor2,
    colorScheme: ColorScheme.light(
      primary: appTheme.primaryColor,
      secondary: appTheme.secondaryColor,
      surface: appTheme.backgroundColor,
      onSecondary: Colors.white,
      onSurface: appTheme.mainTextStyle.color ?? const Color.fromRGBO(25, 28, 29, 1),
    ),
    textTheme: TextTheme(
      displayLarge: appTheme.titleTextStyle,
      displayMedium: appTheme.appBarTitleTextStyle,
      titleLarge: appTheme.mainTextStyle,
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
    extensions: [appTheme],
  );
}
