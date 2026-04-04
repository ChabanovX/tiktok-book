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
import 'package:rsvp_flutter_app/features/ui_kit/widgetbook/exit_button_stories.dart'
    as _rsvp_flutter_app_features_ui_kit_widgetbook_exit_button_stories;
import 'package:rsvp_flutter_app/features/ui_kit/widgetbook/library_main_screen_stories.dart'
    as _rsvp_flutter_app_features_ui_kit_widgetbook_library_main_screen_stories;
import 'package:rsvp_flutter_app/features/ui_kit/widgetbook/primary_button_stories.dart'
    as _rsvp_flutter_app_features_ui_kit_widgetbook_primary_button_stories;
import 'package:rsvp_flutter_app/features/ui_kit/widgetbook/reading_screen_stories.dart'
    as _rsvp_flutter_app_features_ui_kit_widgetbook_reading_screen_stories;
import 'package:rsvp_flutter_app/features/ui_kit/widgetbook/start_stop_button_stories.dart'
    as _rsvp_flutter_app_features_ui_kit_widgetbook_start_stop_button_stories;
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
      _widgetbook.WidgetbookComponent(
        name: 'ExitButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_exit_button_stories
                    .exitButtonDefaultUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'LibraryMainScreen',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Empty',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_library_main_screen_stories
                    .libraryMainScreenEmptyUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Import Error',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_library_main_screen_stories
                    .libraryMainScreenImportErrorUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Non Empty',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_library_main_screen_stories
                    .libraryMainScreenNonEmptyUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'PrimaryButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_primary_button_stories
                    .primaryButtonDefaultUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'ReadingScreen',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Paused',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_reading_screen_stories
                    .readingScreenPausedUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Reading',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_reading_screen_stories
                    .readingScreenReadingUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'StartStopButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Running',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_start_stop_button_stories
                    .startStopButtonRunningUseCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Stopped',
            builder:
                _rsvp_flutter_app_features_ui_kit_widgetbook_start_stop_button_stories
                    .startStopButtonStoppedUseCase,
          ),
        ],
      ),
    ],
  ),
];
