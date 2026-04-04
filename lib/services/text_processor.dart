import 'package:injectable/injectable.dart';

@lazySingleton
class TextProcessor {
  List<String> process(String text) {
    return text
        .replaceAllMapped(
          RegExp(r'(\p{L}+)\s*-\s*\n\s*(\p{L}+)', unicode: true),
          (match) => '${match[1]}${match[2]}',
        )
        .replaceAll('\n', ' ')
        .replaceAll(RegExp(r'[^\w\s]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim()
        .split(' ');
  }
}
