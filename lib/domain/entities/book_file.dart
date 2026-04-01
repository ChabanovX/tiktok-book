class BookFile {
  BookFile({
    required this.name,
    required this.path,
    required this.extension,
    required this.size,
  });

  final String name;
  final String path;
  final String extension;
  final int size;
  
  bool get isPdf => extension.toLowerCase() == 'pdf';
  bool get isTxt => extension.toLowerCase() == 'txt';
}
