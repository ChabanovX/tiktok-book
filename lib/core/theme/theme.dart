import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme.tailor.dart';

@TailorMixin()
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeTailorMixin {
  const AppTheme({
    required this.backgroundColor,
    required this.backgroundColor2,
    required this.primaryColor,
    required this.secondaryColor,
    required this.dividerColorMuted,
    required this.addBookCardBorderColor,
    required this.addBookCardBackgroundColor,
    required this.stateDescriptionColor,
    required this.stateCardShadowColor,
    required this.emptyStateAccentBackgroundColor,
    required this.emptyStateAccentColor,
    required this.errorStateAccentColor,
    required this.desctructionColor,
    required this.titleTextStyle,
    required this.rsvpTextStyleSemiBold,
    required this.rsvpTextStyleRegular,
    required this.appBarTitleTextStyle,
    required this.mainTextStyle,
    required this.bookTitleText,
    required this.subTextStyle,
    required this.buttonTextStyle,
  });

  factory AppTheme.light() {
    return const AppTheme(
      backgroundColor: Color.fromRGBO(237, 239, 252, 1),
      backgroundColor2: Color.fromRGBO(250, 250, 254, 1),
      primaryColor: Color.fromRGBO(0, 67, 200, 1),
      secondaryColor: Color.fromRGBO(0, 87, 255, 1),
      dividerColorMuted: Color.fromRGBO(15, 23, 42, 0.18),
      addBookCardBorderColor: Color.fromRGBO(0, 87, 255, 0.28),
      addBookCardBackgroundColor: Color.fromRGBO(0, 87, 255, 0.06),
      stateDescriptionColor: Color.fromRGBO(25, 28, 29, 0.82),
      stateCardShadowColor: Color(0x14000000),
      emptyStateAccentBackgroundColor: Color(0xFFFFDED4),
      emptyStateAccentColor: Color(0xFFD66C42),
      errorStateAccentColor: Color(0xFFB44716),
      desctructionColor: CupertinoColors.destructiveRed,
      titleTextStyle: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(25, 28, 29, 1),
        fontFamily: 'SpaceGrotesk',
      ),
      rsvpTextStyleSemiBold: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(25, 28, 29, 1),
        fontFamily: 'SpaceGrotesk',
      ),
      rsvpTextStyleRegular: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
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
      bookTitleText: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
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

  factory AppTheme.dark() {
    return const AppTheme(
      backgroundColor: Color(0xFF0B1220),
      backgroundColor2: Color(0xFF121B2D),
      primaryColor: Color(0xFF8CB4FF),
      secondaryColor: Color(0xFF4A8DFF),
      dividerColorMuted: Color.fromRGBO(226, 232, 240, 0.18),
      addBookCardBorderColor: Color.fromRGBO(74, 141, 255, 0.32),
      addBookCardBackgroundColor: Color.fromRGBO(74, 141, 255, 0.12),
      stateDescriptionColor: Color.fromRGBO(226, 232, 240, 0.78),
      stateCardShadowColor: Color(0x66000000),
      emptyStateAccentBackgroundColor: Color(0xFF31211B),
      emptyStateAccentColor: Color(0xFFFFB089),
      errorStateAccentColor: Color(0xFFFF9A73),
      desctructionColor: CupertinoColors.systemRed,
      titleTextStyle: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF8FAFC),
        fontFamily: 'SpaceGrotesk',
      ),
      appBarTitleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF8FAFC),
        fontFamily: 'SpaceGrotesk',
      ),
      mainTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFFF8FAFC),
        fontFamily: 'SpaceGrotesk',
      ),
      bookTitleText: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Color(0xFFE2E8F0),
        fontFamily: 'SpaceGrotesk',
      ),
      subTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFFE2E8F0),
        fontFamily: 'Manrope',
      ),
      buttonTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF8CB4FF),
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
  final Color dividerColorMuted;
  @override
  final Color addBookCardBorderColor;
  @override
  final Color addBookCardBackgroundColor;
  @override
  final Color stateDescriptionColor;
  @override
  final Color stateCardShadowColor;
  @override
  final Color emptyStateAccentBackgroundColor;
  @override
  final Color emptyStateAccentColor;
  @override
  final Color errorStateAccentColor;
  @override
  final Color desctructionColor;
  @override
  final TextStyle titleTextStyle;
  @override
  final TextStyle rsvpTextStyleSemiBold;
  @override
  final TextStyle rsvpTextStyleRegular;
  @override
  final TextStyle appBarTitleTextStyle;
  @override
  final TextStyle mainTextStyle;
  @override
  final TextStyle bookTitleText;
  @override
  final TextStyle subTextStyle;
  @override
  final TextStyle buttonTextStyle;
}

ThemeData buildLightTheme() {
  return _buildThemeData(
    appTheme: AppTheme.light(),
    brightness: Brightness.light,
  );
}

ThemeData buildDarkTheme() {
  return _buildThemeData(
    appTheme: AppTheme.dark(),
    brightness: Brightness.dark,
  );
}

ThemeData _buildThemeData({
  required AppTheme appTheme,
  required Brightness brightness,
}) {
  final onSurface = appTheme.mainTextStyle.color ?? const Color.fromRGBO(25, 28, 29, 1);
  final colorScheme = brightness == Brightness.light
      ? ColorScheme.light(
          primary: appTheme.primaryColor,
          secondary: appTheme.secondaryColor,
          surface: appTheme.backgroundColor,
          error: appTheme.errorStateAccentColor,
          onSecondary: Colors.white,
          onSurface: onSurface,
        )
      : ColorScheme.dark(
          primary: appTheme.primaryColor,
          secondary: appTheme.secondaryColor,
          surface: appTheme.backgroundColor,
          error: appTheme.errorStateAccentColor,
          onSecondary: Colors.white,
          onSurface: onSurface,
        );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    primaryColor: appTheme.primaryColor,
    scaffoldBackgroundColor: appTheme.backgroundColor,
    canvasColor: appTheme.backgroundColor,
    cardColor: appTheme.backgroundColor2,
    dividerColor: appTheme.dividerColorMuted,
    shadowColor: appTheme.stateCardShadowColor,
    colorScheme: colorScheme,
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
