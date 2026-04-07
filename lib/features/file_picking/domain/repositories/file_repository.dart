import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';

abstract class FileRepository {
  Future<BookFile?> pickAndLoadFile();
  Future<void> saveFile(BookFile bf);
  Future<void> deleteBook(BookMetaModel book);
  Future<BookFile?> loadFileFromLocal(String path);
  Future<List<BookMetaModel>> getAllBooks();
}
