import 'package:rsvp_flutter_app/domain/entities/book_file.dart';

abstract class FileRepository {
  Future<BookFile?> pickAndLoadFile();
  Future<BookFile?> loadFileFromLocal(String path);
}
