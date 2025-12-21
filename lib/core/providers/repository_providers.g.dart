// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the BookRepository instance.

@ProviderFor(bookRepository)
const bookRepositoryProvider = BookRepositoryProvider._();

/// Provides the BookRepository instance.

final class BookRepositoryProvider
    extends $FunctionalProvider<BookRepository, BookRepository, BookRepository>
    with $Provider<BookRepository> {
  /// Provides the BookRepository instance.
  const BookRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookRepositoryHash();

  @$internal
  @override
  $ProviderElement<BookRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BookRepository create(Ref ref) {
    return bookRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookRepository>(value),
    );
  }
}

String _$bookRepositoryHash() => r'68572d0646da48855ef945b2f47ac53ee0707823';

/// Provides the ShelfRepository instance.

@ProviderFor(shelfRepository)
const shelfRepositoryProvider = ShelfRepositoryProvider._();

/// Provides the ShelfRepository instance.

final class ShelfRepositoryProvider
    extends
        $FunctionalProvider<ShelfRepository, ShelfRepository, ShelfRepository>
    with $Provider<ShelfRepository> {
  /// Provides the ShelfRepository instance.
  const ShelfRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelfRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelfRepositoryHash();

  @$internal
  @override
  $ProviderElement<ShelfRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShelfRepository create(Ref ref) {
    return shelfRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShelfRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShelfRepository>(value),
    );
  }
}

String _$shelfRepositoryHash() => r'de4c3f2d5c0a8cec8c302abf1da5e1c635a3b79c';

/// Provides the RoomRepository instance.

@ProviderFor(roomRepository)
const roomRepositoryProvider = RoomRepositoryProvider._();

/// Provides the RoomRepository instance.

final class RoomRepositoryProvider
    extends $FunctionalProvider<RoomRepository, RoomRepository, RoomRepository>
    with $Provider<RoomRepository> {
  /// Provides the RoomRepository instance.
  const RoomRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roomRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roomRepositoryHash();

  @$internal
  @override
  $ProviderElement<RoomRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RoomRepository create(Ref ref) {
    return roomRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoomRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoomRepository>(value),
    );
  }
}

String _$roomRepositoryHash() => r'9b0b5df5fea0be3c6e17706c9b6c12c1c816bc9c';

/// Provides the MetadataRepository instance.

@ProviderFor(metadataRepository)
const metadataRepositoryProvider = MetadataRepositoryProvider._();

/// Provides the MetadataRepository instance.

final class MetadataRepositoryProvider
    extends
        $FunctionalProvider<
          MetadataRepository,
          MetadataRepository,
          MetadataRepository
        >
    with $Provider<MetadataRepository> {
  /// Provides the MetadataRepository instance.
  const MetadataRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'metadataRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$metadataRepositoryHash();

  @$internal
  @override
  $ProviderElement<MetadataRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MetadataRepository create(Ref ref) {
    return metadataRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MetadataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MetadataRepository>(value),
    );
  }
}

String _$metadataRepositoryHash() =>
    r'ca755e2b0ae8b55a320f3163cc68d5ddfea8e0b3';
