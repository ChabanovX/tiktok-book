import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/navigation/app_router.dart';
import 'package:rsvp_flutter_app/core/navigation/navigation_service.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/l10n/l10n.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ru'),
      // locale: const Locale('en')
      onGenerateTitle: (context) => context.l10n.appTitle,
      navigatorKey: getIt<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/',
      theme: buildLightTheme(),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
