import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart';

@singleton
class ImportBookFile {
  ImportBookFile(this._fileRepository);

  final FileRepository _fileRepository;

  Future<BookFile?> call() async {
    final bookFile = await _fileRepository.pickAndLoadFile();
    if (bookFile == null) return null;
    await _fileRepository.saveFile(bookFile);
    return bookFile;
  }
}
