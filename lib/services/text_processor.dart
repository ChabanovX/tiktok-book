import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';

class TextProcessor {
  List<RsvpToken> process(String rawText) {
    final List<RsvpToken> result = [];

    final splittedText = rawText.replaceAll('\n', ' ').replaceAll(RegExp(r'\s+'), ' ').trim().split(' ');
    for (int i = 0; i < splittedText.length; i++) {
      result.add(RsvpToken(text: splittedText[i], index: i));
    }
    return result;
  }
}
