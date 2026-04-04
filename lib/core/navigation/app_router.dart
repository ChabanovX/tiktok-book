import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/navigation/reading_arguments.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/pages/main_page.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/ui/pages/reading_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
          settings: settings,
        );

      case '/reading':
        if (settings.arguments is! ReadingArguments) {
          return MaterialPageRoute(
            builder: (_) => const MainScreen(),
            settings: settings,
          );
        }

        final args = settings.arguments! as ReadingArguments;
        return MaterialPageRoute(
          builder: (_) => ReadingScreenWrapper(
            tokens: args.tokens,
            bookTitle: args.bookTitle,
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
          settings: settings,
        );
    }
  }
}
