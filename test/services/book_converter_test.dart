import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/services/book_converter.dart';
import 'package:rsvp_flutter_app/services/pdf_parser.dart';
import 'package:rsvp_flutter_app/services/text_processor.dart';
import 'package:rsvp_flutter_app/services/txt_parser.dart';

void main() {
  group('BookConverter', () {
    late _FakePdfParser pdfParser;
    late _FakeTxtParser txtParser;
    late _FakeTextProcessor textProcessor;
    late BookConverter converter;
    late Directory tempDir;

    setUp(() async {
      pdfParser = _FakePdfParser();
      txtParser = _FakeTxtParser();
      textProcessor = _FakeTextProcessor();
      converter = BookConverter(pdfParser, txtParser, textProcessor);
      tempDir = await Directory.systemTemp.createTemp('book_converter_test');
    });

    tearDown(() async {
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('uses pdf parser for pdf files', () async {
      final file = File('${tempDir.path}/sample.pdf')..writeAsStringSync('irrelevant');
      pdfParser.result = 'pdf source text';
      textProcessor.result = ['pdf', 'words'];

      final result = await converter.convert(file);

      expect(result, ['pdf', 'words']);
      expect(pdfParser.calledWith?.path, file.path);
      expect(txtParser.calledWith, isNull);
      expect(textProcessor.calledWith, 'pdf source text');
    });

    test('uses txt parser for txt files', () async {
      final file = File('${tempDir.path}/sample.txt')..writeAsStringSync('irrelevant');
      txtParser.result = 'txt source text';
      textProcessor.result = ['txt', 'words'];

      final result = await converter.convert(file);

      expect(result, ['txt', 'words']);
      expect(txtParser.calledWith?.path, file.path);
      expect(pdfParser.calledWith, isNull);
      expect(textProcessor.calledWith, 'txt source text');
    });

    test('throws for unsupported file format', () async {
      final file = File('${tempDir.path}/sample.epub')..writeAsStringSync('irrelevant');

      await expectLater(
        () => converter.convert(file),
        throwsA(isA<Exception>()),
      );
    });
  });
}

class _FakePdfParser extends PdfParser {
  File? calledWith;
  String result = '';

  @override
  Future<String> parse(File file) async {
    calledWith = file;
    return result;
  }
}

class _FakeTxtParser extends TxtParser {
  File? calledWith;
  String result = '';

  @override
  Future<String> parse(File file) async {
    calledWith = file;
    return result;
  }
}

class _FakeTextProcessor extends TextProcessor {
  String? calledWith;
  List<String> result = const [];

  @override
  List<String> process(String text) {
    calledWith = text;
    return result;
  }
}
