// features/rsvp_reading/presentation/bloc/reading_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_bionic_token.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_engine.dart';

part 'reading_event.dart';
part 'reading_state.dart';
part 'reading_bloc.freezed.dart';

const readingEmptyTextErrorKey = 'reading.emptyText';

@injectable
class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  ReadingBloc() : super(const ReadingState.initial()) {
    on<InitializeReadingEvent>(_onInitialize);
    on<StartReadingEvent>(_onStart);
    on<PauseReadingEvent>(_onPause);
    on<ResumeReadingEvent>(_onResume);
    on<NextWordEvent>(_onNext);
    on<PreviousWordEvent>(_onPrevious);
    on<ChangeWpmEvent>(_onChangeWpm);
    on<UpdateCurrentTokenEvent>(_onUpdateCurrentToken);
    on<ReadingCompletedEvent>(_onReadingCompleted);
    on<DisposeReadingEvent>(_onDispose);
    on<JumpToIndexEvent>(_onJumpToIndex);
  }

  RsvpEngine? _engine;

  Future<void> _onInitialize(
    InitializeReadingEvent event,
    Emitter<ReadingState> emit,
  ) async {
    if (event.tokens.isEmpty) {
      emit(const ReadingState.error(message: readingEmptyTextErrorKey));
      return;
    }

    final initialIndex = _resolveInitialIndex(event.tokens, event.initialIndex);

    _engine = RsvpEngine(
      tokens: event.tokens,
      wpm: event.initialWpm,
      initialIndex: initialIndex,
      onTokenChanged: (token) {
        add(UpdateCurrentTokenEvent(token));
      },
      onCompleted: () {
        add(const ReadingCompletedEvent());
      },
    );

    emit(
      ReadingState.ready(
        tokens: event.tokens,
        currentToken: event.tokens[initialIndex],
        wpm: event.initialWpm,
        totalWords: event.tokens.length,
        progress: _calculateProgress(initialIndex, event.tokens.length),
      ),
    );
  }

  void _onStart(
    StartReadingEvent event,
    Emitter<ReadingState> emit,
  ) {
    _engine?.start();

    state.maybeMap(
      ready: (readyState) {
        emit(readyState.copyWith(isPlaying: true));
      },
      orElse: () {},
    );
  }

  void _onPause(
    PauseReadingEvent event,
    Emitter<ReadingState> emit,
  ) {
    _engine?.pause();

    state.maybeMap(
      ready: (readyState) {
        emit(readyState.copyWith(isPlaying: false));
      },
      orElse: () {},
    );
  }

  void _onResume(
    ResumeReadingEvent event,
    Emitter<ReadingState> emit,
  ) {
    _engine?.resume();

    state.maybeMap(
      ready: (readyState) {
        emit(readyState.copyWith(isPlaying: true));
      },
      orElse: () {},
    );
  }

  void _onNext(
    NextWordEvent event,
    Emitter<ReadingState> emit,
  ) {
    _engine?.next();
  }

  void _onPrevious(
    PreviousWordEvent event,
    Emitter<ReadingState> emit,
  ) {
    _engine?.previous();
  }

  void _onChangeWpm(
    ChangeWpmEvent event,
    Emitter<ReadingState> emit,
  ) {
    state.maybeMap(
      ready: (readyState) {
        final wasPlaying = readyState.isPlaying;
        final currentIndex = _engine?.currentIndex ?? 0;

        if (wasPlaying) {
          _engine?.pause();
        }

        _engine = RsvpEngine(
          tokens: readyState.tokens,
          initialIndex: currentIndex,
          wpm: event.newWpm,
          onTokenChanged: (token) {
            add(UpdateCurrentTokenEvent(token));
          },
          onCompleted: () {
            add(const ReadingCompletedEvent());
          },
        );

        if (wasPlaying) {
          _engine?.start(startIndex: currentIndex);
        }

        emit(
          readyState.copyWith(
            wpm: event.newWpm,
            isPlaying: wasPlaying,
          ),
        );
      },
      orElse: () {},
    );
  }

  void _onUpdateCurrentToken(
    UpdateCurrentTokenEvent event,
    Emitter<ReadingState> emit,
  ) {
    state.maybeMap(
      ready: (readyState) {
        final progress = readyState.totalWords > 0 ? (event.token.index + 1) / readyState.totalWords : 0.0;

        emit(
          readyState.copyWith(
            currentToken: event.token,
            progress: progress,
          ),
        );
      },
      orElse: () {},
    );
  }

  void _onJumpToIndex(
    JumpToIndexEvent event,
    Emitter<ReadingState> emit,
  ) {
    _engine?.jumpTo(event.index);

    state.maybeMap(
      ready: (readyState) {
        final token = readyState.tokens[event.index];

        final progress = (event.index + 1) / readyState.totalWords;

        emit(
          readyState.copyWith(
            currentToken: token,
            progress: progress,
            isCompleted: false,
          ),
        );
      },
      orElse: () {},
    );
  }

  void _onReadingCompleted(
    ReadingCompletedEvent event,
    Emitter<ReadingState> emit,
  ) {
    state.maybeMap(
      ready: (readyState) {
        emit(
          readyState.copyWith(
            isCompleted: true,
            isPlaying: false,
          ),
        );
      },
      orElse: () {},
    );
  }

  void _onDispose(
    DisposeReadingEvent event,
    Emitter<ReadingState> emit,
  ) {
    _engine?.dispose();
    _engine = null;
  }

  @override
  Future<void> close() {
    _engine?.dispose();
    return super.close();
  }

  int _resolveInitialIndex(List<RsvpBionicToken> tokens, int initialIndex) {
    if (tokens.isEmpty) {
      return 0;
    }

    if (initialIndex <= 0) {
      return 0;
    }

    if (initialIndex >= tokens.length) {
      return tokens.length - 1;
    }

    return initialIndex;
  }

  double _calculateProgress(int currentIndex, int totalWords) {
    if (totalWords <= 0 || currentIndex <= 0) {
      return 0.0;
    }

    final progress = (currentIndex + 1) / totalWords;
    if (progress <= 0) return 0.0;
    if (progress >= 1) return 1.0;
    return progress;
  }
}
