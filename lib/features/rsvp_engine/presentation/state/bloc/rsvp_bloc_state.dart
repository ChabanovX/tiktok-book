part of 'rsvp_bloc_bloc.dart';

@freezed
abstract class RsvpBlocState with _$RsvpBlocState {
  const factory RsvpBlocState({
    BookModel? selectedBook,
  }) = _RsvpBlocState;
}
