import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Stopped',
  type: StartStopButton,
  path: '[UI Kit]',
)
Widget startStopButtonStoppedUseCase(BuildContext context) {
  return Container(
    color: const Color(0xFF1F1F1F),
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    child: StartStopButton(
      isRunning: false,
      onTap: () {},
    ),
  );
}

@widgetbook.UseCase(
  name: 'Running',
  type: StartStopButton,
  path: '[UI Kit]',
)
Widget startStopButtonRunningUseCase(BuildContext context) {
  return Container(
    color: const Color(0xFF1F1F1F),
    alignment: Alignment.center,
    padding: const EdgeInsets.all(24),
    child: StartStopButton(
      isRunning: true,
      onTap: () {},
    ),
  );
}
