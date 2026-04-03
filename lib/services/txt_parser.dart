import 'dart:io';
import 'package:injectable/injectable.dart';

@lazySingleton
class TxtParser {
  Future<String> parse(File file) async {
    return file.readAsString();
  }
}
