import 'package:drift/drift.dart';

class Books extends Table {
  TextColumn get documentId => text()();
  
  TextColumn get authorName => text().nullable()();

  TextColumn get bookTitle => text()();

  IntColumn get currentIndex =>
      integer().withDefault(const Constant(0))();

  IntColumn get totalWords => integer()();

  @override
  Set<Column> get primaryKey => {documentId};
}
