// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_service_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the FirestoreService instance.

@ProviderFor(firestoreService)
const firestoreServiceProvider = FirestoreServiceProvider._();

/// Provides the FirestoreService instance.

final class FirestoreServiceProvider
    extends
        $FunctionalProvider<
          FirestoreService,
          FirestoreService,
          FirestoreService
        >
    with $Provider<FirestoreService> {
  /// Provides the FirestoreService instance.
  const FirestoreServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreServiceHash();

  @$internal
  @override
  $ProviderElement<FirestoreService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirestoreService create(Ref ref) {
    return firestoreService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirestoreService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirestoreService>(value),
    );
  }
}

String _$firestoreServiceHash() => r'fba550683b4f381b987918ee5c340ee7574329b7';

/// Provides the FirebaseStorageService instance.

@ProviderFor(firebaseStorageService)
const firebaseStorageServiceProvider = FirebaseStorageServiceProvider._();

/// Provides the FirebaseStorageService instance.

final class FirebaseStorageServiceProvider
    extends
        $FunctionalProvider<
          FirebaseStorageService,
          FirebaseStorageService,
          FirebaseStorageService
        >
    with $Provider<FirebaseStorageService> {
  /// Provides the FirebaseStorageService instance.
  const FirebaseStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseStorageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseStorageServiceHash();

  @$internal
  @override
  $ProviderElement<FirebaseStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseStorageService create(Ref ref) {
    return firebaseStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseStorageService>(value),
    );
  }
}

String _$firebaseStorageServiceHash() =>
    r'790a901153206cc3d7d0534844267d4ce86c0e5f';

/// Provides the GoogleBooksApi instance.

@ProviderFor(googleBooksApi)
const googleBooksApiProvider = GoogleBooksApiProvider._();

/// Provides the GoogleBooksApi instance.

final class GoogleBooksApiProvider
    extends $FunctionalProvider<GoogleBooksApi, GoogleBooksApi, GoogleBooksApi>
    with $Provider<GoogleBooksApi> {
  /// Provides the GoogleBooksApi instance.
  const GoogleBooksApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleBooksApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleBooksApiHash();

  @$internal
  @override
  $ProviderElement<GoogleBooksApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoogleBooksApi create(Ref ref) {
    return googleBooksApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleBooksApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleBooksApi>(value),
    );
  }
}

String _$googleBooksApiHash() => r'247e46ee4842ead7e4e47e0569cab40b0680078f';

/// Provides the OpenLibraryApi instance.

@ProviderFor(openLibraryApi)
const openLibraryApiProvider = OpenLibraryApiProvider._();

/// Provides the OpenLibraryApi instance.

final class OpenLibraryApiProvider
    extends $FunctionalProvider<OpenLibraryApi, OpenLibraryApi, OpenLibraryApi>
    with $Provider<OpenLibraryApi> {
  /// Provides the OpenLibraryApi instance.
  const OpenLibraryApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openLibraryApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openLibraryApiHash();

  @$internal
  @override
  $ProviderElement<OpenLibraryApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OpenLibraryApi create(Ref ref) {
    return openLibraryApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpenLibraryApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpenLibraryApi>(value),
    );
  }
}

String _$openLibraryApiHash() => r'7a27d082e11fbbf32ff632a17796350edb1f4669';
