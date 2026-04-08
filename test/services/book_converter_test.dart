import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
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

    setUp(() async {
      pdfParser = _FakePdfParser();
      txtParser = _FakeTxtParser();
      textProcessor = _FakeTextProcessor();
      converter = BookConverter(pdfParser, txtParser, textProcessor);
    });

    test('uses pdf parser for pdf files', () async {
      final file = _buildBookFile(name: 'sample.pdf');
      pdfParser.result = 'pdf source text';
      textProcessor.result = ['pdf', 'words'];

      final result = await converter.convert(file);

      expect(result, ['pdf', 'words']);
      expect(pdfParser.calledWith?.path, file.path);
      expect(txtParser.calledWith, isNull);
      expect(textProcessor.calledWith, 'pdf source text');
    });

    test('uses txt parser for txt files', () async {
      final file = _buildBookFile(name: 'sample.txt');
      txtParser.result = 'txt source text';
      textProcessor.result = ['txt', 'words'];

      final result = await converter.convert(file);

      expect(result, ['txt', 'words']);
      expect(txtParser.calledWith?.path, file.path);
      expect(pdfParser.calledWith, isNull);
      expect(textProcessor.calledWith, 'txt source text');
    });

    test('throws for unsupported file format', () async {
      final file = _buildBookFile(name: 'sample.epub');

      await expectLater(
        () => converter.convert(file),
        throwsA(isA<Exception>()),
      );
    });
  });
}

BookFile _buildBookFile({required String name}) {
  final xFile = XFile.fromData(
    Uint8List(0),
    name: name,
    path: '/tmp/$name',
  );

  final lastDotIndex = name.lastIndexOf('.');
  final extension = lastDotIndex == -1 ? '' : name.substring(lastDotIndex + 1);

  return BookFile(
    name: name,
    path: xFile.path,
    fileExtension: extension,
    size: 0,
    file: xFile,
  );
}

class _FakePdfParser extends PdfParser {
  XFile? calledWith;
  String result = '';

  @override
  Future<String> parse(XFile file) async {
    calledWith = file;
    return result;
  }
}

class _FakeTxtParser extends TxtParser {
  XFile? calledWith;
  String result = '';

  @override
  Future<String> parse(XFile file) async {
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
