// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Book Fast Track TT';

  @override
  String get libraryCollectionTitle => 'Personal Collection';

  @override
  String get libraryAddBookCta => 'ADD NEW BOOK';

  @override
  String get libraryEmptyTitle => 'Your library is empty';

  @override
  String get libraryEmptyDescription => 'Add your first book to\nstart fast reading!';

  @override
  String get libraryEmptyButton => 'Upload a book';

  @override
  String get libraryImportErrorTitle => 'Import error';

  @override
  String get libraryImportErrorDescription => 'Something went wrong\nwhile uploading the book';

  @override
  String get libraryImportErrorButton => 'Try again';

  @override
  String get newBookButtonLabel => 'Add New Book';

  @override
  String get bookItemFinished => 'FINISHED';

  @override
  String get bookItemDelete => 'Delete';

  @override
  String get bookUnknownTitle => 'Unknown book';

  @override
  String get bookUnknownAuthor => 'Unknown author';

  @override
  String get selectedBookTitle => 'Selected book';

  @override
  String get selectedBookRead => 'Read';

  @override
  String bookWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
      zero: '0 words',
    );
    return '$_temp0';
  }

  @override
  String readingErrorMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get commonBack => 'Back';

  @override
  String get readingCompletedTitle => 'Congratulations!';

  @override
  String get readingCompletedMessage => 'You have successfully read the book!';

  @override
  String get readingCompletedAction => 'Great!';

  @override
  String readingProgress(int percent) {
    return 'Current progress: $percent%';
  }

  @override
  String readingWordsRead(int count) {
    return 'Words read: $count';
  }

  @override
  String get readingControlPause => 'PAUSE';

  @override
  String get readingControlPlay => 'PLAY';

  @override
  String get readingControlExit => 'EXIT';

  @override
  String get startStopPauseSemantic => 'Pause';

  @override
  String get startStopPlaySemantic => 'Play';

  @override
  String get exitButtonSemantic => 'Exit reading';

  @override
  String get readingErrorEmptyText => 'No text available for reading';

  @override
  String get mockReadingButtonLabel => 'Mock: Open reading (demo)';

  @override
  String get mockReadingDemoText =>
      'This is demo text for testing RSVP reading.\nYou can check the animation, word transitions, and playback controls.\nEnjoy fast reading without moving your eyes.\nTry changing the speed using the dropdown.\nTap pause if you need to step away.\nAnd come back to reading at any moment.\nSUPERCALIFRAGILISTICEXPIALIDOCIOUSSUPERCALIFRAGILISTICEXPIALIDOCIOUS';

  @override
  String get mockReadingBookTitle => 'Demo book';

  @override
  String get settingsOpenButtonLabel => 'Open settings';

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get settingsLanguageSectionTitle => 'App language';

  @override
  String get settingsLanguageSectionDescription => 'Choose the language used in the interface.';

  @override
  String get settingsLanguageSystemTitle => 'System default';

  @override
  String get settingsLanguageEnglishTitle => 'English';

  @override
  String get settingsLanguageRussianTitle => 'Russian';

  @override
  String get settingsThemeSectionTitle => 'Appearance';

  @override
  String get settingsThemeSectionDescription => 'Choose how the app theme should look.';

  @override
  String get settingsThemeSystemTitle => 'System default';

  @override
  String get settingsThemeLightTitle => 'Light';

  @override
  String get settingsThemeDarkTitle => 'Dark';

  @override
  String get fullTextTitle => 'Full text';

  @override
  String get readingControlFullText => 'Full text';

  @override
  String get fullTextButtonSemantic => 'View text';
}
