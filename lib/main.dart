import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/presentation/pages/main_page.dart';


void main() {
  setupServiceLocator();
  runApp(const MainApp());
}

void setupServiceLocator() {
  configureDeps();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
