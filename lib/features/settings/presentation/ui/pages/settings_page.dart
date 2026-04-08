import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/constants.dart';
import 'package:rsvp_flutter_app/core/theme/app_theme_controller.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/app_reading_speed_controller.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/ui/widgets/speed_picker.dart';
import 'package:rsvp_flutter_app/l10n/app_locale_controller.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const _englishLocale = Locale('en');
  static const _russianLocale = Locale('ru');

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        appLocaleController,
        appReadingSpeedController,
        appThemeController,
      ]),
      builder: (context, child) {
        final appTheme = context.appTheme;
        final l10n = context.l10n;
        final selectedLocale = appLocaleController.locale;
        final selectedWpm = appReadingSpeedController.wpm;
        final selectedThemeMode = appThemeController.themeMode;

        return Scaffold(
          backgroundColor: appTheme.backgroundColor2,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  height: 68,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: appTheme.backgroundColor2,
                    border: Border(
                      bottom: BorderSide(
                        color: appTheme.dividerColorMuted,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 48,
                        child: BackButton(),
                      ),
                      Expanded(
                        child: Text(
                          l10n.settingsPageTitle,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTheme.appBarTitleTextStyle,
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                    children: [
                      Text(
                        l10n.settingsLanguageSectionTitle,
                        style: appTheme.titleTextStyle.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.settingsLanguageSectionDescription,
                        style: appTheme.subTextStyle.copyWith(
                          color: appTheme.stateDescriptionColor,
                          fontSize: 14,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _SettingsOptionCard(
                        icon: Icons.smartphone_rounded,
                        title: l10n.settingsLanguageSystemTitle,
                        isSelected: selectedLocale == null,
                        onTap: appLocaleController.useSystemLocale,
                      ),
                      const SizedBox(height: 14),
                      _SettingsOptionCard(
                        icon: Icons.language_rounded,
                        title: l10n.settingsLanguageEnglishTitle,
                        isSelected: selectedLocale == _englishLocale,
                        onTap: () => appLocaleController.setLocale(_englishLocale),
                      ),
                      const SizedBox(height: 14),
                      _SettingsOptionCard(
                        icon: Icons.language_rounded,
                        title: l10n.settingsLanguageRussianTitle,
                        isSelected: selectedLocale == _russianLocale,
                        onTap: () => appLocaleController.setLocale(_russianLocale),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        l10n.settingsThemeSectionTitle,
                        style: appTheme.titleTextStyle.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.settingsThemeSectionDescription,
                        style: appTheme.subTextStyle.copyWith(
                          color: appTheme.stateDescriptionColor,
                          fontSize: 14,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _SettingsOptionCard(
                        icon: Icons.brightness_auto_rounded,
                        title: l10n.settingsThemeSystemTitle,
                        isSelected: selectedThemeMode == ThemeMode.system,
                        onTap: () => appThemeController.setThemeMode(ThemeMode.system),
                      ),
                      const SizedBox(height: 14),
                      _SettingsOptionCard(
                        icon: Icons.light_mode_rounded,
                        title: l10n.settingsThemeLightTitle,
                        isSelected: selectedThemeMode == ThemeMode.light,
                        onTap: () => appThemeController.setThemeMode(ThemeMode.light),
                      ),
                      const SizedBox(height: 14),
                      _SettingsOptionCard(
                        icon: Icons.dark_mode_rounded,
                        title: l10n.settingsThemeDarkTitle,
                        isSelected: selectedThemeMode == ThemeMode.dark,
                        onTap: () => appThemeController.setThemeMode(ThemeMode.dark),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        l10n.settingsReadingSpeedSectionTitle,
                        style: appTheme.titleTextStyle.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.settingsReadingSpeedSectionDescription,
                        style: appTheme.subTextStyle.copyWith(
                          color: appTheme.stateDescriptionColor,
                          fontSize: 14,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _SettingsOptionCard(
                        icon: Icons.speed_rounded,
                        title: l10n.settingsReadingSpeedDefaultTitle,
                        showSelectionIndicator: false,
                        valueLabel: '$selectedWpm WPM',
                        onTap: () => showAdaptiveSpeedPicker(
                          context,
                          selectedWpm,
                          appReadingSpeedController.setWpm,
                        ),
                      ),
                      const SizedBox(height: 150),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SettingsOptionCard extends StatelessWidget {
  const _SettingsOptionCard({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
    this.showSelectionIndicator = true,
    this.valueLabel,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  final bool showSelectionIndicator;
  final String? valueLabel;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final borderColor = isSelected
        ? appTheme.secondaryColor.withValues(alpha: 0.28)
        : appTheme.dividerColorMuted.withValues(alpha: 0.18);
    final backgroundColor = isSelected ? appTheme.backgroundColor : appTheme.backgroundColor2;

    return AnimatedContainer(
      duration: Constants.basicAnimationDuration,
      curve: Constants.basicAnimationCurve,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: appTheme.stateCardShadowColor,
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
            child: Row(
              children: [
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: appTheme.secondaryColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    color: appTheme.secondaryColor,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: appTheme.mainTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                if (showSelectionIndicator)
                  AnimatedContainer(
                    duration: Constants.basicAnimationDuration,
                    curve: Constants.basicAnimationCurve,
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? appTheme.secondaryColor : Colors.transparent,
                      border: Border.all(
                        color: isSelected ? appTheme.secondaryColor : appTheme.dividerColorMuted,
                        width: 2,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check_rounded,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  )
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (valueLabel != null)
                        Text(
                          valueLabel!,
                          style: appTheme.buttonTextStyle.copyWith(
                            color: appTheme.secondaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: appTheme.dividerColorMuted,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
