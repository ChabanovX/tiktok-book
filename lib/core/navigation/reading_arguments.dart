import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_bionic_token.dart';

class ReadingArguments {
  ReadingArguments({
    required this.tokens,
    required this.bookTitle,
  });

  final List<RsvpBionicToken> tokens;
  final String bookTitle;
}
