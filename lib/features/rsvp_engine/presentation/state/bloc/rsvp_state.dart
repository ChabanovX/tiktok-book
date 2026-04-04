part of 'rsvp_bloc.dart';

@freezed
abstract class RsvpBlocState with _$RsvpBlocState {
  const factory RsvpBlocState({
    BookMetaModel? selectedBook,
    @Default(false) bool isParsing,

    RSVPError? lastParsingError,
  }) = _RsvpBlocState;
}
