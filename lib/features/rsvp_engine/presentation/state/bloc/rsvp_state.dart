part of 'rsvp_bloc.dart';

@freezed
abstract class RsvpState with _$RsvpState {
  const factory RsvpState({
    BookMetaModel? selectedBook,
    @Default(false) bool isAddingBook,

    @Default(false) bool isInitializing,

    RSVPError? lastError,

    @Default([]) List<BookMetaModel> books,
  }) = _RsvpState;
}
