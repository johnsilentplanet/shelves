// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stream of all books from the local database.

@ProviderFor(allBooks)
const allBooksProvider = AllBooksProvider._();

/// Stream of all books from the local database.

final class AllBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          Stream<List<Book>>
        >
    with $FutureModifier<List<Book>>, $StreamProvider<List<Book>> {
  /// Stream of all books from the local database.
  const AllBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allBooksHash();

  @$internal
  @override
  $StreamProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Book>> create(Ref ref) {
    return allBooks(ref);
  }
}

String _$allBooksHash() => r'be65f8ee8c689809cdee9c443ac4b30a17b96c67';

/// The total count of books in the library.

@ProviderFor(bookCount)
const bookCountProvider = BookCountProvider._();

/// The total count of books in the library.

final class BookCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// The total count of books in the library.
  const BookCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookCountHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return bookCount(ref);
  }
}

String _$bookCountHash() => r'3f4c56f5f34f682ca4eb89ab1bb6f5bd3c22002d';

/// A single book by ID.

@ProviderFor(bookById)
const bookByIdProvider = BookByIdFamily._();

/// A single book by ID.

final class BookByIdProvider
    extends $FunctionalProvider<AsyncValue<Book?>, Book?, FutureOr<Book?>>
    with $FutureModifier<Book?>, $FutureProvider<Book?> {
  /// A single book by ID.
  const BookByIdProvider._({
    required BookByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookByIdHash();

  @override
  String toString() {
    return r'bookByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Book?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Book?> create(Ref ref) {
    final argument = this.argument as String;
    return bookById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookByIdHash() => r'1665577cdd767aab33ffada3bed2f8e5f42b3e66';

/// A single book by ID.

final class BookByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Book?>, String> {
  const BookByIdFamily._()
    : super(
        retry: null,
        name: r'bookByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A single book by ID.

  BookByIdProvider call(String id) =>
      BookByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'bookByIdProvider';
}

/// A single book by ISBN.

@ProviderFor(bookByIsbn)
const bookByIsbnProvider = BookByIsbnFamily._();

/// A single book by ISBN.

final class BookByIsbnProvider
    extends $FunctionalProvider<AsyncValue<Book?>, Book?, FutureOr<Book?>>
    with $FutureModifier<Book?>, $FutureProvider<Book?> {
  /// A single book by ISBN.
  const BookByIsbnProvider._({
    required BookByIsbnFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookByIsbnProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookByIsbnHash();

  @override
  String toString() {
    return r'bookByIsbnProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Book?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Book?> create(Ref ref) {
    final argument = this.argument as String;
    return bookByIsbn(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookByIsbnProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookByIsbnHash() => r'46b3aceba6e874c5b2a305e052ff88ab3cfe6a6e';

/// A single book by ISBN.

final class BookByIsbnFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Book?>, String> {
  const BookByIsbnFamily._()
    : super(
        retry: null,
        name: r'bookByIsbnProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A single book by ISBN.

  BookByIsbnProvider call(String isbn) =>
      BookByIsbnProvider._(argument: isbn, from: this);

  @override
  String toString() => r'bookByIsbnProvider';
}

/// Books filtered by shelf ID.

@ProviderFor(booksByShelf)
const booksByShelfProvider = BooksByShelfFamily._();

/// Books filtered by shelf ID.

final class BooksByShelfProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          Stream<List<Book>>
        >
    with $FutureModifier<List<Book>>, $StreamProvider<List<Book>> {
  /// Books filtered by shelf ID.
  const BooksByShelfProvider._({
    required BooksByShelfFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'booksByShelfProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$booksByShelfHash();

  @override
  String toString() {
    return r'booksByShelfProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Book>> create(Ref ref) {
    final argument = this.argument as String;
    return booksByShelf(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BooksByShelfProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$booksByShelfHash() => r'b65088b5463d672e508d31758e43160f9669bf0a';

/// Books filtered by shelf ID.

final class BooksByShelfFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Book>>, String> {
  const BooksByShelfFamily._()
    : super(
        retry: null,
        name: r'booksByShelfProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Books filtered by shelf ID.

  BooksByShelfProvider call(String shelfId) =>
      BooksByShelfProvider._(argument: shelfId, from: this);

  @override
  String toString() => r'booksByShelfProvider';
}

/// Books filtered by reading status.

@ProviderFor(booksByReadingStatus)
const booksByReadingStatusProvider = BooksByReadingStatusFamily._();

/// Books filtered by reading status.

final class BooksByReadingStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          Stream<List<Book>>
        >
    with $FutureModifier<List<Book>>, $StreamProvider<List<Book>> {
  /// Books filtered by reading status.
  const BooksByReadingStatusProvider._({
    required BooksByReadingStatusFamily super.from,
    required ReadingStatus super.argument,
  }) : super(
         retry: null,
         name: r'booksByReadingStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$booksByReadingStatusHash();

  @override
  String toString() {
    return r'booksByReadingStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Book>> create(Ref ref) {
    final argument = this.argument as ReadingStatus;
    return booksByReadingStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BooksByReadingStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$booksByReadingStatusHash() =>
    r'48df49e26bd7899d6aa4f155f06889543e0e2d9f';

/// Books filtered by reading status.

final class BooksByReadingStatusFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Book>>, ReadingStatus> {
  const BooksByReadingStatusFamily._()
    : super(
        retry: null,
        name: r'booksByReadingStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Books filtered by reading status.

  BooksByReadingStatusProvider call(ReadingStatus status) =>
      BooksByReadingStatusProvider._(argument: status, from: this);

  @override
  String toString() => r'booksByReadingStatusProvider';
}

/// Books that are currently loaned out.

@ProviderFor(loanedBooks)
const loanedBooksProvider = LoanedBooksProvider._();

/// Books that are currently loaned out.

final class LoanedBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          Stream<List<Book>>
        >
    with $FutureModifier<List<Book>>, $StreamProvider<List<Book>> {
  /// Books that are currently loaned out.
  const LoanedBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loanedBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loanedBooksHash();

  @$internal
  @override
  $StreamProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Book>> create(Ref ref) {
    return loanedBooks(ref);
  }
}

String _$loanedBooksHash() => r'20e30e592fd5d7bdfde50d91a92177b8031e63c6';

/// Search results for books.

@ProviderFor(searchBooks)
const searchBooksProvider = SearchBooksFamily._();

/// Search results for books.

final class SearchBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          FutureOr<List<Book>>
        >
    with $FutureModifier<List<Book>>, $FutureProvider<List<Book>> {
  /// Search results for books.
  const SearchBooksProvider._({
    required SearchBooksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchBooksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchBooksHash();

  @override
  String toString() {
    return r'searchBooksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Book>> create(Ref ref) {
    final argument = this.argument as String;
    return searchBooks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchBooksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchBooksHash() => r'e73a2c421ce479f872b1207c54f17ba6d858867c';

/// Search results for books.

final class SearchBooksFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Book>>, String> {
  const SearchBooksFamily._()
    : super(
        retry: null,
        name: r'searchBooksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Search results for books.

  SearchBooksProvider call(String query) =>
      SearchBooksProvider._(argument: query, from: this);

  @override
  String toString() => r'searchBooksProvider';
}

/// Notifier for book CRUD operations.

@ProviderFor(BooksNotifier)
const booksProvider = BooksNotifierProvider._();

/// Notifier for book CRUD operations.
final class BooksNotifierProvider
    extends $NotifierProvider<BooksNotifier, void> {
  /// Notifier for book CRUD operations.
  const BooksNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'booksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$booksNotifierHash();

  @$internal
  @override
  BooksNotifier create() => BooksNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$booksNotifierHash() => r'6d885ecae39ba25744b6b30ef5dae0cd3d792dda';

/// Notifier for book CRUD operations.

abstract class _$BooksNotifier extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
