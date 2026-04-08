import 'package:cross_file/cross_file.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TxtParser {
  Future<String> parse(XFile file) async {
    return file.readAsString();
  }
}
