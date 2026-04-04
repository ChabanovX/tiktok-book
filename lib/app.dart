import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/navigation/app_router.dart';
import 'package:rsvp_flutter_app/core/navigation/navigation_service.dart';

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
}
