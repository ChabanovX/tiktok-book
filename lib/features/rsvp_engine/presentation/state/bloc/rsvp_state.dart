part of 'rsvp_bloc.dart';

@freezed
abstract class RsvpState with _$RsvpState {
  const factory RsvpState({
    required LibraryMainScreenState currentPageState,
    BookMetaModel? selectedBook,
    @Default(false) bool isAddingBook,

    RSVPError? lastError,

    @Default([]) List<BookMetaModel> books,
  }) = _RsvpState;
}

enum LibraryMainScreenState { initial, nonEmpty, empty, importError, initializing }
