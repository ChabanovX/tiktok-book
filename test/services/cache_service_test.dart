import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/services/cache_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('plugins.flutter.io/path_provider');

  group('CacheService', () {
    late CacheService cacheService;
    late Directory tempDir;

    setUp(() async {
      cacheService = CacheService();
      tempDir = await Directory.systemTemp.createTemp('cache_service_test');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
        methodCall,
      ) async {
        if (methodCall.method == 'getApplicationDocumentsDirectory') {
          return tempDir.path;
        }
        return null;
      });
    });

    tearDown(() async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        channel,
        null,
      );

      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('caches words to json file and returns metadata', () async {
      final result = await cacheService.cacheBook(['one', 'two', 'three']);

      expect(result.$1, isNotEmpty);
      expect(result.$2, endsWith('.json'));
      expect(result.$3, 3);

      final file = File(result.$2);
      expect(file.existsSync(), isTrue);
      expect(jsonDecode(await file.readAsString()), ['one', 'two', 'three']);
    });

    test('loads cached book by id', () async {
      final cacheDir = Directory('${tempDir.path}/cache')..createSync(recursive: true);
      final file = File('${cacheDir.path}/book-1.json');
      await file.writeAsString(jsonEncode(['alpha', 'beta']));

      final result = await cacheService.loadBook('book-1');

      expect(result, ['alpha', 'beta']);
    });

    test('throws when cached book file is missing', () async {
      await expectLater(
        () => cacheService.loadBook('missing-book'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
