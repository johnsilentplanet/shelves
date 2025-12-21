// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Books that are currently being read.

@ProviderFor(currentlyReadingBooks)
const currentlyReadingBooksProvider = CurrentlyReadingBooksProvider._();

/// Books that are currently being read.

final class CurrentlyReadingBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          Stream<List<Book>>
        >
    with $FutureModifier<List<Book>>, $StreamProvider<List<Book>> {
  /// Books that are currently being read.
  const CurrentlyReadingBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentlyReadingBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentlyReadingBooksHash();

  @$internal
  @override
  $StreamProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Book>> create(Ref ref) {
    return currentlyReadingBooks(ref);
  }
}

String _$currentlyReadingBooksHash() =>
    r'8245011f93ffa1d688717bd73369a66cf436cf0e';

/// Books that have been read, sorted by date read (most recent first).

@ProviderFor(recentlyReadBooks)
const recentlyReadBooksProvider = RecentlyReadBooksProvider._();

/// Books that have been read, sorted by date read (most recent first).

final class RecentlyReadBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          Stream<List<Book>>
        >
    with $FutureModifier<List<Book>>, $StreamProvider<List<Book>> {
  /// Books that have been read, sorted by date read (most recent first).
  const RecentlyReadBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentlyReadBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentlyReadBooksHash();

  @$internal
  @override
  $StreamProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Book>> create(Ref ref) {
    return recentlyReadBooks(ref);
  }
}

String _$recentlyReadBooksHash() => r'9b75876d66a0967f1674fbee10e8dd4d10c6a1a0';

/// Books in the "to read" list.

@ProviderFor(toReadBooks)
const toReadBooksProvider = ToReadBooksProvider._();

/// Books in the "to read" list.

final class ToReadBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          Stream<List<Book>>
        >
    with $FutureModifier<List<Book>>, $StreamProvider<List<Book>> {
  /// Books in the "to read" list.
  const ToReadBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toReadBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toReadBooksHash();

  @$internal
  @override
  $StreamProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Book>> create(Ref ref) {
    return toReadBooks(ref);
  }
}

String _$toReadBooksHash() => r'5dc890ae81421b565a259c4f9f4dc83c623209e6';

/// Count of books currently being read.

@ProviderFor(currentlyReadingCount)
const currentlyReadingCountProvider = CurrentlyReadingCountProvider._();

/// Count of books currently being read.

final class CurrentlyReadingCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// Count of books currently being read.
  const CurrentlyReadingCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentlyReadingCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentlyReadingCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return currentlyReadingCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentlyReadingCountHash() =>
    r'1394f3612239be5520fea4fae5b3d020f0ac8468';

/// Count of books read this year.

@ProviderFor(booksReadThisYear)
const booksReadThisYearProvider = BooksReadThisYearProvider._();

/// Count of books read this year.

final class BooksReadThisYearProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// Count of books read this year.
  const BooksReadThisYearProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'booksReadThisYearProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$booksReadThisYearHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return booksReadThisYear(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$booksReadThisYearHash() => r'32947d0b14bdda98d60fac5c83ceff3867eef8ec';

/// Notifier for reading progress operations.

@ProviderFor(ReadingProgressNotifier)
const readingProgressProvider = ReadingProgressNotifierProvider._();

/// Notifier for reading progress operations.
final class ReadingProgressNotifierProvider
    extends $NotifierProvider<ReadingProgressNotifier, void> {
  /// Notifier for reading progress operations.
  const ReadingProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'readingProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$readingProgressNotifierHash();

  @$internal
  @override
  ReadingProgressNotifier create() => ReadingProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$readingProgressNotifierHash() =>
    r'08aff9c05282c1304d931bb26b1938c15d27702f';

/// Notifier for reading progress operations.

abstract class _$ReadingProgressNotifier extends $Notifier<void> {
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
