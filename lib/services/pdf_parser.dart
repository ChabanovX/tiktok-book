import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfParser {
  Future<String> parse(File file) async {
    final bytes = await file.readAsBytes();

    final document = PdfDocument(inputBytes: bytes);
    final text = PdfTextExtractor(document).extractText();

    document.dispose();

    return text;
  }
}
