import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';

@lazySingleton
class TextProcessor {
  List<String> process(String text) {
    return text.replaceAll('\n', ' ').replaceAll(RegExp(r'\s+'), ' ').trim().split(' ');
  }
}
