import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../data/models/book.dart';
import '../../../data/models/reading_status.dart';

part 'reading_provider.g.dart';

/// Books that are currently being read.
@riverpod
Stream<List<Book>> currentlyReadingBooks(Ref ref) =>
    ref.watch(bookRepositoryProvider).watchBooksByReadingStatus(
          ReadingStatus.currentlyReading,
        );

/// Books that have been read, sorted by date read (most recent first).
@riverpod
Stream<List<Book>> recentlyReadBooks(Ref ref) {
  return ref
      .watch(bookRepositoryProvider)
      .watchBooksByReadingStatus(ReadingStatus.read)
      .map((List<Book> books) {
    final sorted = [...books]
      ..sort((Book a, Book b) {
        final dateA = a.dateRead ?? DateTime(1900);
        final dateB = b.dateRead ?? DateTime(1900);
        return dateB.compareTo(dateA); // Descending order
      });
    return sorted;
  });
}

/// Books in the "to read" list.
@riverpod
Stream<List<Book>> toReadBooks(Ref ref) =>
    ref.watch(bookRepositoryProvider).watchBooksByReadingStatus(
          ReadingStatus.toRead,
        );

/// Count of books currently being read.
@riverpod
int currentlyReadingCount(Ref ref) {
  final booksAsync = ref.watch(currentlyReadingBooksProvider);
  return booksAsync.value?.length ?? 0;
}

/// Count of books read this year.
@riverpod
int booksReadThisYear(Ref ref) {
  final currentYear = DateTime.now().year;
  final booksAsync = ref.watch(recentlyReadBooksProvider);
  final books = booksAsync.value ?? [];
  return books.where((Book book) => book.dateRead?.year == currentYear).length;
}

/// Notifier for reading progress operations.
@riverpod
class ReadingProgressNotifier extends _$ReadingProgressNotifier {
  @override
  void build() {}

  /// Starts reading a book (sets status to currentlyReading).
  Future<void> startReading(Book book) async {
    final repository = ref.read(bookRepositoryProvider);
    await repository.saveBook(
      book.copyWith(readingStatus: ReadingStatus.currentlyReading),
    );
  }

  /// Adds a book to the "to read" list.
  Future<void> addToReadList(Book book) async {
    final repository = ref.read(bookRepositoryProvider);
    await repository.saveBook(
      book.copyWith(readingStatus: ReadingStatus.toRead),
    );
  }

  /// Marks a book as finished reading.
  Future<void> markAsFinished(
    Book book, {
    int? rating,
    DateTime? dateRead,
  }) async {
    final repository = ref.read(bookRepositoryProvider);
    await repository.saveBook(
      book.copyWith(
        readingStatus: ReadingStatus.read,
        dateRead: dateRead ?? DateTime.now(),
        userRating: rating ?? book.userRating,
      ),
    );
  }

  /// Updates the rating for a book.
  Future<void> updateRating(Book book, int rating) async {
    final repository = ref.read(bookRepositoryProvider);
    await repository.saveBook(
      book.copyWith(userRating: rating),
    );
  }

  /// Clears the reading status of a book.
  Future<void> clearReadingStatus(Book book) async {
    final repository = ref.read(bookRepositoryProvider);
    await repository.saveBook(
      book.copyWith(
        readingStatus: null,
        dateRead: null,
      ),
    );
  }

  /// Removes a book from the currently reading list (without marking as read).
  Future<void> stopReading(Book book) async {
    final repository = ref.read(bookRepositoryProvider);
    await repository.saveBook(
      book.copyWith(readingStatus: null),
    );
  }
}
