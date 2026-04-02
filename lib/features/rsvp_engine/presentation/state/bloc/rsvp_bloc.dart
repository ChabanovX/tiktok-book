import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rsvp_flutter_app/core/logger/logger.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_error.dart';
import 'package:rsvp_flutter_app/services/book_converter.dart';

part 'rsvp_event.dart';
part 'rsvp_state.dart';
part 'rsvp_bloc.freezed.dart';

class RsvpBloc extends Bloc<RsvpBlocEvent, RsvpBlocState> {
  RsvpBloc({
    required FileRepository fileRepository,
    required BookConverter bookConverter,
  }) : _fileRepository = fileRepository,
       _bookConverter = bookConverter,
       super(const _RsvpBlocState()) {
    on<_Started>(_onStarted);
    on<_AddBook>(_onAddBook);
    on<_StartAnimation>(_onStartAnimation);
  }

  final FileRepository _fileRepository;
  final BookConverter _bookConverter;

  void _onStarted(_Started event, Emitter<RsvpBlocState> emit) {}

  Future<void> _onAddBook(_AddBook event, Emitter<RsvpBlocState> emit) async {
    final BookFile? bookFile;
    try {
      bookFile = await _fileRepository.pickAndLoadFile();
    } on Exception catch (e) {
      logger.e(e);
      emit(state.copyWith(lastParsingError: RSVPError.parsingError(error: e)));
      return;
    }

    if (bookFile == null) {
      logger.d('User aborted picking the file.');
      return;
    }

    logger.d('Successfully picked file. Starting the parsing...');
    try {
      final tokens = await _bookConverter.convert(bookFile.file);
      emit(state.copyWith(selectedBook: BookMetaModel(bookFile: bookFile, tokens: tokens)));
      logger.d('File is successfully parsed.');
    } on Exception catch (e) {
      logger.e(e);
      emit(state.copyWith(lastParsingError: RSVPError.parsingError(error: e)));
    }
  }

  void _onStartAnimation(_StartAnimation event, Emitter<RsvpBlocState> emit) {
    // Either simply emit new state with animationShouldStartPlaying = true
  }
}
