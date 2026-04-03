// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'document_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorNameMeta = const VerificationMeta(
    'authorName',
  );
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
    'author_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bookTitleMeta = const VerificationMeta(
    'bookTitle',
  );
  @override
  late final GeneratedColumn<String> bookTitle = GeneratedColumn<String>(
    'book_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentIndexMeta = const VerificationMeta(
    'currentIndex',
  );
  @override
  late final GeneratedColumn<int> currentIndex = GeneratedColumn<int>(
    'current_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalWordsMeta = const VerificationMeta(
    'totalWords',
  );
  @override
  late final GeneratedColumn<int> totalWords = GeneratedColumn<int>(
    'total_words',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    documentId,
    authorName,
    bookTitle,
    currentIndex,
    totalWords,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(
    Insertable<Book> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('document_id')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['document_id']!, _documentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_documentIdMeta);
    }
    if (data.containsKey('author_name')) {
      context.handle(
        _authorNameMeta,
        authorName.isAcceptableOrUnknown(data['author_name']!, _authorNameMeta),
      );
    }
    if (data.containsKey('book_title')) {
      context.handle(
        _bookTitleMeta,
        bookTitle.isAcceptableOrUnknown(data['book_title']!, _bookTitleMeta),
      );
    } else if (isInserting) {
      context.missing(_bookTitleMeta);
    }
    if (data.containsKey('current_index')) {
      context.handle(
        _currentIndexMeta,
        currentIndex.isAcceptableOrUnknown(
          data['current_index']!,
          _currentIndexMeta,
        ),
      );
    }
    if (data.containsKey('total_words')) {
      context.handle(
        _totalWordsMeta,
        totalWords.isAcceptableOrUnknown(data['total_words']!, _totalWordsMeta),
      );
    } else if (isInserting) {
      context.missing(_totalWordsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {documentId};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_id'],
      )!,
      authorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_name'],
      ),
      bookTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}book_title'],
      )!,
      currentIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_index'],
      )!,
      totalWords: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_words'],
      )!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final String documentId;
  final String? authorName;
  final String bookTitle;
  final int currentIndex;
  final int totalWords;
  const Book({
    required this.documentId,
    this.authorName,
    required this.bookTitle,
    required this.currentIndex,
    required this.totalWords,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['document_id'] = Variable<String>(documentId);
    if (!nullToAbsent || authorName != null) {
      map['author_name'] = Variable<String>(authorName);
    }
    map['book_title'] = Variable<String>(bookTitle);
    map['current_index'] = Variable<int>(currentIndex);
    map['total_words'] = Variable<int>(totalWords);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      documentId: Value(documentId),
      authorName: authorName == null && nullToAbsent ? const Value.absent() : Value(authorName),
      bookTitle: Value(bookTitle),
      currentIndex: Value(currentIndex),
      totalWords: Value(totalWords),
    );
  }

  factory Book.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      documentId: serializer.fromJson<String>(json['documentId']),
      authorName: serializer.fromJson<String?>(json['authorName']),
      bookTitle: serializer.fromJson<String>(json['bookTitle']),
      currentIndex: serializer.fromJson<int>(json['currentIndex']),
      totalWords: serializer.fromJson<int>(json['totalWords']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'documentId': serializer.toJson<String>(documentId),
      'authorName': serializer.toJson<String?>(authorName),
      'bookTitle': serializer.toJson<String>(bookTitle),
      'currentIndex': serializer.toJson<int>(currentIndex),
      'totalWords': serializer.toJson<int>(totalWords),
    };
  }

  Book copyWith({
    String? documentId,
    Value<String?> authorName = const Value.absent(),
    String? bookTitle,
    int? currentIndex,
    int? totalWords,
  }) => Book(
    documentId: documentId ?? this.documentId,
    authorName: authorName.present ? authorName.value : this.authorName,
    bookTitle: bookTitle ?? this.bookTitle,
    currentIndex: currentIndex ?? this.currentIndex,
    totalWords: totalWords ?? this.totalWords,
  );
  Book copyWithCompanion(BooksCompanion data) {
    return Book(
      documentId: data.documentId.present ? data.documentId.value : this.documentId,
      authorName: data.authorName.present ? data.authorName.value : this.authorName,
      bookTitle: data.bookTitle.present ? data.bookTitle.value : this.bookTitle,
      currentIndex: data.currentIndex.present ? data.currentIndex.value : this.currentIndex,
      totalWords: data.totalWords.present ? data.totalWords.value : this.totalWords,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('documentId: $documentId, ')
          ..write('authorName: $authorName, ')
          ..write('bookTitle: $bookTitle, ')
          ..write('currentIndex: $currentIndex, ')
          ..write('totalWords: $totalWords')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(documentId, authorName, bookTitle, currentIndex, totalWords);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.documentId == this.documentId &&
          other.authorName == this.authorName &&
          other.bookTitle == this.bookTitle &&
          other.currentIndex == this.currentIndex &&
          other.totalWords == this.totalWords);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<String> documentId;
  final Value<String?> authorName;
  final Value<String> bookTitle;
  final Value<int> currentIndex;
  final Value<int> totalWords;
  final Value<int> rowid;
  const BooksCompanion({
    this.documentId = const Value.absent(),
    this.authorName = const Value.absent(),
    this.bookTitle = const Value.absent(),
    this.currentIndex = const Value.absent(),
    this.totalWords = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BooksCompanion.insert({
    required String documentId,
    this.authorName = const Value.absent(),
    required String bookTitle,
    this.currentIndex = const Value.absent(),
    required int totalWords,
    this.rowid = const Value.absent(),
  }) : documentId = Value(documentId),
       bookTitle = Value(bookTitle),
       totalWords = Value(totalWords);
  static Insertable<Book> custom({
    Expression<String>? documentId,
    Expression<String>? authorName,
    Expression<String>? bookTitle,
    Expression<int>? currentIndex,
    Expression<int>? totalWords,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (documentId != null) 'document_id': documentId,
      if (authorName != null) 'author_name': authorName,
      if (bookTitle != null) 'book_title': bookTitle,
      if (currentIndex != null) 'current_index': currentIndex,
      if (totalWords != null) 'total_words': totalWords,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BooksCompanion copyWith({
    Value<String>? documentId,
    Value<String?>? authorName,
    Value<String>? bookTitle,
    Value<int>? currentIndex,
    Value<int>? totalWords,
    Value<int>? rowid,
  }) {
    return BooksCompanion(
      documentId: documentId ?? this.documentId,
      authorName: authorName ?? this.authorName,
      bookTitle: bookTitle ?? this.bookTitle,
      currentIndex: currentIndex ?? this.currentIndex,
      totalWords: totalWords ?? this.totalWords,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (documentId.present) {
      map['document_id'] = Variable<String>(documentId.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (bookTitle.present) {
      map['book_title'] = Variable<String>(bookTitle.value);
    }
    if (currentIndex.present) {
      map['current_index'] = Variable<int>(currentIndex.value);
    }
    if (totalWords.present) {
      map['total_words'] = Variable<int>(totalWords.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('documentId: $documentId, ')
          ..write('authorName: $authorName, ')
          ..write('bookTitle: $bookTitle, ')
          ..write('currentIndex: $currentIndex, ')
          ..write('totalWords: $totalWords, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BooksTable books = $BooksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books];
}

typedef $$BooksTableCreateCompanionBuilder =
    BooksCompanion Function({
      required String documentId,
      Value<String?> authorName,
      required String bookTitle,
      Value<int> currentIndex,
      required int totalWords,
      Value<int> rowid,
    });
typedef $$BooksTableUpdateCompanionBuilder =
    BooksCompanion Function({
      Value<String> documentId,
      Value<String?> authorName,
      Value<String> bookTitle,
      Value<int> currentIndex,
      Value<int> totalWords,
      Value<int> rowid,
    });

class $$BooksTableFilterComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bookTitle => $composableBuilder(
    column: $table.bookTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalWords => $composableBuilder(
    column: $table.totalWords,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BooksTableOrderingComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bookTitle => $composableBuilder(
    column: $table.bookTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalWords => $composableBuilder(
    column: $table.totalWords,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BooksTableAnnotationComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bookTitle => $composableBuilder(column: $table.bookTitle, builder: (column) => column);

  GeneratedColumn<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalWords => $composableBuilder(
    column: $table.totalWords,
    builder: (column) => column,
  );
}

class $$BooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BooksTable,
          Book,
          $$BooksTableFilterComposer,
          $$BooksTableOrderingComposer,
          $$BooksTableAnnotationComposer,
          $$BooksTableCreateCompanionBuilder,
          $$BooksTableUpdateCompanionBuilder,
          (Book, BaseReferences<_$AppDatabase, $BooksTable, Book>),
          Book,
          PrefetchHooks Function()
        > {
  $$BooksTableTableManager(_$AppDatabase db, $BooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> documentId = const Value.absent(),
                Value<String?> authorName = const Value.absent(),
                Value<String> bookTitle = const Value.absent(),
                Value<int> currentIndex = const Value.absent(),
                Value<int> totalWords = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion(
                documentId: documentId,
                authorName: authorName,
                bookTitle: bookTitle,
                currentIndex: currentIndex,
                totalWords: totalWords,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String documentId,
                Value<String?> authorName = const Value.absent(),
                required String bookTitle,
                Value<int> currentIndex = const Value.absent(),
                required int totalWords,
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion.insert(
                documentId: documentId,
                authorName: authorName,
                bookTitle: bookTitle,
                currentIndex: currentIndex,
                totalWords: totalWords,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0.map((e) => (e.readTable(table), BaseReferences(db, table, e))).toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BooksTable,
      Book,
      $$BooksTableFilterComposer,
      $$BooksTableOrderingComposer,
      $$BooksTableAnnotationComposer,
      $$BooksTableCreateCompanionBuilder,
      $$BooksTableUpdateCompanionBuilder,
      (Book, BaseReferences<_$AppDatabase, $BooksTable, Book>),
      Book,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BooksTableTableManager get books => $$BooksTableTableManager(_db, _db.books);
}
