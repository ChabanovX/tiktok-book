import 'package:injectable/injectable.dart';

@lazySingleton
class TextProcessor {
  List<String> process(String text) {
    return text.replaceAll('\n', ' ').replaceAll(RegExp(r'\s+'), ' ').trim().split(' ');
  }
}
