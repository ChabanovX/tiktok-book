class BookFile {
  BookFile({
    required this.name,
    required this.path,
    required this.fileExtension,
    required this.size,
  });

  final String name;
  final String path;
  final String fileExtension;
  final int size;

  bool get isPdf => fileExtension.toLowerCase() == 'pdf';
  bool get isTxt => fileExtension.toLowerCase() == 'txt';
}
