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
       super(const _RsvpState()) {
    on<_Started>(_onStarted);
    on<_AddBook>(_onAddBook);
    on<_RemoveBook>(_onRemoveBook);
    on<_ToggleSelectBook>(_onToggleSelectBook);
    on<_StartAnimation>(_onStartAnimation);
  }

  final FileRepository _fileRepository;
  final BookConverter _bookConverter;

  Future<void> _onStarted(_Started event, Emitter<RsvpState> emit) async {
    emit(state.copyWith(isInitializing: true, lastError: null));
    try {
      final cachedBooks = await _fileRepository.getAllBooks();
      logger.d('Retrieved ${cachedBooks.length} cachedBooks.');
      emit(state.copyWith(books: cachedBooks));
    } on Exception catch (e) {
      emit(state.copyWith(lastError: RSVPError.initError(error: e)));
      logger.e(e);
    } finally {
      emit(state.copyWith(isInitializing: false));
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
      final tokens = List.generate(
        words.length,
        (index) => RsvpToken(
          text: words[index],
          index: index,
        ),
      );
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
  }

  void _onToggleSelectBook(_ToggleSelectBook event, Emitter<RsvpState> emit) {
    final selectedBook = state.selectedBook == event.book ? null : event.book;
    emit(state.copyWith(selectedBook: selectedBook));
  }

  void _onRemoveBook(_RemoveBook event, Emitter<RsvpState> emit) {
    final books = List<BookMetaModel>.from(state.books)..remove(event.book);
    final selectedBook = state.selectedBook == event.book ? null : state.selectedBook;

    emit(
      state.copyWith(
        books: books,
        selectedBook: selectedBook,
      ),
    );
  }

  void _onStartAnimation(_StartAnimation event, Emitter<RsvpState> emit) {
    // Either simply emit new state with animationShouldStartPlaying = true
  }
}
