part of 'rsvp_bloc_bloc.dart';

@freezed
class RsvpBlocEvent with _$RsvpBlocEvent {
  const factory RsvpBlocEvent.started() = _Started;
  const factory RsvpBlocEvent.addBook() = _AddBook;
  const factory RsvpBlocEvent.startAnimation({required int bookID}) = _StartAnimation;
}
