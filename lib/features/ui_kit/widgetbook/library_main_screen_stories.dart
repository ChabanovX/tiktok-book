import 'package:flutter/material.dart';
import 'package:rsvp_flutter_app/core/theme/build_context_getter.dart';
import 'package:rsvp_flutter_app/features/ui_kit/ui_kit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Non Empty',
  type: LibraryMainScreen,
  path: '[UI Kit]',
)
Widget libraryMainScreenNonEmptyUseCase(BuildContext context) {
  return ColoredBox(
    color: context.appTheme.backgroundColor2,
    child: LibraryMainScreen(
      onAddBookTap: () {
        debugPrint('Add book');
      },
      bookItems: const [
        BookItem(
          title: 'Fahrenheit 451',
          author: 'Ray Bradbury',
          progress: 0.82,
        ),
        BookItem(
          title: 'Fahrenheit 451',
          author: 'Ray Bradbury',
          progress: 0.82,
        ),
        BookItem(
          title: 'The Great Gatsby',
          author: 'F. Scott Fitzgerald',
          progress: 1,
        ),
        BookItem(
          title: '1984',
          author: 'George Orwell',
          progress: 1,
        ),
      ],
    ),
  );
}
