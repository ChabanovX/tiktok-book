import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/core/logger/logger.dart';
import 'package:rsvp_flutter_app/features/books/data/database_service.dart';
import 'package:rsvp_flutter_app/features/file_picking/data/services/file_loader_service.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart';
import 'package:rsvp_flutter_app/services/book_converter.dart';
import 'package:rsvp_flutter_app/services/cache_service.dart';

@LazySingleton(as: FileRepository)
class FileRepositoryImpl implements FileRepository {
  FileRepositoryImpl(this._loaderService, this._cacheService, this._converter, this._bookDbService);

  final FileLoaderService _loaderService;
  final CacheService _cacheService;
  final BookConverter _converter;
  final BookDbService _bookDbService;

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

  @override
  Future<void> saveFile(BookFile bf) async {
    final file = File(bf.path);
    final List<String> words = await _converter.convert(file);
    final cached = await _cacheService.cacheBook(words);
    await _bookDbService.insertBook(documentId: cached.$1, bookTitle: bf.name, totalWords: cached.$3);
    logger.i('Saved file ${cached.$2}');
  }
}
