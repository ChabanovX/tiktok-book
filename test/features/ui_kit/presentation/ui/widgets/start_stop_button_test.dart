import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';

void main() {
  group('StartStopButton', () {
    testWidgets('shows play icon when it is stopped', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: const Scaffold(
            body: Center(
              child: StartStopButton(
                isRunning: false,
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(const ValueKey('start-stop-play-icon')), findsOneWidget);
      expect(find.byKey(const ValueKey('start-stop-pause-icon')), findsNothing);
    });

    testWidgets('shows pause icon when it is running', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: const Scaffold(
            body: Center(
              child: StartStopButton(
                isRunning: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(const ValueKey('start-stop-pause-icon')), findsOneWidget);
      expect(find.byKey(const ValueKey('start-stop-play-icon')), findsNothing);
    });

    testWidgets('calls onTap when pressed', (tester) async {
      var tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: Scaffold(
            body: Center(
              child: StartStopButton(
                isRunning: false,
                onTap: () => tapCount++,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(StartStopButton));
      await tester.pumpAndSettle();

      expect(tapCount, 1);
    });
  });
}
