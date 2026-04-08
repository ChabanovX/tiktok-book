part of 'reading_bloc.dart';

@freezed
class ReadingEvent with _$ReadingEvent {
  const factory ReadingEvent.initialize({
    required List<RsvpToken> tokens,
    @Default(300) int initialWpm,
  }) = InitializeReadingEvent;

  const factory ReadingEvent.start() = StartReadingEvent;
  const factory ReadingEvent.pause() = PauseReadingEvent;
  const factory ReadingEvent.resume() = ResumeReadingEvent;
  const factory ReadingEvent.next() = NextWordEvent;
  const factory ReadingEvent.previous() = PreviousWordEvent;
  const factory ReadingEvent.changeWpm(int newWpm) = ChangeWpmEvent;
  const factory ReadingEvent.updateCurrentToken(RsvpToken token) = UpdateCurrentTokenEvent;
  const factory ReadingEvent.completed() = ReadingCompletedEvent;
  const factory ReadingEvent.dispose() = DisposeReadingEvent;
  const factory ReadingEvent.jumpToIndex(int index) = JumpToIndexEvent;
}
