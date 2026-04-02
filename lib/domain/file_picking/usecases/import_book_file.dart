import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/domain/file_picking/entities/book_file.dart';
import 'package:rsvp_flutter_app/domain/file_picking/repositories/file_repository.dart';

@singleton
class ImportBookFile {
  ImportBookFile(this._fileRepository);

  final FileRepository _fileRepository;
  
  Future<BookFile?> call() async {
    return _fileRepository.pickAndLoadFile();
  }
}
