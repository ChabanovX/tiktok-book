import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';

@singleton
class FileLoaderService {
  Future<BookFile> loadFile(String path) async {
    final file = File(path);

    if (!file.existsSync()) {
      throw Exception('File not found: $path');
    }

    final name = file.path.split('/').last;
    final fileExtension = name.split('.').last;
    final size = await file.length();

    return BookFile(
      name: name,
      path: path,
      fileExtension: fileExtension,
      size: size,
      file: file
    );
  }

  bool fileExists(String path) {
    return File(path).existsSync();
  }
}
