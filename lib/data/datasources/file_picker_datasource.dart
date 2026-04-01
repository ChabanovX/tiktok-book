import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerDataSource {
  Future<FilePickerResult?> pickFile() async {
    return FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'txt'],
      type: FileType.custom,
    );
  }
  
  File getFileFromResult(FilePickerResult result) {
    return File(result.files.single.path!);
  }
}
