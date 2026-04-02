import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/data/services/file_loader_service.dart';
import 'package:rsvp_flutter_app/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/domain/repositories/file_repository.dart';

@LazySingleton(as: FileRepository)
class FileRepositoryImpl implements FileRepository {
  FileRepositoryImpl(this._loaderService);

  final FileLoaderService _loaderService;
  
  @override
  Future<BookFile?> pickAndLoadFile() async {
    try {
      // Выбор файла через системный пикер
      final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'txt'],
        type: FileType.custom,
      );
      
      if (result != null && result.files.single.path != null) {
        final path = result.files.single.path!;
        return await _loaderService.loadFile(path);
      }
      
      return null;
    } catch (e) {
      throw Exception('Failed to pick file: $e');
    }
  }
  
  @override
  Future<BookFile?> loadFileFromLocal(String path) async {
    try {
      if (_loaderService.fileExists(path)) {
        return await _loaderService.loadFile(path);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to load file from local: $e');
    }
  }
}
