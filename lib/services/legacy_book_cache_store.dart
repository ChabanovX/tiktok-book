abstract class LegacyBookCacheStore {
  Future<List<String>?> loadBook(String id);

  Future<void> deleteBook(String id);
}
