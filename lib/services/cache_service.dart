import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/core/db/app_database.dart';
import 'package:rsvp_flutter_app/core/di/di.dart';
import 'package:rsvp_flutter_app/services/legacy_book_cache_store.dart';
import 'package:rsvp_flutter_app/services/legacy_book_cache_store_factory.dart';
import 'package:uuid/uuid.dart';

@singleton
class CacheService {
  CacheService()
    : this.withDependencies(
        database: _resolveDatabase(),
        legacyCacheStore: createLegacyBookCacheStore(),
      );

  CacheService.withDependencies({
    required AppDatabase database,
    required LegacyBookCacheStore legacyCacheStore,
  }) : _db = database,
       _legacyCacheStore = legacyCacheStore;

  static AppDatabase _resolveDatabase() {
    if (getIt.isRegistered<AppDatabase>()) {
      return getIt<AppDatabase>();
    }

    return AppDatabase();
  }

  final _uuid = const Uuid();
  final AppDatabase _db;
  final LegacyBookCacheStore _legacyCacheStore;

  Future<(String id, String path, int totalWords)> cacheBook(
    List<String> words,
  ) async {
    final id = _uuid.v4();
    await _upsertBook(id: id, words: words);
    return (id, 'db://book-cache/$id', words.length);
  }

  Future<List<String>> loadBook(String id) async {
    final cachedBook = await (_db.select(_db.bookCaches)..where((tbl) => tbl.documentId.equals(id))).getSingleOrNull();
    if (cachedBook != null) {
      return _decodeWords(cachedBook.wordsJson);
    }

    final legacyWords = await _legacyCacheStore.loadBook(id);
    if (legacyWords != null) {
      await _upsertBook(id: id, words: legacyWords);
      await _legacyCacheStore.deleteBook(id);
      return legacyWords;
    }

    throw Exception('Book file not found');
  }

  Future<void> deleteBook(String id) async {
    await (_db.delete(_db.bookCaches)..where((tbl) => tbl.documentId.equals(id))).go();
    await _legacyCacheStore.deleteBook(id);
  }

  List<String> _decodeWords(String content) {
    final decoded = jsonDecode(content) as List<dynamic>;
    return decoded.map((item) => item.toString()).toList(growable: false);
  }

  Future<void> _upsertBook({
    required String id,
    required List<String> words,
  }) async {
    await _db
        .into(_db.bookCaches)
        .insertOnConflictUpdate(
          BookCachesCompanion.insert(
            documentId: id,
            wordsJson: jsonEncode(words),
          ),
        );
  }
}
