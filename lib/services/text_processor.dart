import 'package:injectable/injectable.dart';

@lazySingleton
class TextProcessor {
  List<String> process(String text) {
    final normalized = text
        .replaceAllMapped(
          RegExp(r'(\p{L}+)\s*-\s*\n\s*(\p{L}+)', unicode: true),
          (match) => '${match[1]}${match[2]}',
        )
        .replaceAll('\n', ' ')
        .replaceAll(RegExp(r'[^\p{L}\p{N}_\s]', unicode: true), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    if (normalized.isEmpty) {
      return [];
    }

    return normalized.split(' ');
  }
}
