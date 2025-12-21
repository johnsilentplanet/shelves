import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/book.dart';
import '../../../data/models/reading_status.dart';
import 'books_provider.dart';

part 'library_filter_provider.freezed.dart';
part 'library_filter_provider.g.dart';

/// Sort options for the library.
enum SortOption {
  title,
  author,
  dateAdded,
  rating,
  dateRead,
}

/// Filter state for the library.
@freezed
sealed class LibraryFilter with _$LibraryFilter {
  const factory LibraryFilter({
    String? searchQuery,
    String? shelfId,
    ReadingStatus? readingStatus,
    @Default([]) List<String> tags,
    @Default(SortOption.dateAdded) SortOption sortBy,
    @Default(false) bool sortAscending,
  }) = _LibraryFilter;
}

/// Notifier for library filter state.
@riverpod
class LibraryFilterNotifier extends _$LibraryFilterNotifier {
  @override
  LibraryFilter build() => const LibraryFilter();

  /// Sets the search query.
  void setSearchQuery(String? query) {
    state = state.copyWith(
      searchQuery: query?.isEmpty ?? true ? null : query,
    );
  }

  /// Sets the shelf filter.
  void setShelfId(String? shelfId) {
    state = state.copyWith(shelfId: shelfId);
  }

  /// Sets the reading status filter.
  void setReadingStatus(ReadingStatus? status) {
    state = state.copyWith(readingStatus: status);
  }

  /// Adds a tag to the filter.
  void addTag(String tag) {
    if (!state.tags.contains(tag)) {
      state = state.copyWith(tags: [...state.tags, tag]);
    }
  }

  /// Removes a tag from the filter.
  void removeTag(String tag) {
    state = state.copyWith(
      tags: state.tags.where((t) => t != tag).toList(),
    );
  }

  /// Sets the sort option.
  void setSortBy(SortOption sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  /// Toggles the sort direction.
  void toggleSortDirection() {
    state = state.copyWith(sortAscending: !state.sortAscending);
  }

  /// Sets the sort direction.
  void setSortAscending({required bool ascending}) {
    state = state.copyWith(sortAscending: ascending);
  }

  /// Clears all filters.
  void clearFilters() {
    state = const LibraryFilter();
  }

  /// Clears search query only.
  void clearSearch() {
    state = state.copyWith(searchQuery: null);
  }
}

/// Filtered and sorted list of books.
@riverpod
List<Book> filteredBooks(Ref ref) {
  final filter = ref.watch(libraryFilterProvider);
  final booksAsync = ref.watch(allBooksProvider);

  // Return empty list while loading or on error
  final books = booksAsync.value ?? [];

  var filtered = books;

  // Apply search filter
  if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
    final query = filter.searchQuery!.toLowerCase();
    filtered = filtered.where((Book book) {
      return book.title.toLowerCase().contains(query) ||
          book.authors.any((String a) => a.toLowerCase().contains(query)) ||
          book.isbn.toLowerCase().contains(query) ||
          book.tags.any((String t) => t.toLowerCase().contains(query));
    }).toList();
  }

  // Apply shelf filter
  if (filter.shelfId != null) {
    filtered = filtered
        .where((Book book) => book.shelfId == filter.shelfId)
        .toList();
  }

  // Apply reading status filter
  if (filter.readingStatus != null) {
    filtered = filtered
        .where((Book book) => book.readingStatus == filter.readingStatus)
        .toList();
  }

  // Apply tag filter
  if (filter.tags.isNotEmpty) {
    filtered = filtered.where((Book book) {
      return filter.tags.every((String tag) => book.tags.contains(tag));
    }).toList();
  }

  // Apply sorting
  return _sortBooks(filtered, filter.sortBy, filter.sortAscending);
}

List<Book> _sortBooks(List<Book> books, SortOption sortBy, bool ascending) {
  final sorted = [...books]..sort((Book a, Book b) {
      int comparison;
      switch (sortBy) {
        case SortOption.title:
          comparison = a.title.toLowerCase().compareTo(b.title.toLowerCase());
        case SortOption.author:
          final authorA = a.authors.isNotEmpty ? a.authors.first : '';
          final authorB = b.authors.isNotEmpty ? b.authors.first : '';
          comparison = authorA.toLowerCase().compareTo(authorB.toLowerCase());
        case SortOption.dateAdded:
          comparison = a.dateAdded.compareTo(b.dateAdded);
        case SortOption.rating:
          final ratingA = a.userRating ?? 0;
          final ratingB = b.userRating ?? 0;
          comparison = ratingA.compareTo(ratingB);
        case SortOption.dateRead:
          final dateA = a.dateRead ?? DateTime(1900);
          final dateB = b.dateRead ?? DateTime(1900);
          comparison = dateA.compareTo(dateB);
      }
      return ascending ? comparison : -comparison;
    });

  return sorted;
}
