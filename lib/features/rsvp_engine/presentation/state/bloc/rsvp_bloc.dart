import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/core/logger/logger.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_error.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';
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
    on<_UpdateBookProgress>(_onUpdateBookProgress);
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
      final error = RSVPError.parsingError(error: e);
      emit(
        state.copyWith(
          isAddingBook: false,
          lastError: error,
          currentPageState: _getCurrentPageState(newError: error),
        ),
      );
      return;
    }

    if (bookFile == null) {
      logger.d('User aborted picking the file.');
      emit(state.copyWith(isAddingBook: false));
      return;
    }

    logger.d('Successfully picked file. Starting the parsing...');
    final List<RsvpToken> tokens;
    try {
      final words = await _bookConverter.convert(bookFile.file);
      tokens = List.generate(
        words.length,
        (index) => RsvpToken(
          text: words[index],
          index: index,
        ),
      );
    } on Exception catch (e) {
      logger.e(e);
      final error = RSVPError.parsingError(error: e);
      emit(
        state.copyWith(
          isAddingBook: false,
          lastError: error,
          currentPageState: _getCurrentPageState(newError: error),
        ),
      );
      return;
    }

    logger.d('Successfully parsed file. Starting the syncing...');
    try {
      final savedBook = await _fileRepository.saveFile(bookFile, tokens: tokens);
      final books = List<BookMetaModel>.from(state.books)..add(savedBook);
      emit(
        state.copyWith(
          books: books,
          isAddingBook: false,
          lastError: null,
          currentPageState: _getCurrentPageState(newBooks: books),
        ),
      );
      logger.d('File is successfully parsed and synced.');
    } on Exception catch (e) {
      logger.e(e);
      final error = RSVPError.syncingError(type: SyncingErrorType.addingBookError, error: e);
      emit(
        state.copyWith(
          isAddingBook: false,
          lastError: error,
          currentPageState: _getCurrentPageState(newError: error),
        ),
      );
    }
  }

  Future<void> _onUpdateBookProgress(_UpdateBookProgress event, Emitter<RsvpState> emit) async {
    final bookIndex = state.books.indexWhere((book) => book.documentId == event.documentId);
    if (bookIndex == -1) {
      return;
    }

    final currentBook = state.books[bookIndex];
    if (currentBook.currentIndex == event.currentIndex) {
      return;
    }

    try {
      await _fileRepository.updateBookProgress(
        documentId: event.documentId,
        currentIndex: event.currentIndex,
      );

      final updatedBook = currentBook.copyWith(currentIndex: event.currentIndex);
      final books = List<BookMetaModel>.from(state.books)..[bookIndex] = updatedBook;
      final selectedBook = state.selectedBook?.documentId == updatedBook.documentId ? updatedBook : state.selectedBook;

      emit(
        state.copyWith(
          books: books,
          selectedBook: selectedBook,
          lastError: null,
          currentPageState: _getCurrentPageState(newBooks: books),
        ),
      );
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  void _onToggleSelectBook(_ToggleSelectBook event, Emitter<RsvpState> emit) {
    final selectedBook = state.selectedBook?.documentId == event.book.documentId ? null : event.book;
    emit(state.copyWith(selectedBook: selectedBook));
  }

  Future<void> _onRemoveBook(_RemoveBook event, Emitter<RsvpState> emit) async {
    try {
      await _fileRepository.deleteBook(event.book);

      final books = List<BookMetaModel>.from(state.books)
        ..removeWhere((book) => book.documentId == event.book.documentId);
      final selectedBook = state.selectedBook?.documentId == event.book.documentId ? null : state.selectedBook;

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
