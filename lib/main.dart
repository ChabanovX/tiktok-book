import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/app.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';

void main() {
  setupServiceLocator();
  runApp(const MainApp());
}

void setupServiceLocator() {
  configureDeps();
}
