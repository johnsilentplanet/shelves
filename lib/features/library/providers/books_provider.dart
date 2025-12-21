import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../data/models/book.dart';
import '../../../data/models/reading_status.dart';
import '../../auth/providers/auth_provider.dart';

part 'books_provider.g.dart';

/// Stream of all books from the local database.
@riverpod
Stream<List<Book>> allBooks(Ref ref) =>
    ref.watch(bookRepositoryProvider).watchAllBooks();

/// The total count of books in the library.
@riverpod
Future<int> bookCount(Ref ref) =>
    ref.watch(bookRepositoryProvider).getBookCount();

/// A single book by ID.
@riverpod
Future<Book?> bookById(Ref ref, String id) =>
    ref.watch(bookRepositoryProvider).getBookById(id);

/// A single book by ISBN.
@riverpod
Future<Book?> bookByIsbn(Ref ref, String isbn) =>
    ref.watch(bookRepositoryProvider).getBookByIsbn(isbn);

/// Books filtered by shelf ID.
@riverpod
Stream<List<Book>> booksByShelf(Ref ref, String shelfId) =>
    ref.watch(bookRepositoryProvider).watchBooksByShelfId(shelfId);

/// Books filtered by reading status.
@riverpod
Stream<List<Book>> booksByReadingStatus(Ref ref, ReadingStatus status) =>
    ref.watch(bookRepositoryProvider).watchBooksByReadingStatus(status);

/// Books that are currently loaned out.
@riverpod
Stream<List<Book>> loanedBooks(Ref ref) =>
    ref.watch(bookRepositoryProvider).watchLoanedBooks();

/// Search results for books.
@riverpod
Future<List<Book>> searchBooks(Ref ref, String query) =>
    ref.watch(bookRepositoryProvider).searchBooks(query);

/// Notifier for book CRUD operations.
@riverpod
class BooksNotifier extends _$BooksNotifier {
  @override
  void build() {}

  /// Creates a new book.
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
    final repository = ref.read(bookRepositoryProvider);
    return repository.createBook(
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
      deweyDecimalNumber: deweyDecimalNumber,
      shelfId: shelfId,
      readingStatus: readingStatus,
    );
  }

  /// Updates an existing book.
  Future<void> updateBook(Book book) async {
    final repository = ref.read(bookRepositoryProvider);
    await repository.saveBook(book);
  }

  /// Deletes a book by ID.
  Future<void> deleteBook(String id) async {
    final repository = ref.read(bookRepositoryProvider);
    await repository.deleteBook(id);
  }

  /// Syncs books to the remote server.
  Future<void> syncToRemote() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    final repository = ref.read(bookRepositoryProvider);
    await repository.syncToRemote(userId);
  }

  /// Syncs books from the remote server.
  Future<void> syncFromRemote() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    final repository = ref.read(bookRepositoryProvider);
    await repository.syncFromRemote(userId);
  }

  /// Performs a full bidirectional sync.
  Future<void> fullSync() async {
    await syncFromRemote();
    await syncToRemote();
  }
}
