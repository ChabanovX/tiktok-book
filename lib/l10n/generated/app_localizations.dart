import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru')];

  /// Application title.
  ///
  /// In en, this message translates to:
  /// **'Book Fast Track TT'**
  String get appTitle;

  /// Library screen collection title.
  ///
  /// In en, this message translates to:
  /// **'Personal Collection'**
  String get libraryCollectionTitle;

  /// Primary add-book call to action on the library screen.
  ///
  /// In en, this message translates to:
  /// **'ADD NEW BOOK'**
  String get libraryAddBookCta;

  /// Empty state title when there are no books.
  ///
  /// In en, this message translates to:
  /// **'Your library is empty'**
  String get libraryEmptyTitle;

  /// Empty state description on the library screen.
  ///
  /// In en, this message translates to:
  /// **'Add your first book to\nstart fast reading!'**
  String get libraryEmptyDescription;

  /// Button label in the empty library state.
  ///
  /// In en, this message translates to:
  /// **'Upload a book'**
  String get libraryEmptyButton;

  /// Title shown while the library is loading.
  ///
  /// In en, this message translates to:
  /// **'Preparing your library'**
  String get libraryLoadingTitle;

  /// Description shown while the library is loading.
  ///
  /// In en, this message translates to:
  /// **'Checking saved books and preparing everything for reading.'**
  String get libraryLoadingDescription;

  /// Import error state title.
  ///
  /// In en, this message translates to:
  /// **'Import error'**
  String get libraryImportErrorTitle;

  /// Import error state description.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong\nwhile uploading the book'**
  String get libraryImportErrorDescription;

  /// Retry button label for the import error state.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get libraryImportErrorButton;

  /// Fallback label for the add new book button.
  ///
  /// In en, this message translates to:
  /// **'Add New Book'**
  String get newBookButtonLabel;

  /// Badge label for a finished book.
  ///
  /// In en, this message translates to:
  /// **'FINISHED'**
  String get bookItemFinished;

  /// Delete action label for a book item.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get bookItemDelete;

  /// Fallback book title when none is available.
  ///
  /// In en, this message translates to:
  /// **'Unknown book'**
  String get bookUnknownTitle;

  /// Fallback author when none is available.
  ///
  /// In en, this message translates to:
  /// **'Unknown author'**
  String get bookUnknownAuthor;

  /// Section title for the selected book card.
  ///
  /// In en, this message translates to:
  /// **'Selected book'**
  String get selectedBookTitle;

  /// Action label to start reading the selected book.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get selectedBookRead;

  /// Action label to restart reading a finished book.
  ///
  /// In en, this message translates to:
  /// **'Read again'**
  String get selectedBookReadAgain;

  /// Word count label for a selected book.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 words} one{1 word} other{{count} words}}'**
  String bookWordCount(int count);

  /// Generic reading error message with details.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String readingErrorMessage(String message);

  /// Generic back button label.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// Reading completion dialog title.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get readingCompletedTitle;

  /// Reading completion dialog message.
  ///
  /// In en, this message translates to:
  /// **'You have successfully read the book!'**
  String get readingCompletedMessage;

  /// Reading completion dialog action.
  ///
  /// In en, this message translates to:
  /// **'Great!'**
  String get readingCompletedAction;

  /// Progress label on the reading screen.
  ///
  /// In en, this message translates to:
  /// **'Current progress: {percent}%'**
  String readingProgress(int percent);

  /// Words read label on the reading screen.
  ///
  /// In en, this message translates to:
  /// **'Words read: {count}'**
  String readingWordsRead(int count);

  /// Pause label below the reading control.
  ///
  /// In en, this message translates to:
  /// **'PAUSE'**
  String get readingControlPause;

  /// Play label below the reading control.
  ///
  /// In en, this message translates to:
  /// **'PLAY'**
  String get readingControlPlay;

  /// Exit label below the reading control.
  ///
  /// In en, this message translates to:
  /// **'EXIT'**
  String get readingControlExit;

  /// Semantic label for the pause button.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get startStopPauseSemantic;

  /// Semantic label for the play button.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get startStopPlaySemantic;

  /// Semantic label for the exit reading button.
  ///
  /// In en, this message translates to:
  /// **'Exit reading'**
  String get exitButtonSemantic;

  /// Error shown when there is no text to initialize reading.
  ///
  /// In en, this message translates to:
  /// **'No text available for reading'**
  String get readingErrorEmptyText;

  /// Label for the mock reading demo button.
  ///
  /// In en, this message translates to:
  /// **'Mock: Open reading (demo)'**
  String get mockReadingButtonLabel;

  /// Demo text used in the mock reading flow.
  ///
  /// In en, this message translates to:
  /// **'This is demo text for testing RSVP reading.\nYou can check the animation, word transitions, and playback controls.\nEnjoy fast reading without moving your eyes.\nTry changing the speed using the dropdown.\nTap pause if you need to step away.\nAnd come back to reading at any moment.\nSUPERCALIFRAGILISTICEXPIALIDOCIOUSSUPERCALIFRAGILISTICEXPIALIDOCIOUS'**
  String get mockReadingDemoText;

  /// Book title used in the mock reading flow.
  ///
  /// In en, this message translates to:
  /// **'Demo book'**
  String get mockReadingBookTitle;

  /// Tooltip and accessibility label for opening the settings screen.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get settingsOpenButtonLabel;

  /// Title of the settings page.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// Title of the language settings section.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get settingsLanguageSectionTitle;

  /// Description text on the language settings screen.
  ///
  /// In en, this message translates to:
  /// **'Choose the language used in the interface.'**
  String get settingsLanguageSectionDescription;

  /// Title for the system locale option.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get settingsLanguageSystemTitle;

  /// Title for the English locale option.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglishTitle;

  /// Title for the Russian locale option.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get settingsLanguageRussianTitle;

  /// Title of the theme settings section.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsThemeSectionTitle;

  /// Description text on the theme settings screen.
  ///
  /// In en, this message translates to:
  /// **'Choose how the app theme should look.'**
  String get settingsThemeSectionDescription;

  /// Title for the system theme option.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get settingsThemeSystemTitle;

  /// Title for the light theme option.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLightTitle;

  /// Title for the dark theme option.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDarkTitle;

  /// No description provided for @fullTextTitle.
  ///
  /// In en, this message translates to:
  /// **'Full text'**
  String get fullTextTitle;

  /// No description provided for @readingControlFullText.
  ///
  /// In en, this message translates to:
  /// **'Full text'**
  String get readingControlFullText;

  /// No description provided for @fullTextButtonSemantic.
  ///
  /// In en, this message translates to:
  /// **'View text'**
  String get fullTextButtonSemantic;

  /// Generic cancel action label.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Label for the reading speed control.
  ///
  /// In en, this message translates to:
  /// **'Reading speed'**
  String get readingSpeed;

  /// Generic done action label.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
