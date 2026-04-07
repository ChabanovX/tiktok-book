import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/core/logger/logger.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_error.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_tokenizer.dart';
import 'package:rsvp_flutter_app/services/book_converter.dart';

part 'rsvp_bloc.freezed.dart';
part 'rsvp_event.dart';
part 'rsvp_state.dart';

@injectable
class RsvpBloc extends Bloc<RsvpEvent, RsvpState> {
  RsvpBloc({
    required FileRepository fileRepository,
    required BookConverter bookConverter,
  }) : _fileRepository = fileRepository,
       _bookConverter = bookConverter,
       super(const _RsvpState(currentPageState: .initial)) {
    on<_Started>(_onStarted);
    on<_AddBook>(_onAddBook);
    on<_RemoveBook>(_onRemoveBook);
    on<_ToggleSelectBook>(_onToggleSelectBook);
    on<_StartAnimation>(_onStartAnimation);
  }

  final FileRepository _fileRepository;
  final BookConverter _bookConverter;

  // @override
  // void onEvent(RsvpEvent event) {
  //   super.onEvent(event);
  //   logger.d('event.hashCode');
  // }

  // @override
  // void onChange(Change<RsvpState> change) {
  //   super.onChange(change);
  //   logger.d('change.currentState');
  // }

  Future<void> _onStarted(_Started event, Emitter<RsvpState> emit) async {
    emit(state.copyWith(currentPageState: .initializing, lastError: null));
    try {
      final cachedBooks = await _fileRepository.getAllBooks();
      logger.d('Retrieved ${cachedBooks.length} cachedBooks.');
      emit(
        state.copyWith(
          books: cachedBooks,
          currentPageState: _getCurrentPageState(newBooks: cachedBooks),
        ),
      );
    } on Exception catch (e) {
      final error = RSVPError.initError(error: e);
      emit(
        state.copyWith(
          currentPageState: _getCurrentPageState(newError: error),
          lastError: error,
        ),
      );
      logger.e(e);
    }
  }

  Future<void> _onAddBook(_AddBook event, Emitter<RsvpState> emit) async {
    emit(state.copyWith(isAddingBook: true, lastError: null, selectedBook: null));
    final BookFile? bookFile;
    try {
      bookFile = await _fileRepository.pickAndLoadFile();
    } on Exception catch (e) {
      logger.e(e);
      emit(state.copyWith(lastError: RSVPError.parsingError(error: e)));
      return;
    }

    if (bookFile == null) {
      logger.d('User aborted picking the file.');
      emit(state.copyWith(isAddingBook: false));
      return;
    }

    logger.d('Successfully picked file. Starting the parsing and syncing...');
    // Here we have additional parsing, which happens 2 times:
    //    - in _fileRepository service
    //    - here.
    //
    // This a little bad, better to parse everything in this method and pass to database
    // ready parsed object, might refactor later.

    // First, we update UI.
    try {
      final words = await _bookConverter.convert(bookFile.file);
      final tokenizer = getIt<RsvpTokenizer>();
      final tokens = tokenizer.tokenizeFromWords(words);
      final books = List<BookMetaModel>.from(state.books)..add(BookMetaModel(bookFile: bookFile, tokens: tokens));
      emit(state.copyWith(books: books));
      logger.d('File is successfully parsed.');
    } on Exception catch (e) {
      logger.e(e);
      emit(state.copyWith(lastError: RSVPError.parsingError(error: e)));
    }

    // Second, we sync with local database.
    try {
      await _fileRepository.saveFile(bookFile);
    } on Exception catch (e) {
      logger.e(e);
      emit(state.copyWith(lastError: const RSVPError.syncingError(type: SyncingErrorType.addingBookError)));
    }

    emit(state.copyWith(currentPageState: _getCurrentPageState()));
  }

  void _onToggleSelectBook(_ToggleSelectBook event, Emitter<RsvpState> emit) {
    final selectedBook = state.selectedBook == event.book ? null : event.book;
    emit(state.copyWith(selectedBook: selectedBook));
  }

  Future<void> _onRemoveBook(_RemoveBook event, Emitter<RsvpState> emit) async {
    try {
      await _fileRepository.deleteBook(event.book);

      final books = List<BookMetaModel>.from(state.books)..remove(event.book);
      final selectedBook = state.selectedBook == event.book ? null : state.selectedBook;

      emit(state.copyWith(books: books, selectedBook: selectedBook, lastError: null));
      emit(state.copyWith(currentPageState: _getCurrentPageState()));
    } on Exception catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          lastError: RSVPError.syncingError(
            type: SyncingErrorType.deletingBookError,
            error: e,
          ),
        ),
      );
      emit(state.copyWith(currentPageState: _getCurrentPageState()));
    }
  }

  void _onStartAnimation(_StartAnimation event, Emitter<RsvpState> emit) {
    // Either simply emit new state with animationShouldStartPlaying = true
  }

  LibraryMainScreenState _getCurrentPageState({
    List<BookMetaModel>? newBooks,
    RSVPError? newError,
  }) {
    final booksFinal = newBooks ?? state.books;
    final errorFinal = newError ?? state.lastError;

    if (errorFinal != null) return .importError;
    if (booksFinal.isNotEmpty) return .nonEmpty;
    return .empty;
  }
}
