// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppThemeTailorMixin on ThemeExtension<AppTheme> {
  Color get backgroundColor;
  Color get backgroundColor2;
  Color get primaryColor;
  Color get secondaryColor;
  Color get dividerColorMuted;
  Color get addBookCardBorderColor;
  Color get addBookCardBackgroundColor;
  Color get stateDescriptionColor;
  Color get stateCardShadowColor;
  Color get emptyStateAccentBackgroundColor;
  Color get emptyStateAccentColor;
  Color get errorStateAccentColor;
  TextStyle get titleTextStyle;
  TextStyle get appBarTitleTextStyle;
  TextStyle get mainTextStyle;
  TextStyle get bookTitleText;
  TextStyle get subTextStyle;
  TextStyle get buttonTextStyle;

  @override
  AppTheme copyWith({
    Color? backgroundColor,
    Color? backgroundColor2,
    Color? primaryColor,
    Color? secondaryColor,
    Color? dividerColorMuted,
    Color? addBookCardBorderColor,
    Color? addBookCardBackgroundColor,
    Color? stateDescriptionColor,
    Color? stateCardShadowColor,
    Color? emptyStateAccentBackgroundColor,
    Color? emptyStateAccentColor,
    Color? errorStateAccentColor,
    TextStyle? titleTextStyle,
    TextStyle? appBarTitleTextStyle,
    TextStyle? mainTextStyle,
    TextStyle? bookTitleText,
    TextStyle? subTextStyle,
    TextStyle? buttonTextStyle,
  }) {
    return AppTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundColor2: backgroundColor2 ?? this.backgroundColor2,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      dividerColorMuted: dividerColorMuted ?? this.dividerColorMuted,
      addBookCardBorderColor:
          addBookCardBorderColor ?? this.addBookCardBorderColor,
      addBookCardBackgroundColor:
          addBookCardBackgroundColor ?? this.addBookCardBackgroundColor,
      stateDescriptionColor:
          stateDescriptionColor ?? this.stateDescriptionColor,
      stateCardShadowColor: stateCardShadowColor ?? this.stateCardShadowColor,
      emptyStateAccentBackgroundColor:
          emptyStateAccentBackgroundColor ??
          this.emptyStateAccentBackgroundColor,
      emptyStateAccentColor:
          emptyStateAccentColor ?? this.emptyStateAccentColor,
      errorStateAccentColor:
          errorStateAccentColor ?? this.errorStateAccentColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      appBarTitleTextStyle: appBarTitleTextStyle ?? this.appBarTitleTextStyle,
      mainTextStyle: mainTextStyle ?? this.mainTextStyle,
      bookTitleText: bookTitleText ?? this.bookTitleText,
      subTextStyle: subTextStyle ?? this.subTextStyle,
      buttonTextStyle: buttonTextStyle ?? this.buttonTextStyle,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this as AppTheme;
    return AppTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      backgroundColor2: Color.lerp(
        backgroundColor2,
        other.backgroundColor2,
        t,
      )!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      dividerColorMuted: Color.lerp(
        dividerColorMuted,
        other.dividerColorMuted,
        t,
      )!,
      addBookCardBorderColor: Color.lerp(
        addBookCardBorderColor,
        other.addBookCardBorderColor,
        t,
      )!,
      addBookCardBackgroundColor: Color.lerp(
        addBookCardBackgroundColor,
        other.addBookCardBackgroundColor,
        t,
      )!,
      stateDescriptionColor: Color.lerp(
        stateDescriptionColor,
        other.stateDescriptionColor,
        t,
      )!,
      stateCardShadowColor: Color.lerp(
        stateCardShadowColor,
        other.stateCardShadowColor,
        t,
      )!,
      emptyStateAccentBackgroundColor: Color.lerp(
        emptyStateAccentBackgroundColor,
        other.emptyStateAccentBackgroundColor,
        t,
      )!,
      emptyStateAccentColor: Color.lerp(
        emptyStateAccentColor,
        other.emptyStateAccentColor,
        t,
      )!,
      errorStateAccentColor: Color.lerp(
        errorStateAccentColor,
        other.errorStateAccentColor,
        t,
      )!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      appBarTitleTextStyle: TextStyle.lerp(
        appBarTitleTextStyle,
        other.appBarTitleTextStyle,
        t,
      )!,
      mainTextStyle: TextStyle.lerp(mainTextStyle, other.mainTextStyle, t)!,
      bookTitleText: TextStyle.lerp(bookTitleText, other.bookTitleText, t)!,
      subTextStyle: TextStyle.lerp(subTextStyle, other.subTextStyle, t)!,
      buttonTextStyle: TextStyle.lerp(
        buttonTextStyle,
        other.buttonTextStyle,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              backgroundColor2,
              other.backgroundColor2,
            ) &&
            const DeepCollectionEquality().equals(
              primaryColor,
              other.primaryColor,
            ) &&
            const DeepCollectionEquality().equals(
              secondaryColor,
              other.secondaryColor,
            ) &&
            const DeepCollectionEquality().equals(
              dividerColorMuted,
              other.dividerColorMuted,
            ) &&
            const DeepCollectionEquality().equals(
              addBookCardBorderColor,
              other.addBookCardBorderColor,
            ) &&
            const DeepCollectionEquality().equals(
              addBookCardBackgroundColor,
              other.addBookCardBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              stateDescriptionColor,
              other.stateDescriptionColor,
            ) &&
            const DeepCollectionEquality().equals(
              stateCardShadowColor,
              other.stateCardShadowColor,
            ) &&
            const DeepCollectionEquality().equals(
              emptyStateAccentBackgroundColor,
              other.emptyStateAccentBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              emptyStateAccentColor,
              other.emptyStateAccentColor,
            ) &&
            const DeepCollectionEquality().equals(
              errorStateAccentColor,
              other.errorStateAccentColor,
            ) &&
            const DeepCollectionEquality().equals(
              titleTextStyle,
              other.titleTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              appBarTitleTextStyle,
              other.appBarTitleTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              mainTextStyle,
              other.mainTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              bookTitleText,
              other.bookTitleText,
            ) &&
            const DeepCollectionEquality().equals(
              subTextStyle,
              other.subTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              buttonTextStyle,
              other.buttonTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(backgroundColor2),
      const DeepCollectionEquality().hash(primaryColor),
      const DeepCollectionEquality().hash(secondaryColor),
      const DeepCollectionEquality().hash(dividerColorMuted),
      const DeepCollectionEquality().hash(addBookCardBorderColor),
      const DeepCollectionEquality().hash(addBookCardBackgroundColor),
      const DeepCollectionEquality().hash(stateDescriptionColor),
      const DeepCollectionEquality().hash(stateCardShadowColor),
      const DeepCollectionEquality().hash(emptyStateAccentBackgroundColor),
      const DeepCollectionEquality().hash(emptyStateAccentColor),
      const DeepCollectionEquality().hash(errorStateAccentColor),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(appBarTitleTextStyle),
      const DeepCollectionEquality().hash(mainTextStyle),
      const DeepCollectionEquality().hash(bookTitleText),
      const DeepCollectionEquality().hash(subTextStyle),
      const DeepCollectionEquality().hash(buttonTextStyle),
    );
  }
}

extension AppThemeBuildContextProps on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
  Color get backgroundColor => appTheme.backgroundColor;
  Color get backgroundColor2 => appTheme.backgroundColor2;
  Color get primaryColor => appTheme.primaryColor;
  Color get secondaryColor => appTheme.secondaryColor;
  Color get dividerColorMuted => appTheme.dividerColorMuted;
  Color get addBookCardBorderColor => appTheme.addBookCardBorderColor;
  Color get addBookCardBackgroundColor => appTheme.addBookCardBackgroundColor;
  Color get stateDescriptionColor => appTheme.stateDescriptionColor;
  Color get stateCardShadowColor => appTheme.stateCardShadowColor;
  Color get emptyStateAccentBackgroundColor =>
      appTheme.emptyStateAccentBackgroundColor;
  Color get emptyStateAccentColor => appTheme.emptyStateAccentColor;
  Color get errorStateAccentColor => appTheme.errorStateAccentColor;
  TextStyle get titleTextStyle => appTheme.titleTextStyle;
  TextStyle get appBarTitleTextStyle => appTheme.appBarTitleTextStyle;
  TextStyle get mainTextStyle => appTheme.mainTextStyle;
  TextStyle get bookTitleText => appTheme.bookTitleText;
  TextStyle get subTextStyle => appTheme.subTextStyle;
  TextStyle get buttonTextStyle => appTheme.buttonTextStyle;
}
