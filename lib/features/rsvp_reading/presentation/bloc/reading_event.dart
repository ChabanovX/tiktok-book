part of 'reading_bloc.dart';

@freezed
class ReadingEvent with _$ReadingEvent {
  const factory ReadingEvent.initialize({
    required List<RsvpBionicToken> tokens,
    @Default(300) int initialWpm,
    @Default(0) int initialIndex,
  }) = InitializeReadingEvent;

  const factory ReadingEvent.start() = StartReadingEvent;
  const factory ReadingEvent.pause() = PauseReadingEvent;
  const factory ReadingEvent.resume() = ResumeReadingEvent;
  const factory ReadingEvent.next() = NextWordEvent;
  const factory ReadingEvent.previous() = PreviousWordEvent;
  const factory ReadingEvent.changeWpm(int newWpm) = ChangeWpmEvent;
  const factory ReadingEvent.updateCurrentToken(RsvpBionicToken token) = UpdateCurrentTokenEvent;
  const factory ReadingEvent.completed() = ReadingCompletedEvent;
  const factory ReadingEvent.dispose() = DisposeReadingEvent;
}
