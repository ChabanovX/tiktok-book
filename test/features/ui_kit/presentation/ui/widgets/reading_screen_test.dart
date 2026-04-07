import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';

void main() {
  group('ReadingScreen', () {
    testWidgets('renders reading state with pause control', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: const ReadingScreen(
            state: ReadingScreenState.reading,
            currentWord: RsvpToken(boldText: 'He', semiboldText: 'll', regularRext: 'oo', index: 0),
            bookTitle: 'Brave New World',
            progress: 0.67,
            wordsRead: 6969,
          ),
        ),
      );

      expect(find.text('SomeWord'), findsOneWidget);
      expect(find.text('Brave New World'), findsOneWidget);
      expect(find.text('Current progress: 67%'), findsOneWidget);
      expect(find.text('Words read: 6969'), findsOneWidget);
      expect(find.text('PAUSE'), findsOneWidget);
      expect(find.text('EXIT'), findsOneWidget);
      expect(find.byType(StartStopButton), findsOneWidget);
      expect(find.byType(ExitButton), findsOneWidget);
      expect(find.byKey(const ValueKey('start-stop-pause-icon')), findsOneWidget);
    });

    testWidgets('renders paused state with play control', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: const ReadingScreen(
            state: ReadingScreenState.paused,
            currentWord: RsvpToken(boldText: 'He', semiboldText: 'll', regularRext: 'oo', index: 0),
            bookTitle: 'Brave New World',
            progress: 0.67,
            wordsRead: 6969,
          ),
        ),
      );

      expect(find.text('PLAY'), findsOneWidget);
      expect(find.byKey(const ValueKey('start-stop-play-icon')), findsOneWidget);
    });

    testWidgets('calls control callbacks', (tester) async {
      var startStopTapCount = 0;
      var exitTapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: ReadingScreen(
            state: ReadingScreenState.reading,
            currentWord: const RsvpToken(boldText: 'He', semiboldText: 'll', regularRext: 'oo', index: 0),
            bookTitle: 'Brave New World',
            progress: 0.67,
            wordsRead: 6969,
            onStartStopTap: () => startStopTapCount++,
            onExitTap: () => exitTapCount++,
          ),
        ),
      );

      await tester.tap(find.byType(StartStopButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ExitButton));
      await tester.pumpAndSettle();

      expect(startStopTapCount, 1);
      expect(exitTapCount, 1);
    });
  });
}
