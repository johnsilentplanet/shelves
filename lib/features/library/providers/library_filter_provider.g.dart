// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier for library filter state.

@ProviderFor(LibraryFilterNotifier)
const libraryFilterProvider = LibraryFilterNotifierProvider._();

/// Notifier for library filter state.
final class LibraryFilterNotifierProvider
    extends $NotifierProvider<LibraryFilterNotifier, LibraryFilter> {
  /// Notifier for library filter state.
  const LibraryFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryFilterNotifierHash();

  @$internal
  @override
  LibraryFilterNotifier create() => LibraryFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryFilter>(value),
    );
  }
}

String _$libraryFilterNotifierHash() =>
    r'acd79440a7dae30cbc282f8bc8790ccfeb86df23';

/// Notifier for library filter state.

abstract class _$LibraryFilterNotifier extends $Notifier<LibraryFilter> {
  LibraryFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LibraryFilter, LibraryFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LibraryFilter, LibraryFilter>,
              LibraryFilter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Filtered and sorted list of books.

@ProviderFor(filteredBooks)
const filteredBooksProvider = FilteredBooksProvider._();

/// Filtered and sorted list of books.

final class FilteredBooksProvider
    extends $FunctionalProvider<List<Book>, List<Book>, List<Book>>
    with $Provider<List<Book>> {
  /// Filtered and sorted list of books.
  const FilteredBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredBooksHash();

  @$internal
  @override
  $ProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Book> create(Ref ref) {
    return filteredBooks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Book> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Book>>(value),
    );
  }
}

String _$filteredBooksHash() => r'fe7c1d231642b36f5b94fa93e60eb1e64a430327';
