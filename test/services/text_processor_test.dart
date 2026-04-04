import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/services/text_processor.dart';

void main() {
  group('TextProcessor', () {
    final textProcessor = TextProcessor();

    test('splits text into normalized words', () {
      final result = textProcessor.process('Hello,\nworld!  This   is\ta test.');

      expect(result, ['Hello', 'world', 'This', 'is', 'a', 'test']);
    });

    test('joins hyphenated words split by line break', () {
      final result = textProcessor.process('trans-\nport and co-\noperate');

      expect(result, ['transport', 'and', 'cooperate']);
    });

    test('removes punctuation and keeps numbers and underscores', () {
      final result = textProcessor.process('Chapter_1: page 42, score=100%.');

      expect(result, ['Chapter_1', 'page', '42', 'score', '100']);
    });

    test('supports unicode words joined across line breaks', () {
      final result = textProcessor.process('пере-\nнос и multi-\nlingual');

      expect(result, ['перенос', 'и', 'multilingual']);
    });

    test('collapses multiple spaces and blank lines', () {
      final result = textProcessor.process('One\n\n\n   two\t\tthree    four');

      expect(result, ['One', 'two', 'three', 'four']);
    });

    test('returns empty list for whitespace only input', () {
      final result = textProcessor.process(' \n\t   ');

      expect(result, isEmpty);
    });
  });
}
