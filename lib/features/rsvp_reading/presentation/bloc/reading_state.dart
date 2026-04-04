part of 'reading_bloc.dart';

@freezed
class ReadingState with _$ReadingState {
  const factory ReadingState.initial() = _Initial;

  const factory ReadingState.ready({
    required List<RsvpToken> tokens,
    required RsvpToken currentToken,
    required int wpm,
    required int totalWords,
    @Default(false) bool isPlaying,
    @Default(false) bool isCompleted,
    @Default(0.0) double progress,
  }) = _Ready;

  const factory ReadingState.error({
    required String message,
  }) = _Error;
}
