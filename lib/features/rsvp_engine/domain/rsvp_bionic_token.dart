import 'package:freezed_annotation/freezed_annotation.dart';

part 'rsvp_bionic_token.freezed.dart';

@freezed
abstract class RsvpBionicToken with _$RsvpBionicToken {
  const factory RsvpBionicToken({
    required String boldText,
    required String semiboldText,
    required String regularText,
    required int index,
  }) = _RsvpBionicToken;
}
