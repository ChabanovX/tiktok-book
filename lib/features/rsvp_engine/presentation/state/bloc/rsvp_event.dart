part of 'rsvp_bloc.dart';

@freezed
class RsvpEvent with _$RsvpEvent {
  const factory RsvpEvent.started() = _Started;
  const factory RsvpEvent.addBook() = _AddBook;
  const factory RsvpEvent.toggleSelectBook({required BookMetaModel book}) = _ToggleSelectBook;
  const factory RsvpEvent.startAnimation({required int bookID}) = _StartAnimation;
}
