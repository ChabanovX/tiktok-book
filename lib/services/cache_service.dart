import 'dart:convert';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

@singleton
class CacheService {
  final _uuid = const Uuid();

  Future<(String id, String path, int totalWords)> cacheBook(
    List<String> words,
  ) async {
    final id = _uuid.v4();

    final dir = await getApplicationDocumentsDirectory();
    final cacheDir = Directory('${dir.path}/cache');

    if (!cacheDir.existsSync()) {
      cacheDir.createSync(recursive: true);
    }

    final path = '${cacheDir.path}/$id.json';

    final file = File(path);
    await file.writeAsString(jsonEncode(words));

    return (id, path, words.length);
  }

  Future<List<String>> loadBook(String id) async {
  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/cache/$id.json';

  final file = File(path);

  if (!file.existsSync()) {
    throw Exception('Book file not found');
  }

  final content = await file.readAsString();

  final List<dynamic> decoded = jsonDecode(content) as List;

  final List<String> words = decoded.map((e) => e.toString()).toList();

  return words;
  }

}
