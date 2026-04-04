import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/core/logger/logger.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

@lazySingleton
class PdfParser {
  Future<String> parse(File file) async {
    final bytes = await file.readAsBytes();

    final document = PdfDocument(inputBytes: bytes);
    final text = PdfTextExtractor(document).extractText(layoutText: true);

    logger.i('Extracted ${text.length} letters');

    document.dispose();

    return text;
  }
}
