import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/core/theme/theme.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';

void main() {
  group('LibraryMainScreen', () {
    testWidgets('renders title, add button and provided book items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: buildLightTheme(),
          home: LibraryMainScreen(
            onAddBookTap: () {},
            bookItems: const [
              BookItem(
                title: 'Fahrenheit 451',
                author: 'Ray Bradbury',
                progress: 0.82,
              ),
              BookItem(
                title: '1984',
                author: 'George Orwell',
                progress: 1,
              ),
            ],
          ),
        ),
      );

      expect(find.text('Personal Collection'), findsOneWidget);
      expect(find.text('ADD NEW BOOK'), findsOneWidget);
      expect(find.text('Fahrenheit 451'), findsOneWidget);
      expect(find.text('1984'), findsOneWidget);
      expect(find.byType(BookItem), findsNWidgets(2));
    });
  });
}
