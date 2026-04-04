import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/features/file_picking/presentation/ui/pages/main_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
          settings: settings,
        );
        
      case '/reading':
        final args = settings.arguments as ReadingArguments;
        return MaterialPageRoute(
          builder: (_) => ReadingScreen(
            bookTitle: args.bookTitle,
            bookContent: args.bookContent,
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