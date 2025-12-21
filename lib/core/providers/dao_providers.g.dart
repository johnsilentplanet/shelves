// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dao_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the BooksDao instance.

@ProviderFor(booksDao)
const booksDaoProvider = BooksDaoProvider._();

/// Provides the BooksDao instance.

final class BooksDaoProvider
    extends $FunctionalProvider<BooksDao, BooksDao, BooksDao>
    with $Provider<BooksDao> {
  /// Provides the BooksDao instance.
  const BooksDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'booksDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$booksDaoHash();

  @$internal
  @override
  $ProviderElement<BooksDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BooksDao create(Ref ref) {
    return booksDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BooksDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BooksDao>(value),
    );
  }
}

String _$booksDaoHash() => r'4db36c9205d444bcdb524e048efcbe4ae0647720';

/// Provides the ShelvesDao instance.

@ProviderFor(shelvesDao)
const shelvesDaoProvider = ShelvesDaoProvider._();

/// Provides the ShelvesDao instance.

final class ShelvesDaoProvider
    extends $FunctionalProvider<ShelvesDao, ShelvesDao, ShelvesDao>
    with $Provider<ShelvesDao> {
  /// Provides the ShelvesDao instance.
  const ShelvesDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelvesDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelvesDaoHash();

  @$internal
  @override
  $ProviderElement<ShelvesDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShelvesDao create(Ref ref) {
    return shelvesDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShelvesDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShelvesDao>(value),
    );
  }
}

String _$shelvesDaoHash() => r'bff8dafedd79b251b1795d15364487a8a30c1197';

/// Provides the RoomsDao instance.

@ProviderFor(roomsDao)
const roomsDaoProvider = RoomsDaoProvider._();

/// Provides the RoomsDao instance.

final class RoomsDaoProvider
    extends $FunctionalProvider<RoomsDao, RoomsDao, RoomsDao>
    with $Provider<RoomsDao> {
  /// Provides the RoomsDao instance.
  const RoomsDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roomsDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roomsDaoHash();

  @$internal
  @override
  $ProviderElement<RoomsDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RoomsDao create(Ref ref) {
    return roomsDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoomsDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoomsDao>(value),
    );
  }
}

String _$roomsDaoHash() => r'2e610ca5d5bc68035b82b43036e8f2220fad5e5d';
