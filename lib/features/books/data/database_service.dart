import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/core/db/app_database.dart';

@singleton
class BookDbService {
  BookDbService(this._db);

  final AppDatabase _db;

  Future<void> insertBook({
    required String documentId,
    required String bookTitle,
    required int totalWords,
    String? authorName,
    int currentIndex = 0,
  }) async {
    await _db
        .into(_db.books)
        .insert(
          BooksCompanion.insert(
            documentId: documentId,
            authorName: Value(authorName),
            bookTitle: bookTitle,
            currentIndex: Value(currentIndex),
            totalWords: totalWords,
          ),
        );
  }

  Future<Book?> getBook(String id) async {
    final query = _db.select(_db.books)..where((tbl) => tbl.documentId.equals(id));

    return query.getSingleOrNull();
  }

  Future<List<Book>> getAllBooks() async {
    return _db.select(_db.books).get();
  }

  Future<void> updateProgress({
    required String documentId,
    required int currentIndex,
  }) async {
    await (_db.update(_db.books)..where((tbl) => tbl.documentId.equals(documentId))).write(
      BooksCompanion(
        currentIndex: Value(currentIndex),
      ),
    );
  }

  Future<void> deleteBook(String documentId) async {
    await (_db.delete(_db.books)..where((tbl) => tbl.documentId.equals(documentId))).go();
  }
}
