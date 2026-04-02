import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';

class RsvpTokenizer {
  List<RsvpToken> tokenize(String text) {
    final words = text.split(RegExp(r'\s+')).where((word) => word.trim().isNotEmpty).toList();

    return List.generate(
      words.length,
      (index) => RsvpToken(
        text: words[index],
        index: index,
      ),
    );
  }
}
