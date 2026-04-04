// rsvp_state.dart
part of 'rsvp_bloc.dart';

class RsvpState extends Equatable {
  const RsvpState({
    required this.tokens,
    required this.currentToken,
    required this.wpm,
    required this.isPlaying,
    required this.isCompleted,
    required this.progress,
  });
  
  const RsvpState.initial()
      : tokens = const [],
        currentToken = null,
        wpm = 300,
        isPlaying = false,
        isCompleted = false,
        progress = 0.0;

  final List<RsvpToken> tokens;
  final RsvpToken? currentToken;
  final int wpm;
  final bool isPlaying;
  final bool isCompleted;
  final double progress;
  
  RsvpState copyWith({
    List<RsvpToken>? tokens,
    RsvpToken? currentToken,
    int? wpm,
    bool? isPlaying,
    bool? isCompleted,
    double? progress,
  }) {
    return RsvpState(
      tokens: tokens ?? this.tokens,
      currentToken: currentToken ?? this.currentToken,
      wpm: wpm ?? this.wpm,
      isPlaying: isPlaying ?? this.isPlaying,
      isCompleted: isCompleted ?? this.isCompleted,
      progress: progress ?? this.progress,
    );
  }
  
  @override
  List<Object?> get props => [tokens, currentToken, wpm, isPlaying, isCompleted, progress];
}
