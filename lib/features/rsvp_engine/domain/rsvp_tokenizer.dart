import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_bionic_token.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';

@singleton
class RsvpTokenizer {
  const RsvpTokenizer();

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

  List<RsvpBionicToken> tokenizeBionicFromWords(
    List<String> words, {
    double boldPercentage = 0.20,
    double semiboldPercentage = 0.15,
  }) {
    return List.generate(
      words.length,
      (index) => RsvpBionicToken(
        boldText: _getBoldPart(words[index], boldPercentage),
        semiboldText: _getSemiboldPart(words[index], boldPercentage, semiboldPercentage),
        regularText: _getRegularPart(words[index], boldPercentage, semiboldPercentage),
        index: index,
      ),
    );
  }

  String _getBoldPart(String word, double boldPercentage) {
    if (word.isEmpty) return '';

    final boldLength = _calculateLength(word.length, boldPercentage);
    return word.substring(0, boldLength);
  }

  String _getSemiboldPart(String word, double boldPercentage, double semiboldPercentage) {
    if (word.isEmpty) return '';

    final boldLength = _calculateLength(word.length, boldPercentage);
    final semiboldLength = _calculateLength(word.length, semiboldPercentage);
    final totalLength = boldLength + semiboldLength;

    if (totalLength >= word.length) {
      return '';
    }

    return word.substring(boldLength, totalLength);
  }

  String _getRegularPart(String word, double boldPercentage, double semiboldPercentage) {
    if (word.isEmpty) return '';

    final boldLength = _calculateLength(word.length, boldPercentage);
    final semiboldLength = _calculateLength(word.length, semiboldPercentage);
    final totalLength = boldLength + semiboldLength;

    if (totalLength >= word.length) {
      return '';
    }

    return word.substring(totalLength);
  }

  int _calculateLength(int wordLength, double percentage) {
    if (wordLength <= 1) return wordLength;

    final length = (wordLength * percentage).round();
    return length.clamp(1, wordLength);
  }
}
