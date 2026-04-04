import 'dart:async';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:rsvp_flutter_app/services/pdf_parser.dart';
import 'package:rsvp_flutter_app/services/text_processor.dart';
import 'package:rsvp_flutter_app/services/txt_parser.dart';

@singleton
class BookConverter {
  BookConverter(this._pdfParser, this._txtParser, this._textProcessor);

  final PdfParser _pdfParser;
  final TxtParser _txtParser;
  final TextProcessor _textProcessor;

  Future<List<String>> convert(File file) async {
    String? text;
    if (file.path.endsWith('pdf')) {
      text = await _pdfParser.parse(file);
    } else if (file.path.endsWith('txt')) {
      text = await _txtParser.parse(file);
    } else {
      throw Exception('Wrong file format');
    }

    final words = _textProcessor.process(text);
    return words;
  }
}
