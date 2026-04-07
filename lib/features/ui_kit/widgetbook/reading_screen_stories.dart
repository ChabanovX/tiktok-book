import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Reading',
  type: ReadingScreen,
  path: '[UI Kit]',
)
Widget readingScreenReadingUseCase(BuildContext context) {
  return ReadingScreen(
    state: ReadingScreenState.reading,
    currentWord: 'SomeWord',
    bookTitle: 'Brave New World',
    progress: 0.67,
    wordsRead: 6969,
    onStartStopTap: () {},
    onExitTap: () {},
    wpm: 400,
  );
}

@widgetbook.UseCase(
  name: 'Paused',
  type: ReadingScreen,
  path: '[UI Kit]',
)
Widget readingScreenPausedUseCase(BuildContext context) {
  return ReadingScreen(
    state: ReadingScreenState.paused,
    currentWord: 'SomeWord',
    bookTitle: 'Brave New World',
    progress: 0.67,
    wordsRead: 6969,
    onStartStopTap: () {},
    onExitTap: () {},
    wpm: 400,
  );
}
