import 'package:rsvp_flutter_app/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/domain/repositories/file_repository.dart';

class ImportBookFile {
  ImportBookFile(this._fileRepository);

  final FileRepository _fileRepository;
  
  Future<BookFile> call() async {
    final bookFile = await _fileRepository.pickAndLoadFile();
    
    if (bookFile == null) {
      throw Exception('No file selected');
    }
    
    await _fileRepository.saveFileToLocal(bookFile);
    
    return bookFile;
  }
}
