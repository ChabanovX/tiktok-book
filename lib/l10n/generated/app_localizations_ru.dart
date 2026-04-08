// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Book Fast Track TT';

  @override
  String get libraryCollectionTitle => 'Личная библиотека';

  @override
  String get libraryAddBookCta => 'ДОБАВИТЬ КНИГУ';

  @override
  String get libraryEmptyTitle => 'В библиотеке пока пусто';

  @override
  String get libraryEmptyDescription => 'Добавьте первую книгу,\nчтобы начать быстрое чтение!';

  @override
  String get libraryEmptyButton => 'Загрузить книгу';

  @override
  String get libraryLoadingTitle => 'Подготавливаем библиотеку';

  @override
  String get libraryLoadingDescription => 'Проверяем сохранённые книги и готовим всё к чтению.';

  @override
  String get libraryImportErrorTitle => 'Ошибка импорта';

  @override
  String get libraryImportErrorDescription => 'Что-то пошло не так\nпри загрузке книги';

  @override
  String get libraryImportErrorButton => 'Попробовать снова';

  @override
  String get newBookButtonLabel => 'Добавить книгу';

  @override
  String get bookItemFinished => 'ПРОЧИТАНО';

  @override
  String get bookItemDelete => 'Удалить';

  @override
  String get bookUnknownTitle => 'Неизвестная книга';

  @override
  String get bookUnknownAuthor => 'Неизвестный автор';

  @override
  String get selectedBookTitle => 'Выбрана книга';

  @override
  String get selectedBookRead => 'Читать';

  @override
  String get selectedBookReadAgain => 'Читать снова';

  @override
  String bookWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слова',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
      zero: '0 слов',
    );
    return '$_temp0';
  }

  @override
  String readingErrorMessage(String message) {
    return 'Ошибка: $message';
  }

  @override
  String get commonBack => 'Назад';

  @override
  String get readingCompletedTitle => 'Поздравляем!';

  @override
  String get readingCompletedMessage => 'Вы успешно дочитали книгу!';

  @override
  String get readingCompletedAction => 'Отлично!';

  @override
  String readingProgress(int percent) {
    return 'Текущий прогресс: $percent%';
  }

  @override
  String readingWordsRead(int count) {
    return 'Слов прочитано: $count';
  }

  @override
  String get readingControlPause => 'ПАУЗА';

  @override
  String get readingControlPlay => 'СТАРТ';

  @override
  String get readingControlExit => 'ВЫХОД';

  @override
  String get startStopPauseSemantic => 'Пауза';

  @override
  String get startStopPlaySemantic => 'Продолжить';

  @override
  String get exitButtonSemantic => 'Выйти из чтения';

  @override
  String get readingErrorEmptyText => 'Нет текста для чтения';

  @override
  String get mockReadingButtonLabel => 'Мок: Открыть чтение (демо)';

  @override
  String get mockReadingDemoText =>
      'Это демонстрационный текст для тестирования RSVP-чтения.\nВы можете проверить анимацию, смену слов и элементы управления.\nНаслаждайтесь быстрым чтением без движения глаз.\nПопробуйте менять скорость через выпадающий список.\nНажмите паузу, если нужно отвлечься.\nИ возвращайтесь к чтению в любой момент.\nБОЛЬШОЕСЛОВОДЛЯПРОВЕРКИБОЛЬШОЕСЛОВОДЛЯПРОВЕРКИБОЛЬШОЕСЛОВОДЛЯПРОВЕРКИ';

  @override
  String get mockReadingBookTitle => 'Демо-книга';

  @override
  String get settingsOpenButtonLabel => 'Открыть настройки';

  @override
  String get settingsPageTitle => 'Настройки';

  @override
  String get settingsLanguageSectionTitle => 'Язык приложения';

  @override
  String get settingsLanguageSectionDescription => 'Выберите язык интерфейса';

  @override
  String get settingsLanguageSystemTitle => 'Как в системе';

  @override
  String get settingsLanguageEnglishTitle => 'English';

  @override
  String get settingsLanguageRussianTitle => 'Русский';

  @override
  String get settingsThemeSectionTitle => 'Оформление';

  @override
  String get settingsThemeSectionDescription => 'Выберите, как должно выглядеть приложение.';

  @override
  String get settingsThemeSystemTitle => 'Как в системе';

  @override
  String get settingsThemeLightTitle => 'Светлая';

  @override
  String get settingsThemeDarkTitle => 'Тёмная';

  @override
  String get settingsReadingSpeedSectionTitle => 'Скорость чтения';

  @override
  String get settingsReadingSpeedSectionDescription =>
      'Выберите скорость по умолчанию, с которой будут начинаться новые сессии чтения.';

  @override
  String get settingsReadingSpeedDefaultTitle => 'Скорость по умолчанию';

  @override
  String get fullTextTitle => 'Полный текст';

  @override
  String get readingControlFullText => 'Текст';

  @override
  String get fullTextButtonSemantic => 'Просмотр текста';

  @override
  String get cancel => 'Отмена';

  @override
  String get readingSpeed => 'Скорость чтения';

  @override
  String get done => 'Готово';
}
