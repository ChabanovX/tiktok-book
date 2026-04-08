import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/core/db/app_database.dart';
import 'package:rsvp_flutter_app/services/cache_service.dart';
import 'package:rsvp_flutter_app/services/legacy_book_cache_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CacheService', () {
    late CacheService cacheService;
    late AppDatabase database;

    setUp(() async {
      database = AppDatabase.forTesting(NativeDatabase.memory());
      cacheService = CacheService.withDependencies(
        database: database,
        legacyCacheStore: const _FakeLegacyBookCacheStore(),
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('caches words in drift and returns metadata', () async {
      final result = await cacheService.cacheBook(['one', 'two', 'three']);

      expect(result.$1, isNotEmpty);
      expect(result.$2, 'db://book-cache/${result.$1}');
      expect(result.$3, 3);

      expect(await cacheService.loadBook(result.$1), ['one', 'two', 'three']);
    });

    test('loads cached book by id', () async {
      final result = await cacheService.cacheBook(['alpha', 'beta']);

      expect(await cacheService.loadBook(result.$1), ['alpha', 'beta']);
    });

    test('throws when cached book file is missing', () async {
      await expectLater(
        () => cacheService.loadBook('missing-book'),
        throwsA(isA<Exception>()),
      );
    });
  });
}

class _FakeLegacyBookCacheStore implements LegacyBookCacheStore {
  const _FakeLegacyBookCacheStore();

  @override
  Future<void> deleteBook(String id) async {}

  @override
  Future<List<String>?> loadBook(String id) async => null;
}
