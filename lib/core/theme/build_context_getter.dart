import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';

extension ThemeGetter on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
