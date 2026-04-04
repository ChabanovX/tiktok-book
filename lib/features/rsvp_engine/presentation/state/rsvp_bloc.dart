import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_engine.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_tokenizer.dart';

part 'rsvp_event.dart';
part 'rsvp_state.dart';

class RsvpBloc extends Bloc<RsvpEvent, RsvpState> {
  RsvpBloc() : super(const RsvpState.initial()) {
    on<LoadTextEvent>(_onLoadText);
    on<StartRsvpEvent>(_onStart);
    on<PauseRsvpEvent>(_onPause);
    on<ResumeRsvpEvent>(_onResume);
    on<NextWordEvent>(_onNext);
    on<PreviousWordEvent>(_onPrevious);
    on<ChangeWpmEvent>(_onChangeWpm);
    on<UpdateCurrentTokenEvent>(_onUpdateToken);
  }

  late RsvpEngine _engine;
  final RsvpTokenizer _tokenizer = RsvpTokenizer();
  
  void _onLoadText(LoadTextEvent event, Emitter<RsvpState> emit) {
    final tokens = _tokenizer.tokenize(event.text);
    _engine = RsvpEngine(
      tokens: tokens,
      wpm: event.initialWpm,
      onTokenChanged: (token) {
        add(UpdateCurrentTokenEvent(token));
      },
      onCompleted: () {
        emit(state.copyWith(isCompleted: true, isPlaying: false));
      },
    );
    
    emit(state.copyWith(
      tokens: tokens,
      currentToken: tokens.isNotEmpty ? tokens.first : null,
      wpm: event.initialWpm,
      isPlaying: false,
      isCompleted: false,
    ));
  }
  
  void _onStart(StartRsvpEvent event, Emitter<RsvpState> emit) {
    _engine.start();
    emit(state.copyWith(isPlaying: true, isCompleted: false));
  }
  
  void _onPause(PauseRsvpEvent event, Emitter<RsvpState> emit) {
    _engine.pause();
    emit(state.copyWith(isPlaying: false));
  }
  
  void _onResume(ResumeRsvpEvent event, Emitter<RsvpState> emit) {
    _engine.resume();
    emit(state.copyWith(isPlaying: true));
  }
  
  void _onNext(NextWordEvent event, Emitter<RsvpState> emit) {
    _engine.next();
  }
  
  void _onPrevious(PreviousWordEvent event, Emitter<RsvpState> emit) {
    _engine.previous();
  }
  
  void _onChangeWpm(ChangeWpmEvent event, Emitter<RsvpState> emit) {
    final wasPlaying = state.isPlaying;
    if (wasPlaying) _engine.pause();
    
    _engine = RsvpEngine(
      tokens: state.tokens,
      wpm: event.newWpm,
      onTokenChanged: (token) {
        add(UpdateCurrentTokenEvent(token));
      },
      onCompleted: () {
        emit(state.copyWith(isCompleted: true, isPlaying: false));
      },
    );
    
    if (wasPlaying && state.currentToken != null) {
      _engine.start(startIndex: state.currentToken!.index);
    }
    
    emit(state.copyWith(wpm: event.newWpm));
  }
  
  void _onUpdateToken(UpdateCurrentTokenEvent event, Emitter<RsvpState> emit) {
    emit(state.copyWith(
      currentToken: event.token,
      progress: state.tokens.isNotEmpty 
          ? event.token.index / state.tokens.length 
          : 0.0,
    ));
  }
  
  @override
  Future<void> close() {
    _engine.dispose();
    return super.close();
  }
}
