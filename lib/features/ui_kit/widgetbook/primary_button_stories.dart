import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: PrimaryButton,
  path: '[UI Kit]',
)
Widget primaryButtonDefaultUseCase(BuildContext context) {
  return Container(
    color: const Color(0xFF1F1F1F),
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    child: SizedBox(
      width: 330,
      child: PrimaryButton(
        text: 'Upload a book',
        onTap: () {},
      ),
    ),
  );
}
