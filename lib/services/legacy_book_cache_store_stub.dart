import 'package:rsvp_flutter_app/services/legacy_book_cache_store.dart';

LegacyBookCacheStore createLegacyBookCacheStore() => const _NoopLegacyBookCacheStore();

class _NoopLegacyBookCacheStore implements LegacyBookCacheStore {
  const _NoopLegacyBookCacheStore();

  @override
  Future<void> deleteBook(String id) async {}

  @override
  Future<List<String>?> loadBook(String id) async => null;
}
