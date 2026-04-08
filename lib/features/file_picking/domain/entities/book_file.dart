import 'package:cross_file/cross_file.dart';

class BookFile {
  BookFile({
    required this.name,
    required this.path,
    required this.fileExtension,
    required this.size,
    required this.file,
  });

  final String name;
  final String path;
  final String fileExtension;
  final XFile file;
  final int size;

  bool get isPdf => fileExtension.toLowerCase() == 'pdf';
  bool get isTxt => fileExtension.toLowerCase() == 'txt';
}
