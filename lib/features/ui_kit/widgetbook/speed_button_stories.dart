import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: SpeedButton,
  path: '[UI Kit]',
)
Widget speedButtonDefaultUseCase(BuildContext context) {
  return Container(
    color: context.appTheme.backgroundColor,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    child: SpeedButton(
      wpm: 400,
      onTap: () {},
    ),
  );
}
