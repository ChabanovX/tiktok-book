import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';

abstract class FileRepository {
  Future<BookFile?> pickAndLoadFile();
  Future<void> saveFile(BookFile bf);
  Future<BookFile?> loadFileFromLocal(String path);
}
