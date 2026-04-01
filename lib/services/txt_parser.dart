import 'dart:io';

class TxtParser {
  Future<String> parse(File file) async {
    return file.readAsString();
  }
}
