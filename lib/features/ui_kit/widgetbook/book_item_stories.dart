import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Reading',
  type: BookItem,
  path: '[UI Kit]',
)
Widget bookItemReadingUseCase(BuildContext context) {
  return Container(
    color: context.appTheme.backgroundColor,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    child: SizedBox(
      width: 342,
      child: BookItem(
        title: 'Fahrenheit 451',
        author: 'Ray Bradbury',
        progress: 0.82,
        onTap: () {},
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
    color: context.appTheme.backgroundColor,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    child: SizedBox(
      width: 342,
      child: BookItem(
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        progress: 1,
        onTap: () {},
      ),
    ),
  );
}
