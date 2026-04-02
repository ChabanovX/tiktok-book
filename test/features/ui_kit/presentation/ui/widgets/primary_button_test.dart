import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';

void main() {
  group('PrimaryButton', () {
    testWidgets('shows text and default add icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 330,
              child: PrimaryButton(
                text: 'Upload a book',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Upload a book'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('calls onTap when pressed', (tester) async {
      var tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 330,
              child: PrimaryButton(
                text: 'Upload a book',
                onTap: () => tapCount++,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      expect(tapCount, 1);
    });
  });
}
