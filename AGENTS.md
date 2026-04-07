# Repository Guidelines

## Project Structure & Module Organization
`lib/` contains the application code. Shared infrastructure lives in `lib/core/` (`di/`, `theme/`, `logger/`, `db/`). Feature code is organized under `lib/features/` by slice, with `data/`, `domain/`, and `presentation/` layers in folders such as `file_picking/`, `rsvp_engine/`, and `ui_kit/`. Cross-feature parsing and conversion helpers live in `lib/services/`. Widgetbook uses `lib/widgetbook.dart`, with stories under `lib/features/ui_kit/widgetbook/`. Tests mirror source paths under `test/`. Bundled assets currently live in `assets/fonts/`.

## Build, Test, and Development Commands
Run `flutter pub get` after dependency changes. Use `flutter run` to launch the main app from `lib/main.dart`. Use `flutter run -t lib/widgetbook.dart` to work on isolated UI stories. Run `flutter analyze` to apply `very_good_analysis` and `bloc_lint`. Run `flutter test` for the full suite, or target a file such as `flutter test test/features/ui_kit/presentation/ui/widgets/primary_button_test.dart`. Format non-generated Dart files with `tool/format_dart.sh` or verify formatting with `tool/format_dart.sh --check`.

## Coding Style & Naming Conventions
Follow `analysis_options.yaml`: 2-space indentation, 120-column page width, and formatter-managed trailing commas. Keep filenames in `snake_case.dart`, types in `PascalCase`, and members in `camelCase`. Preserve established suffixes such as `_bloc.dart`, `_state.dart`, `_event.dart`, `_test.dart`, and `_stories.dart`. Do not hand-edit generated files like `*.g.dart`, `*.freezed.dart`, `*.config.dart`, `*.tailor.dart`, or `lib/widgetbook.directories.g.dart`.

## Testing Guidelines
Use `flutter_test` for widget and unit coverage. Place tests in the matching feature path and end filenames with `_test.dart`. Prefer behavior-driven test names such as `testWidgets('calls onTap when pressed', ...)`. Add or update tests for UI behavior, BLoC state changes, and parsing/database logic when those areas change. Do not write tests unless explicitly asked.

## Generated Code, Commits, and Pull Requests
Run `dart run build_runner build --delete-conflicting-outputs` after changing Freezed, Injectable, Drift, Theme Tailor, or Widgetbook-annotated code. Recent history favors short, imperative commit subjects; merged commits often append the PR number, for example `Fix generated files formatting (#25)`. Keep commits focused. PRs should summarize user impact, list verification steps (`flutter analyze`, `flutter test`), link the related issue or task, and include screenshots for visible UI changes.

## Response Conventions
When referencing files in assistant responses, use relative repository paths in both the visible markdown link label and the target, for example `[lib/features/example/example.dart](lib/features/example/example.dart)` or with an anchor such as `[lib/features/example/example.dart](lib/features/example/example.dart#L12)`. Do not use absolute filesystem paths in markdown links.
