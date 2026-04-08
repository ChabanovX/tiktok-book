import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/core/db/app_database.dart';
import 'package:rsvp_flutter_app/features/books/data/database_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BookDbService', () {
    late AppDatabase database;
    late BookDbService service;

    setUp(() async {
      database = AppDatabase.forTesting(NativeDatabase.memory());
      service = BookDbService(database);
    });

    tearDown(() async {
      await database.close();
    });

    test('inserts and reads a book', () async {
      await service.insertBook(
        documentId: 'book-1',
        authorName: 'Author',
        bookTitle: 'Title',
        totalWords: 120,
        currentIndex: 7,
      );

      final book = await service.getBook('book-1');

      expect(book, isNotNull);
      expect(book!.documentId, 'book-1');
      expect(book.authorName, 'Author');
      expect(book.bookTitle, 'Title');
      expect(book.totalWords, 120);
      expect(book.currentIndex, 7);
    });

    test('returns all inserted books', () async {
      await service.insertBook(
        documentId: 'book-1',
        bookTitle: 'First',
        totalWords: 100,
      );
      await service.insertBook(
        documentId: 'book-2',
        bookTitle: 'Second',
        totalWords: 200,
      );

      final books = await service.getAllBooks();

      expect(books, hasLength(2));
      expect(books.map((book) => book.documentId), containsAll(['book-1', 'book-2']));
    });

    test('stores default values when optional fields are omitted', () async {
      await service.insertBook(
        documentId: 'book-1',
        bookTitle: 'Title',
        totalWords: 100,
      );

      final book = await service.getBook('book-1');

      expect(book, isNotNull);
      expect(book!.authorName, isNull);
      expect(book.currentIndex, 0);
    });

    test('updates reading progress', () async {
      await service.insertBook(
        documentId: 'book-1',
        bookTitle: 'Title',
        totalWords: 100,
      );

      await service.updateProgress(documentId: 'book-1', currentIndex: 42);

      final book = await service.getBook('book-1');

      expect(book!.currentIndex, 42);
    });

    test('does nothing when updating missing book', () async {
      await service.updateProgress(documentId: 'missing-book', currentIndex: 42);

      final book = await service.getBook('missing-book');

      expect(book, isNull);
    });

    test('deletes a book', () async {
      await service.insertBook(
        documentId: 'book-1',
        bookTitle: 'Title',
        totalWords: 100,
      );

      await service.deleteBook('book-1');

      final book = await service.getBook('book-1');

      expect(book, isNull);
    });

    test('returns null for missing book', () async {
      final book = await service.getBook('missing-book');

      expect(book, isNull);
    });
  });
}
