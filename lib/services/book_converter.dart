import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/services/pdf_parser.dart';
import 'package:rsvp_flutter_app/services/text_processor.dart';
import 'package:rsvp_flutter_app/services/txt_parser.dart';

@singleton
class BookConverter {
  BookConverter(this._pdfParser, this._txtParser, this._textProcessor);

  final PdfParser _pdfParser;
  final TxtParser _txtParser;
  final TextProcessor _textProcessor;

  Future<List<String>> convert(BookFile file) async {
    String? text;
    if (file.isPdf) {
      text = await _pdfParser.parse(file.file);
    } else if (file.isTxt) {
      text = await _txtParser.parse(file.file);
    } else {
      throw Exception('Wrong file format');
    }

    final words = _textProcessor.process(text);
    return words;
  }
}
