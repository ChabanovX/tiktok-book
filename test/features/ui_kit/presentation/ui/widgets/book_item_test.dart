import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';

void main() {
  group('BookItem', () {
    testWidgets('shows progress bar and percent while reading', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: const Scaffold(
            body: SizedBox(
              width: 342,
              child: BookItem(
                title: 'Fahrenheit 451',
                author: 'Ray Bradbury',
                progress: 0.82,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Fahrenheit 451'), findsOneWidget);
      expect(find.text('Ray Bradbury'), findsOneWidget);
      expect(find.text('82%'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.text('FINISHED'), findsNothing);
      expect(find.byIcon(Icons.check_rounded), findsNothing);
    });

    testWidgets('shows finished state when progress is complete', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: const Scaffold(
            body: SizedBox(
              width: 342,
              child: BookItem(
                title: 'The Great Gatsby',
                author: 'F. Scott Fitzgerald',
                progress: 1,
              ),
            ),
          ),
        ),
      );

      expect(find.text('The Great Gatsby'), findsOneWidget);
      expect(find.text('F. Scott Fitzgerald'), findsOneWidget);
      expect(find.text('FINISHED'), findsOneWidget);
      expect(find.byIcon(Icons.check_rounded), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.text('100%'), findsNothing);
    });

    testWidgets('calls onTap when the card is tapped', (tester) async {
      var tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: Scaffold(
            body: SizedBox(
              width: 342,
              child: BookItem(
                title: 'Fahrenheit 451',
                author: 'Ray Bradbury',
                progress: 0.82,
                onTap: () => tapCount++,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(BookItem));
      await tester.pump();

      expect(tapCount, 1);
    });
  });
}
