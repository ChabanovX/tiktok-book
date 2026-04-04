// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:rsvp_flutter_app/features/ui_kit/widgetbook/book_item_stories.dart'
    as _rsvp_flutter_app_features_ui_kit_widgetbook_book_item_stories;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookCategory(
    name: 'UI Kit',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'BookItem',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Finished',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_book_item_stories
                    .bookItemFinishedUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Reading',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_book_item_stories
                    .bookItemReadingUseCase,
          ),
        ],
      ),
    ],
  ),
];
