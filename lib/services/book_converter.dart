import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/services/pdf_parser.dart';
import 'package:rsvp_flutter_app/services/text_processor.dart';
import 'package:rsvp_flutter_app/services/txt_parser.dart';

@singleton
class BookConverter {
  BookConverter(this.pdfParser, this.txtParser, this.textProcessor);

  final PdfParser pdfParser;
  final TxtParser txtParser;
  final TextProcessor textProcessor;

  Future<List<String>> convert(File file) async {
    String? text;
    if (file.path.endsWith('pdf')) {
      text = await pdfParser.parse(file);
    } else if (file.path.endsWith('txt')) {
      text = await txtParser.parse(file);
    } else {
      throw Exception('Wrong file format');
    }

    final words = textProcessor.process(text);
    return words;
  }
}
