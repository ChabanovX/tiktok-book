import 'package:rsvp_flutter_app/services/legacy_book_cache_store.dart';
import 'package:rsvp_flutter_app/services/legacy_book_cache_store_stub.dart'
    if (dart.library.io) 'package:rsvp_flutter_app/services/legacy_book_cache_store_io.dart'
    as implementation;

LegacyBookCacheStore createLegacyBookCacheStore() => implementation.createLegacyBookCacheStore();
