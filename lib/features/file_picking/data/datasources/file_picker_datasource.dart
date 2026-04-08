import 'package:cross_file/cross_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@singleton
class FilePickerDataSource {
  Future<FilePickerResult?> pickFile() async {
    return FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'txt'],
      type: FileType.custom,
      withData: true,
    );
  }

  XFile getFileFromResult(FilePickerResult result) => result.xFiles.single;
}
