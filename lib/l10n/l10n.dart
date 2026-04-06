import 'package:flutter/widgets.dart';
import 'package:rsvp_flutter_app/l10n/generated/app_localizations.dart';

export 'package:rsvp_flutter_app/l10n/generated/app_localizations.dart';

const _fallbackLocale = Locale('en');

extension AppLocalizationsGetter on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this) ?? lookupAppLocalizations(_fallbackLocale);
}
