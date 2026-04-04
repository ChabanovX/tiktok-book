import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/core/navigation/reading_arguments.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';

@singleton
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => navigatorKey.currentState;
  
  Future<T?> push<T extends Object?>(Route<T> route) {
    return _navigator?.push<T>(route) ?? Future.value();
  }
  
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator?.pushNamed<T>(routeName, arguments: arguments) ?? 
           Future.value();
  }
  
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator?.pushReplacementNamed<T, TO>(
      routeName, 
      result: result, 
      arguments: arguments,
    ) ?? Future.value();
  }
  
  void pop<T extends Object?>([T? result]) {
    if (_navigator?.canPop() == true) {
      _navigator?.pop<T>(result);
    }
  }
  
  void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  Future<void> goToReadingScreen({
    required List<RsvpToken> tokens,
    required String bookTitle,
  }) {
    return pushNamed(
      '/reading',
      arguments: ReadingArguments(
        tokens: tokens,
        bookTitle: bookTitle,
      ),
    );
  }

  Future<void> goToMainScreen() {
    return pushNamed('/');
  }
  
  bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }
}
