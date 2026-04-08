import 'package:cross_file/cross_file.dart';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';

@singleton
class FileLoaderService {
  Future<BookFile> loadXFile(XFile file) async {
    final name = file.name;
    final fileExtension = name.contains('.') ? name.split('.').last : '';
    final path = file.path.isEmpty ? 'memory://$name' : file.path;
    final size = await file.length();

    return BookFile(
      name: name,
      path: path,
      fileExtension: fileExtension,
      size: size,
      file: file,
    );
  }

  Future<BookFile> loadFile(String path) async {
    return loadXFile(XFile(path));
  }
}
