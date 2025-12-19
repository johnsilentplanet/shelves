import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/books_table.dart';

part 'books_dao.g.dart';

/// Data Access Object for books.
@DriftAccessor(tables: [Books])
class BooksDao extends DatabaseAccessor<AppDatabase> with _$BooksDaoMixin {
  BooksDao(super.db);

  /// Get all books ordered by date added (newest first).
  Future<List<BookEntity>> getAllBooks() =>
      (select(books)..orderBy([(t) => OrderingTerm.desc(t.dateAdded)])).get();

  /// Watch all books ordered by date added (newest first).
  Stream<List<BookEntity>> watchAllBooks() =>
      (select(books)..orderBy([(t) => OrderingTerm.desc(t.dateAdded)])).watch();

  /// Get a book by ID.
  Future<BookEntity?> getBookById(String id) =>
      (select(books)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Get a book by ISBN.
  Future<BookEntity?> getBookByIsbn(String isbn) =>
      (select(books)..where((t) => t.isbn.equals(isbn))).getSingleOrNull();

  /// Get books by shelf ID.
  Future<List<BookEntity>> getBooksByShelfId(String shelfId) =>
      (select(books)..where((t) => t.shelfId.equals(shelfId))).get();

  /// Watch books by shelf ID.
  Stream<List<BookEntity>> watchBooksByShelfId(String shelfId) =>
      (select(books)..where((t) => t.shelfId.equals(shelfId))).watch();

  /// Get books by reading status.
  Future<List<BookEntity>> getBooksByReadingStatus(String status) =>
      (select(books)..where((t) => t.readingStatus.equals(status))).get();

  /// Watch books by reading status.
  Stream<List<BookEntity>> watchBooksByReadingStatus(String status) =>
      (select(books)..where((t) => t.readingStatus.equals(status))).watch();

  /// Get loaned books.
  Future<List<BookEntity>> getLoanedBooks() =>
      (select(books)..where((t) => t.loanedTo.isNotNull())).get();

  /// Watch loaned books.
  Stream<List<BookEntity>> watchLoanedBooks() =>
      (select(books)..where((t) => t.loanedTo.isNotNull())).watch();

  /// Get unsynced books.
  Future<List<BookEntity>> getUnsyncedBooks() =>
      (select(books)..where((t) => t.isSynced.equals(false))).get();

  /// Get book count.
  Future<int> getBookCount() async {
    final count = countAll();
    final query = selectOnly(books)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  /// Search books by title, author, or ISBN.
  Future<List<BookEntity>> searchBooks(String query) {
    final lowerQuery = '%${query.toLowerCase()}%';
    return (select(books)
          ..where((t) =>
              t.title.lower().like(lowerQuery) |
              t.authors.lower().like(lowerQuery) |
              t.isbn.like(lowerQuery) |
              t.tags.lower().like(lowerQuery)))
        .get();
  }

  /// Insert a book.
  Future<int> insertBook(BooksCompanion book) => into(books).insert(book);

  /// Insert or update a book.
  Future<int> upsertBook(BooksCompanion book) =>
      into(books).insertOnConflictUpdate(book);

  /// Update a book.
  Future<bool> updateBook(BookEntity book) => update(books).replace(book);

  /// Delete a book by ID.
  Future<int> deleteBook(String id) =>
      (delete(books)..where((t) => t.id.equals(id))).go();

  /// Delete all books.
  Future<int> deleteAllBooks() => delete(books).go();

  /// Mark a book as synced.
  Future<int> markAsSynced(String id) => (update(books)
        ..where((t) => t.id.equals(id)))
      .write(const BooksCompanion(isSynced: Value(true)));

  /// Mark all books as unsynced.
  Future<int> markAllAsUnsynced() =>
      update(books).write(const BooksCompanion(isSynced: Value(false)));
}
