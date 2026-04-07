import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';

abstract class FileRepository {
  Future<BookFile?> pickAndLoadFile();
  Future<BookMetaModel> saveFile(
    BookFile bf, {
    List<RsvpToken>? tokens,
  });
  Future<void> updateBookProgress({
    required String documentId,
    required int currentIndex,
  });
  Future<void> deleteBook(BookMetaModel book);
  Future<BookFile?> loadFileFromLocal(String path);
  Future<List<BookMetaModel>> getAllBooks();
}
