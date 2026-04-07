import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rsvp_flutter_app/core/db/app_database.dart';
import 'package:rsvp_flutter_app/core/logger/logger.dart';
import 'package:rsvp_flutter_app/features/books/data/database_service.dart';
import 'package:rsvp_flutter_app/features/file_picking/data/services/file_loader_service.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';
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
  Future<BookMetaModel> saveFile(
    BookFile bf, {
    List<RsvpToken>? tokens,
  }) async {
    final resolvedTokens = tokens ?? await _buildTokensFromFile(bf);
    final words = resolvedTokens.map((token) => token.text).toList(growable: false);
    final cached = await _cacheService.cacheBook(words);
    await _bookDbService.insertBook(documentId: cached.$1, bookTitle: bf.name, totalWords: cached.$3);
    logger.i('Saved file ${cached.$2}');

    return BookMetaModel(
      bookFile: bf,
      documentId: cached.$1,
      name: bf.name,
      tokens: resolvedTokens,
    );
  }

  @override
  Future<void> deleteBook(BookMetaModel book) async {
    await _bookDbService.deleteBook(book.documentId);
    await _cacheService.deleteBook(book.documentId);
    logger.i('Deleted book ${book.documentId}');
  }

  @override
  Future<List<BookMetaModel>> getAllBooks() async {
    final books = await _bookDbService.getAllBooks();
    return Future.wait(books.map(_buildBookMetaModel));
  }

  Future<BookMetaModel> _buildBookMetaModel(Book book) async {
    final words = await _cacheService.loadBook(book.documentId);
    final cacheFile = await _resolveCacheFile(book.documentId);

    return BookMetaModel(
      bookFile: BookFile(
        name: book.bookTitle,
        path: cacheFile.path,
        fileExtension: _resolveFileExtension(book.bookTitle),
        size: await cacheFile.length(),
        file: cacheFile,
      ),
      documentId: book.documentId,
      name: book.bookTitle,
      currentIndex: book.currentIndex,
      tokens: List.generate(
        words.length,
        (index) => RsvpToken(
          text: words[index],
          index: index,
        ),
      ),
    );
  }

  Future<File> _resolveCacheFile(String documentId) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/cache/$documentId.json');
  }

  Future<List<RsvpToken>> _buildTokensFromFile(BookFile bookFile) async {
    final words = await _converter.convert(bookFile.file);
    return List.generate(
      words.length,
      (index) => RsvpToken(
        text: words[index],
        index: index,
      ),
    );
  }

  String _resolveFileExtension(String fileName) {
    final lastDotIndex = fileName.lastIndexOf('.');
    if (lastDotIndex == -1 || lastDotIndex == fileName.length - 1) {
      return 'json';
    }

    return fileName.substring(lastDotIndex + 1);
  }
}
