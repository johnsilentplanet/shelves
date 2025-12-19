import 'dart:convert';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../datasources/local/database.dart';
import '../datasources/local/daos/books_dao.dart';
import '../datasources/remote/firestore_service.dart';
import '../models/models.dart';

/// Repository for book operations.
/// Abstracts local database and remote Firestore operations.
class BookRepository {
  BookRepository({
    required BooksDao booksDao,
    required FirestoreService firestoreService,
  })  : _booksDao = booksDao,
        _firestoreService = firestoreService;

  final BooksDao _booksDao;
  final FirestoreService _firestoreService;
  static const _uuid = Uuid();

  // ==================== Local Operations ====================

  /// Gets all books from local database.
  Future<List<Book>> getAllBooks() async {
    final entities = await _booksDao.getAllBooks();
    return entities.map(_entityToModel).toList();
  }

  /// Watches all books from local database.
  Stream<List<Book>> watchAllBooks() {
    return _booksDao.watchAllBooks().map(
          (entities) => entities.map(_entityToModel).toList(),
        );
  }

  /// Gets a book by ID.
  Future<Book?> getBookById(String id) async {
    final entity = await _booksDao.getBookById(id);
    return entity != null ? _entityToModel(entity) : null;
  }

  /// Gets a book by ISBN.
  Future<Book?> getBookByIsbn(String isbn) async {
    final entity = await _booksDao.getBookByIsbn(isbn);
    return entity != null ? _entityToModel(entity) : null;
  }

  /// Gets books by shelf ID.
  Future<List<Book>> getBooksByShelfId(String shelfId) async {
    final entities = await _booksDao.getBooksByShelfId(shelfId);
    return entities.map(_entityToModel).toList();
  }

  /// Watches books by shelf ID.
  Stream<List<Book>> watchBooksByShelfId(String shelfId) {
    return _booksDao.watchBooksByShelfId(shelfId).map(
          (entities) => entities.map(_entityToModel).toList(),
        );
  }

  /// Gets books by reading status.
  Future<List<Book>> getBooksByReadingStatus(ReadingStatus status) async {
    final entities = await _booksDao.getBooksByReadingStatus(status.value);
    return entities.map(_entityToModel).toList();
  }

  /// Watches books by reading status.
  Stream<List<Book>> watchBooksByReadingStatus(ReadingStatus status) {
    return _booksDao.watchBooksByReadingStatus(status.value).map(
          (entities) => entities.map(_entityToModel).toList(),
        );
  }

  /// Gets loaned books.
  Future<List<Book>> getLoanedBooks() async {
    final entities = await _booksDao.getLoanedBooks();
    return entities.map(_entityToModel).toList();
  }

  /// Watches loaned books.
  Stream<List<Book>> watchLoanedBooks() {
    return _booksDao.watchLoanedBooks().map(
          (entities) => entities.map(_entityToModel).toList(),
        );
  }

  /// Searches books.
  Future<List<Book>> searchBooks(String query) async {
    final entities = await _booksDao.searchBooks(query);
    return entities.map(_entityToModel).toList();
  }

  /// Gets book count.
  Future<int> getBookCount() => _booksDao.getBookCount();

  /// Gets unsynced books.
  Future<List<Book>> getUnsyncedBooks() async {
    final entities = await _booksDao.getUnsyncedBooks();
    return entities.map(_entityToModel).toList();
  }

  /// Creates a new book with a generated ID.
  Future<Book> createBook({
    required String isbn,
    required String title,
    String? subtitle,
    List<String> authors = const [],
    String? publisher,
    String? publishedDate,
    String? description,
    Uint8List? coverImageData,
    String? coverImageUrl,
    int? pageCount,
    List<String> categories = const [],
    String? language,
    String? deweyDecimalNumber,
    String? shelfId,
    ReadingStatus? readingStatus,
  }) async {
    final now = DateTime.now();
    final book = Book(
      id: _uuid.v4(),
      isbn: isbn,
      title: title,
      subtitle: subtitle,
      authors: authors,
      publisher: publisher,
      publishedDate: publishedDate,
      description: description,
      coverImageData: coverImageData,
      coverImageUrl: coverImageUrl,
      pageCount: pageCount,
      categories: categories,
      language: language,
      dateAdded: now,
      deweyDecimalNumber: deweyDecimalNumber,
      shelfId: shelfId,
      readingStatus: readingStatus,
      updatedAt: now,
      isSynced: false,
    );

    await _booksDao.insertBook(_modelToCompanion(book));
    return book;
  }

  /// Saves a book (insert or update).
  Future<void> saveBook(Book book) async {
    final updated = book.copyWith(
      updatedAt: DateTime.now(),
      isSynced: false,
    );
    await _booksDao.upsertBook(_modelToCompanion(updated));
  }

  /// Deletes a book.
  Future<void> deleteBook(String id) async {
    await _booksDao.deleteBook(id);
  }

  /// Marks a book as synced.
  Future<void> markAsSynced(String id) async {
    await _booksDao.markAsSynced(id);
  }

  // ==================== Remote Sync Operations ====================

  /// Syncs books to Firestore.
  Future<void> syncToRemote(String userId) async {
    final unsyncedBooks = await getUnsyncedBooks();
    if (unsyncedBooks.isEmpty) return;

    await _firestoreService.batchSetBooks(userId, unsyncedBooks);

    for (final book in unsyncedBooks) {
      await markAsSynced(book.id);
    }
  }

  /// Fetches books from Firestore and merges with local.
  Future<void> syncFromRemote(String userId) async {
    final remoteBooks = await _firestoreService.getAllBooks(userId);

    for (final remoteBook in remoteBooks) {
      final localBook = await getBookById(remoteBook.id);

      if (localBook == null) {
        // New book from remote
        await _booksDao.upsertBook(_modelToCompanion(
          remoteBook.copyWith(isSynced: true),
        ));
      } else if (remoteBook.updatedAt.isAfter(localBook.updatedAt)) {
        // Remote is newer, update local
        await _booksDao.upsertBook(_modelToCompanion(
          remoteBook.copyWith(isSynced: true),
        ));
      }
    }
  }

  // ==================== Converters ====================

  Book _entityToModel(BookEntity entity) {
    return Book(
      id: entity.id,
      isbn: entity.isbn,
      title: entity.title,
      subtitle: entity.subtitle,
      authors: _decodeJsonList(entity.authors),
      publisher: entity.publisher,
      publishedDate: entity.publishedDate,
      description: entity.bookDescription,
      coverImageData: entity.coverImageData,
      coverImageUrl: entity.coverImageUrl,
      pageCount: entity.pageCount,
      categories: _decodeJsonList(entity.categories),
      language: entity.language,
      dateAdded: entity.dateAdded,
      deweyDecimalNumber: entity.deweyDecimalNumber,
      bisacCategory: entity.bisacCategory,
      bisacSubcategory: entity.bisacSubcategory,
      shelfId: entity.shelfId,
      notes: entity.notes,
      tags: _decodeJsonList(entity.tags),
      relatedBookIds: _decodeJsonList(entity.relatedBookIds),
      loanedTo: entity.loanedTo,
      loanDate: entity.loanDate,
      userRating: entity.userRating,
      dateRead: entity.dateRead,
      readingStatus: ReadingStatus.fromString(entity.readingStatus),
      updatedAt: entity.updatedAt,
      isSynced: entity.isSynced,
    );
  }

  BooksCompanion _modelToCompanion(Book book) {
    return BooksCompanion(
      id: Value(book.id),
      isbn: Value(book.isbn),
      title: Value(book.title),
      subtitle: Value(book.subtitle),
      authors: Value(jsonEncode(book.authors)),
      publisher: Value(book.publisher),
      publishedDate: Value(book.publishedDate),
      bookDescription: Value(book.description),
      coverImageData: Value(book.coverImageData),
      coverImageUrl: Value(book.coverImageUrl),
      pageCount: Value(book.pageCount),
      categories: Value(jsonEncode(book.categories)),
      language: Value(book.language),
      dateAdded: Value(book.dateAdded),
      deweyDecimalNumber: Value(book.deweyDecimalNumber),
      bisacCategory: Value(book.bisacCategory),
      bisacSubcategory: Value(book.bisacSubcategory),
      shelfId: Value(book.shelfId),
      notes: Value(book.notes),
      tags: Value(jsonEncode(book.tags)),
      relatedBookIds: Value(jsonEncode(book.relatedBookIds)),
      loanedTo: Value(book.loanedTo),
      loanDate: Value(book.loanDate),
      userRating: Value(book.userRating),
      dateRead: Value(book.dateRead),
      readingStatus: Value(book.readingStatus?.value),
      updatedAt: Value(book.updatedAt),
      isSynced: Value(book.isSynced),
    );
  }

  List<String> _decodeJsonList(String json) {
    try {
      final decoded = jsonDecode(json) as List<dynamic>;
      return decoded.map((e) => e as String).toList();
    } catch (_) {
      return [];
    }
  }
}
