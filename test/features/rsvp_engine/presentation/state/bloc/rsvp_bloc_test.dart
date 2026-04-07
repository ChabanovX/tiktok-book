import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rsvp_flutter_app/core/db/app_database.dart';
import 'package:rsvp_flutter_app/features/books/data/database_service.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/repositories/file_repository.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/book_model.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/presentation/state/bloc/rsvp_bloc.dart';
import 'package:rsvp_flutter_app/services/book_converter.dart';
import 'package:rsvp_flutter_app/services/pdf_parser.dart';
import 'package:rsvp_flutter_app/services/text_processor.dart';
import 'package:rsvp_flutter_app/services/txt_parser.dart';

void main() {
  group('RsvpBloc toggleSelectBook', () {
    late RsvpBloc bloc;

    setUp(() {
      bloc = RsvpBloc(
        bookDbService: _FakeBookDbService(),
        fileRepository: _FakeFileRepository(),
        bookConverter: _FakeBookConverter(),
      );
    });

    tearDown(() async {
      await bloc.close();
    });

    test('selects a book when nothing is selected', () async {
      final book = _buildBook(name: 'Book one');

      final nextState = expectLater(
        bloc.stream,
        emits(
          isA<RsvpState>().having(
            (state) => state.selectedBook,
            'selectedBook',
            book,
          ),
        ),
      );

      bloc.add(RsvpEvent.toggleSelectBook(book: book));

      await nextState;
    });

    test('deselects a book when the same book is toggled twice', () async {
      final book = _buildBook(name: 'Book one');

      final nextStates = expectLater(
        bloc.stream,
        emitsInOrder([
          isA<RsvpState>().having(
            (state) => state.selectedBook,
            'selectedBook',
            book,
          ),
          isA<RsvpState>().having(
            (state) => state.selectedBook,
            'selectedBook',
            isNull,
          ),
        ]),
      );

      bloc
        ..add(RsvpEvent.toggleSelectBook(book: book))
        ..add(RsvpEvent.toggleSelectBook(book: book));

      await nextStates;
    });

    test('replaces the selection when another book is toggled', () async {
      final firstBook = _buildBook(name: 'Book one');
      final secondBook = _buildBook(name: 'Book two');

      final nextStates = expectLater(
        bloc.stream,
        emitsInOrder([
          isA<RsvpState>().having(
            (state) => state.selectedBook,
            'selectedBook',
            firstBook,
          ),
          isA<RsvpState>().having(
            (state) => state.selectedBook,
            'selectedBook',
            secondBook,
          ),
        ]),
      );

      bloc
        ..add(RsvpEvent.toggleSelectBook(book: firstBook))
        ..add(RsvpEvent.toggleSelectBook(book: secondBook));

      await nextStates;
    });
  });
}

BookMetaModel _buildBook({required String name}) {
  final file = File('/tmp/${name.toLowerCase().replaceAll(' ', '_')}.txt');

  return BookMetaModel(
    bookFile: BookFile(
      name: name,
      path: file.path,
      fileExtension: 'txt',
      size: 1,
      file: file,
    ),
  );
}

class _FakeFileRepository implements FileRepository {
  @override
  Future<BookFile?> loadFileFromLocal(String path) async => null;

  @override
  Future<BookFile?> pickAndLoadFile() async => null;

  @override
  Future<void> saveFile(BookFile bf) async {}
}

class _FakeBookDbService extends BookDbService {
  _FakeBookDbService() : super(_database);

  static final AppDatabase _database = AppDatabase();
}

class _FakeBookConverter extends BookConverter {
  _FakeBookConverter()
    : super(
        _FakePdfParser(),
        _FakeTxtParser(),
        _FakeTextProcessor(),
      );
}

class _FakePdfParser extends PdfParser {
  @override
  Future<String> parse(File file) async => '';
}

class _FakeTxtParser extends TxtParser {
  @override
  Future<String> parse(File file) async => '';
}

class _FakeTextProcessor extends TextProcessor {
  @override
  List<String> process(String text) => const [];
}
