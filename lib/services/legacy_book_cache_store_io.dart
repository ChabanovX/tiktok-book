import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rsvp_flutter_app/services/legacy_book_cache_store.dart';

LegacyBookCacheStore createLegacyBookCacheStore() => const _IoLegacyBookCacheStore();

class _IoLegacyBookCacheStore implements LegacyBookCacheStore {
  const _IoLegacyBookCacheStore();

  @override
  Future<void> deleteBook(String id) async {
    final file = await _resolveFile(id);
    if (file.existsSync()) {
      await file.delete();
    }
  }

  @override
  Future<List<String>?> loadBook(String id) async {
    final file = await _resolveFile(id);
    if (!file.existsSync()) {
      return null;
    }

    final content = await file.readAsString();
    final decoded = jsonDecode(content) as List<dynamic>;
    return decoded.map((item) => item.toString()).toList(growable: false);
  }

  Future<File> _resolveFile(String id) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/cache/$id.json');
  }
}
