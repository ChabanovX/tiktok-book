part of 'rsvp_bloc.dart';

@freezed
abstract class RsvpState with _$RsvpState {
  const factory RsvpState({
    BookMetaModel? selectedBook,
    @Default(false) bool isParsing,

    RSVPError? lastError,

    @Default([]) List<BookMetaModel> books,
  }) = _RsvpState;
}
