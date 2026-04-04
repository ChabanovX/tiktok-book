import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

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
    return navigatorKey.currentState?.pop(result);
  }
  
  void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }
  
  bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }
}
