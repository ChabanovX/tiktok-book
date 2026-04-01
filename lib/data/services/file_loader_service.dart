import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:rsvp_flutter_app/domain/entities/book_file.dart';

class FileLoaderService {
  
  Future<BookFile> loadFile(String path) async {
    final file = File(path);
    
    if (!await file.exists()) {
      throw Exception('File not found: $path');
    }
    
    final name = file.path.split('/').last;
    final extension = name.split('.').last;
    final size = await file.length();
    
    return BookFile(
      name: name,
      path: path,
      extension: extension,
      size: size,
    );
  }
  
  Future<String> saveToAppDirectory(File file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final booksDir = Directory('${appDir.path}/books');
    
    if (!await booksDir.exists()) {
      await booksDir.create(recursive: true);
    }
    
    final fileName = file.path.split('/').last;
    final newPath = '${booksDir.path}/$fileName';
    
    final savedFile = await file.copy(newPath);
    return savedFile.path;
  }
  
  Future<bool> fileExists(String path) async {
    return File(path).exists();
  }
}
