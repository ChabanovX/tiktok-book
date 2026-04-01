import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:rsvp_flutter_app/data/services/file_loader_service.dart';
import 'package:rsvp_flutter_app/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/domain/repositories/file_repository.dart';

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
  Future<String?> saveFileToLocal(BookFile file) async {
    try {
      final sourceFile = File(file.path);
      if (await sourceFile.exists()) {
        return await _loaderService.saveToAppDirectory(sourceFile);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to save file: $e');
    }
  }
  
  @override
  Future<BookFile?> loadFileFromLocal(String path) async {
    try {
      if (await _loaderService.fileExists(path)) {
        return await _loaderService.loadFile(path);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to load file from local: $e');
    }
  }
}
