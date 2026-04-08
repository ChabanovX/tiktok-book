import 'package:drift/drift.dart';

class BookCaches extends Table {
  TextColumn get documentId => text()();

  TextColumn get wordsJson => text()();

  @override
  Set<Column> get primaryKey => {documentId};
}
