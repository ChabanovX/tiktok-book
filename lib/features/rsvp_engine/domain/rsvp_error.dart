import 'package:freezed_annotation/freezed_annotation.dart';

part 'rsvp_error.freezed.dart';

@freezed
sealed class RSVPError with _$RSVPError {
  const factory RSVPError.pickingError({Object? error, StackTrace? st}) = _PickingError;
  const factory RSVPError.parsingError({Object? error, StackTrace? st}) = _ParsingError;
  const factory RSVPError.initError({Object? error, StackTrace? st}) = _InitError;
}
