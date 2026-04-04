import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';

class ReadingArguments {
  ReadingArguments({
    required this.tokens,
    required this.bookTitle,
  });
  
  final List<RsvpToken> tokens;
  final String bookTitle;
}
