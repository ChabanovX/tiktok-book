import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsvp_flutter_app/core/navigation/arguments/full_text_arguments.dart';
import 'package:rsvp_flutter_app/core/navigation/arguments/reading_arguments.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/ui/pages/main_page.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/ui/pages/full_text_screen.dart';
import 'package:rsvp_flutter_app/features/rsvp_reading/presentation/ui/pages/reading_screen.dart';
import 'package:rsvp_flutter_app/features/settings/presentation/ui/pages/settings_page.dart';

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
            book: args.book,
            bookTitle: args.bookTitle,
            rsvpBloc: args.rsvpBloc,
          ),
          settings: settings,
        );

      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
          settings: settings,
        );

      case '/full_text':
        if (settings.arguments is! FullTextArguments) {
          return MaterialPageRoute(
            builder: (_) => const MainScreen(),
            settings: settings,
          );
        }

        final args = settings.arguments! as FullTextArguments;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: args.readingBloc,
            child: FullTextScreen(
              tokens: args.tokens,
            ),
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
