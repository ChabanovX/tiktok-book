import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';

void main() {
  group('ExitButton', () {
    testWidgets('shows close icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: const Scaffold(
            body: Center(
              child: ExitButton(),
            ),
          ),
        ),
      );

      expect(find.byKey(const ValueKey('exit-button-icon')), findsOneWidget);
    });

    testWidgets('calls onTap when pressed', (tester) async {
      var tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: Scaffold(
            body: Center(
              child: ExitButton(
                onTap: () => tapCount++,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ExitButton));
      await tester.pumpAndSettle();

      expect(tapCount, 1);
    });
  });
}
