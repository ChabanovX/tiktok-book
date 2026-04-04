import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Reading',
  type: BookItem,
  path: '[UI Kit]',
)
Widget bookItemReadingUseCase(BuildContext context) {
  return Container(
    color: const Color(0xFFF7F9FC),
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    child: const SizedBox(
      width: 342,
      child: BookItem(
        title: 'Fahrenheit 451',
        author: 'Ray Bradbury',
        progress: 0.82,
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Finished',
  type: BookItem,
  path: '[UI Kit]',
)
Widget bookItemFinishedUseCase(BuildContext context) {
  return Container(
    color: const Color(0xFFF7F9FC),
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    child: const SizedBox(
      width: 342,
      child: BookItem(
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        progress: 1,
      ),
    ),
  );
}
